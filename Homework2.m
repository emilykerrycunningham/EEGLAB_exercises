% longer version - tasks 1 & 2
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
EEG = pop_biosig('C:\Users\Emily Cunningham\Desktop\EEGLAB\sub02_1.bdf');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'gui','off'); 
EEG = pop_eegfiltnew(EEG, 'locutoff',1,'plotfreqz',1);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'setname','BDF file - filtered','gui','off'); 
EEG = eeg_checkset( EEG );
EEG = pop_epoch( EEG, {  'condition 1'  'condition 2'  }, [-0.5         2.5], 'newname', 'BDF file - filtered epochs', 'valuelim', [-150  150], 'epochinfo', 'yes');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'gui','off'); 
EEG = eeg_checkset( EEG );
pop_eegplot( EEG, 1, 1, 1);

% shorter version
EEG = pop_biosig('C:\Users\Emily Cunningham\Desktop\EEGLAB\sub02_1.bdf');
EEG = pop_eegfiltnew(EEG, 'locutoff',1,'plotfreqz',1);
EEG = pop_epoch( EEG, {  'condition 1'  'condition 2'  }, [-0.5         2.5], 'newname', 'BDF file - filtered epochs', 'valuelim', [-150  150], 'epochinfo', 'yes');
pop_eegplot( EEG, 1, 1, 1);

% task 3

datapath='C:\Users\Emily Cunningham\Desktop\EEGLAB\';
sublist={'sub02_1.bdf';'sub03_1.bdf'};

for isub=1:2 % loop over participants
EEG = pop_biosig(fullfile(datapath,sublist{isub}));
EEG = pop_eegfiltnew(EEG, 'locutoff',1,'plotfreqz',1);
EEG = pop_epoch( EEG, {  'condition 1' 'condition 2'  }, [-0.5         2.5], 'newname', 'BDF file - filtered epochs', 'valuelim', [-150  150], 'epochinfo', 'yes');
end
pop_eegplot( EEG, 1, 1, 1);