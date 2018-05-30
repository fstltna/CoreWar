#!/usr/bin/perl
use strict;
use warnings;

use UI::Dialog;
use Term::ReadKey;
use Term::ANSIScreen qw(cls);

my $StatsFileOutput = "/sbbs/doors/corewar/stats.txt";
my $FileEditor = "/bin/nano -R";
my $CorewarExe = "/sbbs/doors/corewar/pmars";

###################################################
# No changes below here
###################################################

my $CR_ver = "0.7";
my $Record = "false";	# Are results saved?
my $TempDir = "/tmp";
my $WarriorName = "";
my $BotVersion = "";

# Set UserName from command line
my $UserName = $ARGV[0];
if (!$UserName)
{
	print "You must supply the username as first argument!\n";
	exit 0;
}

# Create the users dir if non existing
system("mkdir -p /sbbs/doors/corewar/players/$UserName");

my $d = new UI::Dialog ( backtitle => "CoreWar Version v$CR_ver", height => 20, width => 65, listheight => 5,
	order => [ 'ascii', 'cdialog', 'xdialog' ]);

my $windowtitle = "Welcome to CoreWar!";
my $enjoyedtitle = "We hope you enjoyed CoreWar!";
my $introtext =
"Welcome to the classic programming game!
At the beginning of a game, each battle program is loaded into memory at a random location, after which each program executes one instruction in turn. The goal of the game is to cause the processes of opposing programs to terminate (which happens if they execute an invalid instruction), leaving the victorious program in sole possession of the machine.";

$d->msgbox( title => $windowtitle, text => $introtext );

if (($d->state() eq "ESC") || ($d->state() eq "CANCEL"))
{
	exit 0;
}

my $menuselection = "";

sub MainMenu
{
	$menuselection = $d->menu( title => 'Main Menu', text => 'Select one:',
                            list => [ '1', 'Manage Your Bots',
                                      '2', 'Debug Your Bots',
                                      '3', 'Battle Arena',
                                      '4', 'Test Bench',
                                      '5', 'Battle Stats' ] );
}

sub GetBotVersion
{
	my $SourceString = shift;
	my $SourcePos = rindex($SourceString, ':');
	my $SourceName = substr($SourceString, $SourcePos + 2);
	$SourceName = substr($SourceName, 0, length($SourceName) - 3);
	$BotVersion = $SourceName;
}
sub GetBotName
{
	my $SourceString = shift;
	my $SourcePos = rindex($SourceString, ':');
	my $SourceName = substr($SourceString, $SourcePos + 2);
	$SourceName = substr($SourceName, 0, length($SourceName) - 3);
	$WarriorName = $SourceName;
}

# Reads and parses header in warrior file
sub ReadBot
{
	my $WarriorFile = shift;
	$WarriorName = "UnknownWarrior";
	$BotVersion = "???";
	open(ROBOTFH, '<', $WarriorFile) or die "Unable to read warrior file $WarriorFile: $!";
	while(<ROBOTFH>)
	{
		chop;
		if (substr($_, 0, 11) eq "/* Version:")
		{
			GetBotVersion($_)
		}
		elsif (substr($_, 0, 11) eq "/* BotName:")
		{
			GetBotName($_)
		}
	}
	close(ROBOTFH);
}

sub ManageBots
{
	my $selectbot = $d->fselect( title => "Select Your Bot To Manage", path => "/sbbs/doors/corewar/players/$UserName" );
	$selectbot =~ s/\s+/_/g;
	$selectbot =~ s/</_/g;
	$selectbot =~ s/>/_/g;

	if ($d->state() ne "OK")
	{
		$d->msgbox( title => "Selected Warrior:", text => "No warrior selected, aborting..." );
		return;
	}

	if (substr($selectbot, -2) ne ".red")
	{
		$d->msgbox( title => "Selected Warrior:", text => "File is not a warrior, aborting... To create a warrior end the name with \".red\"" );
		return;
	}

	my $PathString = "/sbbs/doors/corewar/players/$UserName";
	if (substr($selectbot, 0, length($PathString)) ne $PathString)
	{
		$d->msgbox( title => "Selected Warrior:", text => "Can only manage warriors you own, aborting..." );
		return;
	}
	# Does selection exist?
	if (! -f "$selectbot")
	{
		# no
		my $BotNamePos = rindex($selectbot, '/');
		my $BotName = substr($selectbot, $BotNamePos + 1);
		$d->msgbox( title => "Selected Warrior:", text => "Warrior \"$selectbot\" will be created..." );
		open(MYFH, '>', $selectbot) or die $!;
		print MYFH "/* Version: 1.0 */\n";
		print MYFH "/* BotName: $BotName */\n";
		print MYFH "/* Owner: $UserName */\n";
		close(MYFH);
	}
	system ("$FileEditor \"$selectbot\"");
}

