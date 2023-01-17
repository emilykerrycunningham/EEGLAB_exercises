% longer version (code for doing tasks 1 & 2)

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
EEG = pop_biosig('C:\Users\Emily Cunningham\Desktop\EEGLAB\sub02_1.bdf');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'gui','off'); 
EEG = eeg_checkset( EEG );
EEG = pop_epoch( EEG, {  'condition 1'  'condition 2'  }, [-0.5         2.5], 'newname', 'BDF file epochs', 'epochinfo', 'yes');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'gui','off'); 
EEG = eeg_checkset( EEG );
pop_eegplot( EEG, 1, 1, 1);

% extra task - shorter version (i.e., the minimal code needed to produce the same
% results as the code above
EEG = pop_biosig('C:\Users\Emily Cunningham\Desktop\EEGLAB\sub02_1.bdf');
EEG = pop_epoch( EEG, {  'condition 1'  'condition 2'  }, [-0.5         2.5], 'newname', 'BDF file epochs', 'epochinfo', 'yes');
pop_eegplot( EEG, 1, 1, 1);

% not in the exercises, we did this together as an extra. Loops through
% participants 2 and 3 and runs the code above

datapath='C:\Users\Emily Cunningham\Desktop\EEGLAB\';
sublist={'sub02_1.bdf';'sub03_1.bdf'};

for isub=1:2 % loop over participants
EEG = pop_biosig(fullfile(datapath,sublist{isub}));
EEG = pop_epoch( EEG, {  'condition 1'  'condition 2'  }, [-0.5         2.5], 'newname', 'BDF file epochs', 'epochinfo', 'yes');
end
pop_eegplot( EEG, 1, 1, 1);