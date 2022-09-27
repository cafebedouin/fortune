# fortune
Fortune in Linux

Fortune provides a random quote or aphorism every time you open a terminal in Linux. I wanted to have a personalized fortune to display whenever I opened a terminal, write an email, etc. Here’s the procedure.

To check if you have it installed, simply type fortune into the terminal.

$ fortune 
This either returned a fortune or an error message. If you got an error message, then install fortune using the package manager for your system.

$ sudo apt install fortune-mod
Let’s create our own file of fortunes. I want to use my zuihitsu quotes I have posted on this site. This file is a text file that looks like so:

%
quote 1
%
quote 2
%
quote ...

Or use the fortune file in this repo.

If you have just a file with lines of quotes, this is easy to get into this format using emacs. Simply type: M-%, followed by c-q c-j Enter then c-q c-j % c-q c-j Enter. I like to check the replacements, so just keep hitting y to do the replacement and move on to the next one if it looks good. Save the file to the appropriate directory, which on Debian systems is /usr/share/games/fortunes, but can vary. For explanation purposes, we are going to assume the file was named zuihitsu with no file extension.

Now, create a .dat file for the file you just made.

$ sudo strfile zuihitsu

Set the same permissions on the new files as the others in the directory. This just makes the files readable to groups and others.

$ sudo chmod og+r zuihitsu
$ sudo chmod og+r zuihitsu.dat

Following the rest of the directory. I added a symbolic link.

$ sudo ln -s zuihitsu zuihitsu.u8

You should be able to test it now.

$ fortune zuihitsu

Assuming that worked. The final thing to do is to have your preferred shell call this when it runs. I use bash, so I added the command above to my bash_aliases file. From then on, it will pull a random quote from the zuihitsu file every time you bring up the terminal.

For Bash:

Make a fortune come up automatically every time you login or open a new terminal by adding the following to .bashrc or .bash_aliases:

fortune zuihitsu

For Mutt:
You can add the following to your .muttrc file to have this fortune file generate a random signature for your emails:

set signature="fortune zuihitsu -s|"
The -s selects shorts quotes and the | pipes it to your email text.