sub DebugBot
{
	my $selectbot = $d->fselect( title => "Select Your Bot To Debug", path => "/sbbs/doors/corewar/players/$UserName" );
	$selectbot =~ s/\s+/_/g;
	$selectbot =~ s/</_/g;
	$selectbot =~ s/>/_/g;

	if ($d->state() ne "OK")
	{
		$d->msgbox( title => "Selected Warrior:", text => "No warrior selected, aborting..." );
		return;
	}

	if (substr($selectbot, -2) ne ".red")
	{
		$d->msgbox( title => "Selected Warrior:", text => "File is not a warrior, aborting..." );
		return;
	}

	my $PathString = "/sbbs/doors/corewar/players/$UserName";
	if (substr($selectbot, 0, length($PathString)) ne $PathString)
	{
		$d->msgbox( title => "Selected Warrior:", text => "Can only debug warriors you own, aborting..." );
		return;
	}
	# Does selection exist?
	if (! -f "$selectbot")
	{
		# no
		$d->msgbox( title => "Selected Warrior:", text => "Warrior must exist, aborting..." );
		return;
	}
	# Debug the bot
	my $GameCommand = "$CorewarExe -d \"$selectbot\"";
	system($GameCommand);
	$d->msgbox( title => "Debug Completed", text => "Completed debugging this bot..." );
}

sub BattleArena
{
	my $Mode = shift;
	if ($Mode eq "Battle")
	{
		#$d->msgbox( title => "Chose battle mode", text => "battle on" );
		$Record = "true";
	}
	else
	{
		#$d->msgbox( title => "Chose practice mode", text => "testing on" );
		$Record = "false";
	}
	my @selection1 = $d->checklist( title => "Select Testing Warriors", text => 'Select up to 3: (If you choose more than 3 only first 3 will be used)',
                                 list => [ '1', [ 'aeka.red', 0 ],
                                           '2', [ 'bubbly_hort.red', 0 ],
                                           '3', [ 'fern.red', 0 ],
                                           '4', [ 'flashpaper.red', 0 ],
                                           '5', [ 'pspace.red', 1 ],
                                           '6', [ 'rave.red', 1 ],
                                           '7', [ 'shelter.red', 1 ],
                                           '8', [ 'validate.red', 1 ] ]
                               );

	my @ActiveWarriors = ();
	my @ActiveWarriorsFull = ();
	my $AddedBots = 0;
	foreach my $CurBot (@selection1)
	{
		if ($AddedBots < 3)
		{
			if ($CurBot == 1)
			{
				push (@ActiveWarriors, "aeka.red");
				push (@ActiveWarriorsFull, "/sbbs/doors/corewar/warriors/aeka.red");
			}
			elsif ($CurBot == 2)
			{
				push (@ActiveWarriors, "flashpaper.red");
				push (@ActiveWarriorsFull, "/sbbs/doors/corewar/warriors/flashpaper.red");
			}
			elsif ($CurBot == 3)
			{
				push (@ActiveWarriors, "pspace.red");
				push (@ActiveWarriorsFull, "/sbbs/doors/corewar/warriors/pspace.red");
			}
			elsif ($CurBot == 4)
			{
				push (@ActiveWarriors, "rave.red");
				push (@ActiveWarriorsFull, "/sbbs/doors/corewar/warriors/rave.red");
			}
			elsif ($CurBot == 5)
			{
				push (@ActiveWarriors, "validate.red");
				push (@ActiveWarriorsFull, "/sbbs/doors/corewar/warriors/validate.red");
			}
			$AddedBots++;
		}
	}
	if ($AddedBots > 0)
	{
		$d->msgbox( title => "You have selected these training warriors:", text => "@ActiveWarriors" );
	}
	else
	{
		$d->msgbox( title => "You have selected these training warriors:", text => "No Warriors Selected" );
	}
	my $NotAbort = -1;
	while (($AddedBots < 3) && $NotAbort)
	{
		my $selectbot = $d->fselect( title => "Select Your or Other Player Bots:", path => "/sbbs/doors/corewar/players/$UserName" );
		$selectbot =~ s/\s+/_/g;
		$selectbot =~ s/</_/g;
		$selectbot =~ s/>/_/g;
		if ($d->state() ne "OK")
		{
			$d->msgbox( title => "Selected Warrior:", text => "No warrior selected..." );
			$NotAbort = 0;
		}
		else
		{
			if (substr($selectbot, -2) ne ".red")
			{
				$d->msgbox( title => "Selected Warrior:", text => "File is not a warrior..." );
				return;
			}
			else
			{
				# Does selection exist?
				if (! -f "$selectbot")
				{
					# no
					$d->msgbox( title => "Selected Warrior:", text => "Warrior must exist!" );
				}
				else
				{
					$AddedBots++;
					push (@ActiveWarriorsFull, $selectbot);
				}
			}
		}
	}
	my $selectbot = $d->fselect( title => "Select Your Bot To Be Ranked:", path => "/sbbs/doors/corewar/players/$UserName" );
	$selectbot =~ s/\s+/_/g;
	$selectbot =~ s/</_/g;
	$selectbot =~ s/>/_/g;
	if ($d->state() ne "OK")
	{
		$d->msgbox( title => "Selected Warrior:", text => "No warrior selected, aborting..." );
		return;
	}
	if (substr($selectbot, -2) ne ".red")
	{
		$d->msgbox( title => "Selected Warrior:", text => "File is not a warrior, aborting..." );
		return;
	}
	my $PathString = "/sbbs/doors/corewar/players/$UserName";
	if (substr($selectbot, 0, length($PathString)) ne $PathString)
	{
		$d->msgbox( title => "Selected Warrior:", text => "Can only rank warriors you own, aborting..." );
		return;
	}
	# Does selection exist?
	if (! -f "$selectbot")
	{
		# no
		$d->msgbox( title => "Selected Warrior:", text => "Warrior must exist!" );
		return;
	}
	# Execute the game
	my $GameCommand = "$CorewarExe \"$selectbot\"";
	foreach my $curbot (@ActiveWarriorsFull)
	{
		$GameCommand = sprintf("%s \"%s\"", $GameCommand, $curbot);
	}
	system($GameCommand);
	# Check results
	if ($? == 1)
	{
		# Command failed - no saving
		$d->msgbox( title => "Game Progress:", text => "Game Aborted..." );
		return;
	}
	my $DidWin = 1;
	if ($? > 9)
	{
		$DidWin = 0;
	}
	if ($Record eq "false")
	{
		# Not saving results
		$d->msgbox( title => "Game Progress:", text => "Game results not being saved..." );
		return;
	}
	# Read In Bot Details
	ReadBot($selectbot);
	my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
	$year += 1900;
	$mon += 1;
	my $TempOut = "$TempDir/corewar-$year-$mon-$mday-$hour-$min-$sec";
	my $GameDate = sprintf("%04d%02d%02d", $year, $mon, $mday);
	open(MYFH, '>', $TempOut) or die "Could not create file '$TempOut' $!";
	print MYFH "Player=$UserName
BotName=$WarriorName
BotVersion=$BotVersion
NumWins=$DidWin
GameDate=$GameDate
NumBattles=1\n";
	close(MYFH);
}

