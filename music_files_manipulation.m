%--------------------------------------------------------------------------
%Script Name: music_files_manipulation.m
%
%Version No.: v1.0 Posted 30 November, 2019
%
%Original Author: Clyde A. Lettsome, PhD, PE, MEM
%
%Description:This Matlab script is for my Youtube Signal Processing series entitled,
%             "A Journey Into Music and Sound".
%
%1)Intro - https://youtu.be/aZuKc9WNM80
%2)Matlab IDE and wavread - https://youtu.be/5BuGJQOQk_g
%3)Playing Music in Reverse and Increasing Volume - https://youtu.be/QNk6mi1vE-8&t=686s
%4)Speeding Up and Slowing Down Music - https://youtu.be/7SiVIQ-PEhQ
%
%This file opens a music file and allows you to analyze the music file in
%the time and frequency domains. In addition you can increase the
%amplitude and frequencies of the music open
%
%License: This program is free software; you can redistribute it and/or 
%modify it under the terms of the GNU General Public License (GPL) version 3, or any later
%version of your choice, as published by the Free Software Foundation.
%
%Notes: Copyright (c) 2019 by C. A. Lettsome Services, LLC
%For more information visit https://clydelettsome.com/blog/2019/09/08/my-weekend-project-sound-location-finder/
%--------------------------------------------------------------------------

%Variables, Constants, and Strings
nth=6000;  %nth sample
mth=80;   %mth sample
name_of_music_file = 'Fly-away.wav'; %change this to the name of the file to 
%play and analyze.

%-------------------------------begin--------------------------------------
%%Opens the wave file. Return the samples (y), sample rate(FS), and number
%%of bits
[y,Fs,bits] = wavread(name_of_music_file); 
Fs  %Display the sample rate
bits %Display the number of 
lth = nth - mth; 
vector = y(lth:nth) %Display the samples lth thru mth samples in a vector format
%---------------------------------end--------------------------------------

%-------------------------------begin--------------------------------------
%%Uncomment below to plot the lth thru nth samples
%figure(1)
%plot(vector)
%xlabel('time(s)')
%ylabel('amplitude')
%ttl=name_of_music_file;
%title(ttl);
%sound(y,Fs,bits) %play song on the computer's speakers or connected headset
%---------------------------------end--------------------------------------

%-------------------------------begin--------------------------------------
%%Uncomment below to play music backward
%backward_y = flipud(y);
%sound(backward_y,Fs,bits) %play song backward
%wavwrite(backward_y, Fs, bits,'Fly-Away_backward')
%---------------------------------end--------------------------------------

%-------------------------------begin--------------------------------------
%%Uncomment to increase the song amplitude/volume
%amplitude_increase_y = 10.*y;
%amp_x=amplitude_increase_y(lth:nth);  %display samples 5920-6000 in a vector format

%figure(2)
%plot(amp_x)
%xlabel('time(s)')
%ylabel('amplitude')
%ttl='Amplitude/volume increased';
%title(ttl);

%sound(amplitude_increase_y,Fs,bits) %play song backward
%wavwrite(amplitude_increase_y, Fs, bits,'Fly-Away_amp-up')
%---------------------------------end--------------------------------------

%-------------------------------begin--------------------------------------
%%Uncomment to increase the song speed (Chipmunks)
%Fs2 = 2 * Fs;
%sound(y,Fs2,bits) %play song faster
%wavwrite(y, Fs2, bits,'Fly-Away_chipmunk')
%---------------------------------end--------------------------------------

%-------------------------------begin--------------------------------------
%Uncomment to decrease the song speed (Screwed)
%Fs_half = 0.5 * Fs;
%sound(y,Fs_half,bits) %play song slow
%wavwrite(y, Fs_half, bits,'Fly-Away_screwed')
%---------------------------------end--------------------------------------

%-------------------------------begin--------------------------------------
%Repeat with a one second delay

delay = zeros (44100,2);
y_delayed = [delay;y];
y_not_delayed = [y;delay];
y_repeat = y_not_delayed + y_delayed; 
%sound(y_repeat,Fs,bits) %play song slow
%wavwrite(y_repeat, Fs_half, bits,'Fly-Away_repeat')
%---------------------------------end--------------------------------------

%-------------------------------begin--------------------------------------
%Chopping

begin_chop = 28 * 44100;  %sample where chop begins
end_chop = 29 * 44100;    %sample where chop ends

y_chop1 = y(begin_chop:end_chop,1:2); %store chopped song portion

len_y = length(y);
y_continue = y(end_chop+1:len_y,1:2); %continue the song
y_chop = [y_chop1;y_chop1;y_chop1;y_chop1;y_continue];
sound(y_chop,Fs,bits) %play song slow
%wavwrite(y_repeat, Fs_half, bits,'Fly-Away_chop')
%---------------------------------end--------------------------------------
