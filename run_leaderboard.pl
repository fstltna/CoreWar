#!/usr/bin/perl
#
# Creates the status table for CoreWar
my $StatsFileOutput = "/sbbs/doors/corewar/stats.txt";
my $StatsFileHtmlOutput = "/var/www/html/corewar";
my $CorewarExe = "/sbbs/doors/corewar/pmars";

# No changes below here...
my @Warriors = ();
my %WarriorName;
my %WarriorAuthor;
my %Wins;
my %Losses;
my %Draws;
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

# Create the stats dir if non existing
system("mkdir -p $StatsFileHtmlOutput");

# Open up text output file
open(OUTFH, '>', $StatsFileOutput) or die $!;
print(OUTFH $TextHeader);

# Open up html output file
open(OUTHTMLFH, '>', "$StatsFileHtmlOutput/index.html") or die $!;
print(OUTHTMLFH $HTMLHeader);

foreach $CurWarrior (@Warriors)
{
	print(OUTFH "$warriorName | $WarriorAuthor | $Wins | $Losses | $Draws");
	print(OUTHTMLFH "<tr><td>$warriorName</td><td>$WarriorAuthor</td><td>$Wins</td><td>$Losses</td><td>$Draws</td></tr>");
}

close(OUTFH);
print(OUTHTMLFH $HTMLFooter);
close(OUTHTMLFH);
exit 0;
