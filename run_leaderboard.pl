#!/usr/bin/perl
#

use String::Scanf;

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
my %WarriorEmail;
my %WarriorWebsite;
my %WarriorError;
my %Wins;
my %Losses;
my %Draws;
my $SeenWarriors = 0;

my $FindCmd = "/usr/bin/find $WarriorDir -print|/bin/grep -v Olympus|/bin/grep \.red";
my $now_string = localtime;

my $TextHeader = << "EOT";
CoreWar Leaderboard
Rounds per game: $Rounds

Last Update: $now_string

Warrior Name                  | Warrior Author   | Wins | Loss | Draw | Err
===========================================================================
EOT

my $HTMLHeader = << "EOT";
<html>
<head>
<title>CoreWar Leaderboard</title>
<script src="sorttable.js"></script>
</head>
<body>
<h1 align=center>CoreWar Leaderboard</h1>
<p align=center>Last Update: $now_string</p>
<p align=center>Rounds per game: $Rounds</p>
<p align=center>Click Field Name To Sort</p>
<table class="sortable" border=1 align=center>
<tr bgcolor=\"#DDDDDD\"><td>Warrior Name</td><td>Warrior Author</td><td>Wins</td><td>Losses</td><td>Draw</td><td>Errors</td></tr>
EOT

sub ReadWarrior
{
	my $curwar = shift;
	my $curWarName = "";
	my $curWarAuth = "";
	my $curWarEmail = "";
	my $curWarWebsite = "";
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
		elsif (lc(substr($_, 0, 6)) eq ";email")
		{
			$curWarEmail = substr($_, 7);
		}
		elsif (lc(substr($_, 0, 8)) eq ";website")
		{
			$curWarWebsite = substr($_, 9);
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
	$WarriorEmail{$curwar} = $curWarEmail;
	$WarriorWebsite{$curwar} = $curWarWebsite;
	$WarriorError{$curwar} = 0;
	$Wins{$curwar} = 0;
	$Losses{$curwar} = 0;
	$Draws{$curwar} = 0;
	$SeenWarriors++;
}

# Create the stats dir if non existing
system("mkdir -p $StatsFileHtmlOutput");
system("cp /sbbs/doors/corewar/sorttable.js $StatsFileHtmlOutput");


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
	# Make sure warrior had no errors
	if ($WarriorError{$CurWarrior} == 0)
	{
		foreach $CurChallenger (@Warriors)
		{
			if (($CurWarrior ne $CurChallenger) && ($WarriorError{$CurChallenger} == 0))
			{
				#print "Working on $CurWarrior\n";
				my @BattleResults = `$CorewarExe -r $Rounds -b $CurWarrior $CurChallenger 2>/dev/null`;
				chomp(@BattleResults);
				foreach $CurResult (@BattleResults)
				{
					my $FirstLine = 1;
					if (substr($CurResult, 0, 8) ne "Results:")
					{
						($a) = sscanf(" scores %d", $CurResult);
						#print "Results: $CurResult $a\n";
						if ($FirstLine == 1)
						{
							$FirstLine = 0;
							$Wins{$CurWarrior} += $a;
						}
						else
						{
							$Wins{$CurChallenger} += $a;
						}
					}
				}
			}
#			my $foo = getc();
		}
	}
}

# Store data into tables
foreach $CurWarrior (@Warriors)
{
	$TempStr = $WarriorName{$CurWarrior};
	$TempStr =~ s/^\s+|\s+$//g;
	my $NameField = (substr($TempStr . "                          ", 0, 29));
	$TempStr = $WarriorAuthor{$CurWarrior};
	$TempStr =~ s/^\s+|\s+$//g;
	my $AuthorField = (substr($TempStr . "                          ", 0, 16));
	my $EmailField = $WarriorEmail{$CurWarrior};
	$EmailField =~ s/^\s+|\s+$//g;
	if ($EmailField ne "")
	{
		$EmailField = " <a href=\"mailto:$EmailField\">Send Email</a>";
	}
	my $WebsiteField = $WarriorWebsite{$CurWarrior};
	$WebsiteField =~ s/^\s+|\s+$//g;
	if ($WebsiteField ne "")
	{
		$WebsiteField = " <a href=\"$WebsiteField\">Visit Website</a>";
	}
	my $WinsField = (substr($Wins{$CurWarrior} . "                          ", 0, 4));
	my $LossesField = (substr($Losses{$CurWarrior} . "                          ", 0, 4));
	my $DrawField = (substr($Draws{$CurWarrior} . "                          ", 0, 4));
	my $ErrorsField = (substr($Losses{$CurWarrior} . "                          ", 0, 2));
	my $TrimmedErrors = $WarriorError{$CurWarrior};
	$TrimmedErrors =~ s/^\s+|\s+$//g;
	print(OUTFH "$NameField | $AuthorField | $WinsField | $LossesField | $DrawField | $TrimmedErrors\n");
	print(OUTHTMLFH "<tr><td>$WarriorName{$CurWarrior}$WebsiteField</td><td>$WarriorAuthor{$CurWarrior}$EmailField</td><td>$Wins{$CurWarrior}</td><td>$Losses{$CurWarrior}</td><td>$Draws{$CurWarrior}</td><td>$WarriorError{$CurWarrior}</td></tr>\n");
}
print(OUTFH "Saw $SeenWarriors total warriors\n");

close(OUTFH);
my $HTMLFooter = << "EOT";
</table>
<p>Saw $SeenWarriors total warriors</p>
</body>
</html>
EOT
print(OUTHTMLFH $HTMLFooter);
close(OUTHTMLFH);
exit 0;
