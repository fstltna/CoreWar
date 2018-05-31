#!/usr/bin/perl
#
# Creates the status table for CoreWar
my $StatsFileOutput = "/sbbs/doors/corewar/stats.txt";
my $StatsFileHtmlOutput = "/var/www/html/corewar";
my $CorewarExe = "/sbbs/doors/corewar/pmars";
my $WarriorDir = "/sbbs/doors/corewar/players";
my $Rounds = 10;

# No changes below here...

my @Warriors = ();
my %WarriorName;
my %WarriorAuthor;
my %WarriorError;
my %Wins;
my %Losses;
my %Draws;
my $FindCmd = "/usr/bin/find $WarriorDir -print|/bin/grep -v Olympus|/bin/grep \.red";
my $TextHeader = << "EOT";
CoreWar Leaderboard
Rounds per game: $Rounds

Warrior Name                  | Warrior Author       | Wins | Loss | Draw
============================================================================
EOT

my $HTMLHeader = << "EOT";
<html>
<head>
<title>CoreWar Leaderboard</title>
<script src="sorttable.js"></script>
</head>
<body>
<h1 align=center>CoreWar Leaderboard</h1>
<p align=center>Rounds per game: $Rounds</p>
<table class="sortable" border=1 align=center>
<tr bgcolor=\"#DDDDDD\"><td>Warrior Name</td><td>Warrior Author</td><td>Wins</td><td>Losses</td><td>Draw</td><td>Errors</td></tr>
EOT

my $HTMLFooter = << "EOT";
</table>
</body>
</html>
EOT

sub ReadWarrior
{
	my $curwar = shift;
	my $curWarName = "";
	my $curWarAuth = "";
	#print "Opening warrior $curwar\n";
	open(WarriorFH, '<', $curwar) or die $!;
	while(<WarriorFH>)
	{
		chomp;
		if (lc(substr($_, 0, 5)) eq ";name")
		{
			$curWarName = substr($_, 6);
		}
		elsif (lc(substr($_, 0, 7)) eq ";author")
		{
			$curWarAuth = substr($_, 8);
		}
	}
	close(WarriorFH);
	if ($curWarName eq "")
	{
		$WarriorName{$curwar} = $curwar;
	}
	else
	{
		$WarriorName{$curwar} = $curWarName;
	}
	$WarriorAuthor{$curwar} = $curWarAuth;
	$WarriorError{$curwar} = 0;
	$Wins{$curwar} = 0;
	$Losses{$curwar} = 0;
	$Draws{$curwar} = 0;
}

# Create the stats dir if non existing
system("mkdir -p $StatsFileHtmlOutput");
system("cp sorttable.js $StatsFileHtmlOutput");


# Open up text output file
open(OUTFH, '>', $StatsFileOutput) or die $!;
print(OUTFH $TextHeader);

# Open up html output file
open(OUTHTMLFH, '>', "$StatsFileHtmlOutput/index.html") or die $!;
print(OUTHTMLFH $HTMLHeader);

# Now do actual warrior testing
my @Warriors = `$FindCmd`;
chomp(@Warriors);

my $NumCompiled = 0;

# Read in all warriors data
foreach $CurWarrior (@Warriors)
{
	ReadWarrior($CurWarrior);
	#print "Compiling $CurWarrior\n";
	my @CompileResults = `$CorewarExe -b $CurWarrior 2>&1`;
	chomp(@CompileResults);
	my $NumErrors = 0;
	foreach $CurCompile (@CompileResults)
	{
		#print "results: $CurCompile\n";
		if (substr($CurCompile, 0, 16) eq "Number of errors")
		{
			$NumErrors = substr($CurCompile, 17);
		}
	}
	$WarriorError{$CurWarrior} = $NumErrors;
	if ($NumErrors == 0)
	{
		$NumCompiled++;
	}
}
print "Compiled $NumCompiled warriors\n";

# Run the battles
foreach $CurWarrior (@Warriors)
{
	# Make sure bot had no errors
	if ($WarriorError{$CurWarrior} == 0)
	{
		#print "Working on $CurWarrior\n";
		my @BattleResults = `$CorewarExe -r $Rounds -b $CurWarrior 2>/dev/null`;
		chomp(@BattleResults);
		foreach $CurResult (@BattleResults)
		{
			print "Results: $CurResult\n";
		}
	}
}

# Store data into tables
foreach $CurWarrior (@Warriors)
{
	my $NameField = (substr($WarriorName{$CurWarrior} . "                          ", 0, 29));
	my $AuthorField = (substr($WarriorAuthor{$CurWarrior} . "                          ", 0, 20));
	my $WinsField = (substr($Wins{$CurWarrior} . "                          ", 0, 4));
	my $LossesField = (substr($Losses{$CurWarrior} . "                          ", 0, 4));
	print(OUTFH "$NameField | $AuthorField | $WinsField | $LossesField | $Draws{$CurWarrior}\n");
	print(OUTHTMLFH "<tr><td>$WarriorName{$CurWarrior}</td><td>$WarriorAuthor{$CurWarrior}</td><td>$Wins{$CurWarrior}</td><td>$Losses{$CurWarrior}</td><td>$Draws{$CurWarrior}</td><td>$WarriorError{$CurWarrior}</td></tr>\n");
}

close(OUTFH);
print(OUTHTMLFH $HTMLFooter);
close(OUTHTMLFH);
exit 0;