sub BattleStats
{
	my $clear_screen = cls();
	print $clear_screen;
	open(my $fh, '<', $StatsFileOutput) or die "Could not open file '$StatsFileOutput' $!";
	my $NumLine = 0;
	my $key = "";
	while (my $row = <$fh>)
	{
		chomp $row;
		print "$row\n";
		$NumLine++;
		if ($NumLine == 23)
		{
			print "--- Press Any Key For More ---\n";
			ReadMode 4; # Turn off controls keys
			while (not defined ($key = ReadKey(-1)))
			{
				# No key yet
			}
			ReadMode 0; # Reset tty mode before exiting
			$NumLine = 0;
		}
	}
	#$d->msgbox( title => "Output", text => $StatsFileOutput );
	print "--- Press Any Key To End ---\n";
	ReadMode 4; # Turn off controls keys
	while (not defined ($key = ReadKey(-1)))
	{
		# No key yet
	}
	ReadMode 0; # Reset tty mode before exiting
	close ($fh);
}

while (-1)
{
	MainMenu();
	if (($menuselection eq "CANCEL") || ($menuselection eq "ESC") || ($menuselection eq ""))
	{
		$d->msgbox( title => $enjoyedtitle, text => "Thanks for playing..." );
		exit 0;
	}
	if ($menuselection eq "1")
	{
		ManageBots();
	}
	elsif ($menuselection eq "2")
	{
		DebugBot();
	}
	elsif ($menuselection eq "3")
	{
		BattleArena("Battle");
	}
	elsif ($menuselection eq "4")
	{
		BattleArena("Test");
	}
	elsif ($menuselection eq "5")
	{
		BattleStats();
	}
}

exit 0;
