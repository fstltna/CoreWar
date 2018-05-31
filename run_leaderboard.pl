#!/usr/bin/perl
#
# Creates the status table for CoreWar
my $StatsFileOutput = "/sbbs/doors/corewar/stats.txt";
my $StatsFileHtmlOutput = "/var/www/html/corewar";
my $CorewarExe = "/sbbs/doors/corewar/pmars";
my $WarriorDir = "/sbbs/doors/corewar/players";

# No changes below here...
my @Warriors = ();
my %WarriorName;
my %WarriorAuthor;
my %Wins;
my %Losses;
my %Draws;
my $FindCmd = "/usr/bin/find $WarriorDir -print|/bin/grep -v Olympus|/bin/grep \.red";
my $TextHeader = << "EOT";
Warrior Name | Warrior Author | Wins | Losses | Draws
=====================================================
EOT

my $HTMLHeader = << "EOT";
<html>
<head>
<title>CoreWar Leaderboard</title>
</head>
<body>
<h1 align=center>CoreWar Leaderboard</h1>
<table border=1>
<tr bgcolor=\"#DDDDDD\"><td>Warrior Name</td><td>Warrior Author</td><td>Wins</td><td>Losses</td><td>Draw</td></tr>
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
	$Wins{$curwar} = 0;
	$Losses{$curwar} = 0;
	$Draws{$curwar} = 0;
}

# Create the stats dir if non existing
system("mkdir -p $StatsFileHtmlOutput");

# Open up text output file
open(OUTFH, '>', $StatsFileOutput) or die $!;
print(OUTFH $TextHeader);

# Open up html output file
open(OUTHTMLFH, '>', "$StatsFileHtmlOutput/index.html") or die $!;
print(OUTHTMLFH $HTMLHeader);

# Now do actual warrior testing
my @Warriors = `$FindCmd`;
chomp(@Warriors);
foreach $CurWarrior (@Warriors)
{
	ReadWarrior($CurWarrior);
}





foreach $CurWarrior (@Warriors)
{
	print(OUTFH "$WarriorName{$CurWarrior} | $WarriorAuthor{$CurWarrior} | $Wins{$CurWarrior} | $Losses{$CurWarrior} | $Draws{$CurWarrior}\n");
	print(OUTHTMLFH "<tr><td>$WarriorName{$CurWarrior}</td><td>$WarriorAuthor{$CurWarrior}</td><td>$Wins{$CurWarrior}</td><td>$Losses{$CurWarrior}</td><td>$Draws{$CurWarrior}</td></tr>\n");
}

close(OUTFH);
print(OUTHTMLFH $HTMLFooter);
close(OUTHTMLFH);
exit 0;
