%% Probabilistic Serial Reation Time Task (SRT)
%% Owen Parson's original SRT code v4 (task2) | Adapted by NJassim, Dec 2020 
%% This version - trial order initially randomized within blocks, then presented in fixed order to participants (see Kaufmann et al.,2010)
%% Session # 2 - contains a switch- sequential learning of probable (seq  B, 85%) and improbable (seq A, 15%) sequences
%% NOTE: To be run AFTER session 1

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instructions: Clear workspace and add path to PTB before running, don't forget to turn computer audio on

% close all;
% clear vars;
% addpath(genpath('/home/mslaptop/Documents/MATLAB/Psychtoolbox/Psychtoolbox'))

function serialReactionTimeTask(ID_num_v2)
try  
        
if nargin<2
    ID_num = input('Participant ID? ', 's');
end

PsychDefaultSetup(2);

taskType = 2;
     
tstamp = clock;
savefile = fullfile(pwd, 'Results', [sprintf('serialReactionTimeTask-%02d-%02d-%02d-%02d-%02d-task-%d-participant-%s', tstamp(1), tstamp(2), tstamp(3), tstamp(4), tstamp(5), taskType), ID_num, '.txt']);


fileID = fopen(savefile,'wt+');

fprintf(fileID,'Block\tTrial\tSequence\tNumA\tNumB\tNumC\tRT\tResponse\tDelay\n');


% PTB warning: please make sure to set Screen('Preference', 'SkipSyncTests', 0) for maximum accuracy and reliability.
  
Screen('Preference', 'SkipSyncTests', 0);



scr_background = 127.5;
scr_no = 0;

white = WhiteIndex(scr_no);
black = BlackIndex(scr_no);



scr_dimensions = Screen('Rect', scr_no);

xcen = scr_dimensions(3)/2;
ycen = scr_dimensions(4)/2;
xfull = scr_dimensions(3);
yfull = scr_dimensions(4);
xSection = scr_dimensions(3)/6;
ySection = scr_dimensions(4)/3;

% Set up Keyboard

KbName('UnifyKeyNames');
left_key = KbName('LeftArrow');
right_key = KbName('RightArrow');
down_key = KbName('DownArrow');
esc_key = KbName('Escape');
space_key = KbName('space');

%no_key = KbName('n');
z_key = KbName('z');
x_key = KbName('x');
n_key = KbName('n');
m_key = KbName('m');
y_key = KbName('y');

keyList = zeros(1, 256);
keyList([left_key, right_key, down_key, esc_key, space_key, z_key, x_key, n_key, m_key, y_key]) = 1;
KbQueueCreate([], keyList); clear keyList
RestrictKeysForKbCheck([]);

% Sound
InitializePsychSound;
pa = PsychPortAudio('Open', [], [], [], [], [], 256);
bp400 = PsychPortAudio('CreateBuffer', pa, [MakeBeep(400, 0.2); MakeBeep(400, 0.2)]);
PsychPortAudio('FillBuffer', pa, bp400);

% Open Window
scr = Screen('OpenWindow', scr_no, scr_background);
frameRate = 1/Screen('FrameRate', scr);
HideCursor;

Screen('BlendFunction', scr, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
Screen('TextFont', scr, 'Ariel');
Screen('TextSize', scr, 40);

% Experiment Procedure
blocksNum = 8;
trialsNum = 120;

Priority(1);


% Main Body

    DrawFormattedText(scr, 'Welcome to session 2 of this experiment! \n\n The instructions are the same as before.', 'center', 'center', 0);
    DrawFormattedText(scr, 'Press "Space" to continue.', 'center', yfull-80, 0);
    Screen('Flip', scr); KbStrokeWait;
    
DrawFormattedText(scr, 'You will be shown 4 white boxes on a grey screen.\n\nDuring each trial a "X" will appear in one of the boxes.', 'center', 'center', 0);
    DrawFormattedText(scr, 'Press "Space" to continue.', 'center', yfull-80, 0);
    Screen('Flip', scr); KbStrokeWait;
DrawFormattedText(scr, 'You need to respond by pressing the keys correponding to the location of the "X":\n\n "z", "x", "n" or , "m". Please place your fingers on the relevant keys marked with stickers.', 'center', 'center', 0);    
    DrawFormattedText(scr, 'Press "Space" to continue.', 'center', yfull-80, 0);
    Screen('Flip', scr); KbStrokeWait;
    baseRect = [0 0 200 200];
        

for squaresLoop = 1:4

    xPos = (squaresLoop + 0.5) * xSection;
    yPos = 2 * ySection;

centeredRect = CenterRectOnPointd(baseRect, xPos, yPos);

rectColour = 255;

Screen('FillRect', scr, rectColour, centeredRect);

end

fixCrossDimPix = 40;

xCoords = [-fixCrossDimPix fixCrossDimPix -fixCrossDimPix fixCrossDimPix];
yCoords = [fixCrossDimPix -fixCrossDimPix -fixCrossDimPix fixCrossDimPix];
allCoords = [xCoords; yCoords];

lineWidthPix = 4;

% disp(objectcolour);
% disp(mid_coords);

%numC = 2;

mid_coords_X = 3.5 * xSection;
mid_coords = [mid_coords_X yPos];



lineColour = [0 0 0];

Screen('DrawLines', scr, allCoords, lineWidthPix, lineColour, mid_coords, 2);

DrawFormattedText(scr, 'For example, here you would press the "n" button.', 'center', 200, 0);
    DrawFormattedText(scr, 'Press "Space" to continue.', 'center', yfull-80, 0);
    Screen('Flip', scr);  KbStrokeWait;    
    
    for squaresLoop = 1:4

    xPos = (squaresLoop + 0.5) * xSection;
    yPos = 2 * ySection;

centeredRect = CenterRectOnPointd(baseRect, xPos, yPos);

rectColour = 255;

Screen('FillRect', scr, rectColour, centeredRect);

end

fixCrossDimPix = 40;

xCoords = [-fixCrossDimPix fixCrossDimPix -fixCrossDimPix fixCrossDimPix];
yCoords = [fixCrossDimPix -fixCrossDimPix -fixCrossDimPix fixCrossDimPix];
allCoords = [xCoords; yCoords];

lineWidthPix = 4;

% disp(objectcolour);
% disp(mid_coords);

%numC = 2;

mid_coords_X = 1.5 * xSection;
mid_coords = [mid_coords_X yPos];



lineColour = [0 0 0];

Screen('DrawLines', scr, allCoords, lineWidthPix, lineColour, mid_coords, 2);

DrawFormattedText(scr, 'And here you would press the "z" button.', 'center', 200, 0);
    DrawFormattedText(scr, 'Press "Space" to continue.', 'center', yfull-80, 0);
    Screen('Flip', scr);  KbStrokeWait;    
    
    
DrawFormattedText(scr, 'If you take too long to respond or press the wrong key, \n\nyou will hear a beeping sound.', 'center', 'center', 0);
    DrawFormattedText(scr, 'Press "Space" to continue.', 'center', yfull-80, 0);
    Screen('Flip', scr); PsychPortAudio('Start', pa); KbStrokeWait;    
    
    DrawFormattedText(scr, 'Like before, there will be a total of 8 blocks with 120 trials each.', 'center', 400, 0 );
    DrawFormattedText(scr, 'Each block is followed by a 30 second break.', 'center', 600, 0 );
    DrawFormattedText(scr, 'Press "Space" to continue.', 'center', yfull-80, 0);
    Screen('Flip', scr);  KbStrokeWait;
    
%     DrawFormattedText(scr, 'You will now do a short practice trial.', 'center', 'center', 0);
%     DrawFormattedText(scr, 'Press "Space" to continue.', 'center', yfull-80, 0);
%     Screen('Flip', scr);  KbStrokeWait;
%      
%  training_demo(taskType);
    
    DrawFormattedText(scr, 'Are you ready for the main task? \n\nIf you have any questions please ask now.', 'center', 'center', 0);
    DrawFormattedText(scr, 'Press "Space" to start the experiment.', 'center', yfull-80, 0);
    Screen('Flip', scr);  KbStrokeWait;
    
%% Fixed sequence

fname = 'session2_seq_generation.csv';
fidi = fopen(fname);
temp_seq    = textscan(fidi, '%s','HeaderLines',1,'Delimiter',',');
sequenceTypeFixed    =  cell2mat( [temp_seq{:}] );
fclose(fidi);

    
    

for blockLoop = 1:blocksNum
    
   
    %runTrial(trialsNum, blockLoop, taskType);
    runTrial(trialsNum, blockLoop, taskType, 'main_experiment', sequenceTypeFixed );
    
    if blockLoop ~= 8
   
   count_text = sprintf('Block %d of 8 is now complete.', blockLoop);
   countdown_pause(30, count_text);
   
end
    
    
end

%     DrawFormattedText(scr, 'You have now completed 6 blocks.\n\n', 'center', 'center', 0);
%     DrawFormattedText(scr, 'Please let the experimenter know now!', 'center', yfull-80, 0);
%     Screen('Flip', scr);  KbStrokeWait;
    
%     DrawFormattedText(scr, 'Please take a break before continuing.\n\n', 'center', 'center', 0);
%     DrawFormattedText(scr, 'When you are ready to complete more blocks, press "SPACE"', 'center', yfull-80, 0);
%     Screen('Flip', scr);  KbStrokeWait;
%     
%     DrawFormattedText(scr, 'You will now complete another 6 blocks.\n\n', 'center', 'center', 0);
%     DrawFormattedText(scr, 'Press "Space" to start the experiment.', 'center', yfull-80, 0);
%     Screen('Flip', scr);  KbStrokeWait;

% for blockLoop = 1:blocksNum
%     
%    
%     runTrial(trialsNum, blockLoop, 4);
%     
%     if blockLoop ~= 12
%    
%    count_text = sprintf('Block %d of 8 is now complete. Pause for', blockLoop);
%    countdown_pause(30, count_text);
%    
%     end
%    
% 
%     
%     
% end
% 
%     count_text = 'The experiment will finish in';
% countdown_pause(10, count_text);

%% Shutdown
fclose(fileID);
text_string = 'You''ve now completed session 2. Please let the experimenter know.';
DrawFormattedText(scr, text_string, 'center', 'center', 0);

Screen('Flip', scr);

WaitSecs(2);
KbQueueStop;
PsychPortAudio('Close');
sca;
Priority(0);
disp('All done!');
   


catch errMessage
    KbQueueStop;
    sca;
    %savefilemat = fullfile(pwd, 'Results', 'Errors', [sprintf('interruptedSearch-%02d-%02d-%02d-%02d-%02d-task-%d-participant-%s', tstamp(1), tstamp(2), tstamp(3), tstamp(4), tstamp(5), taskCondition), ID_num, '_error.mat']);
    %save(savefilemat, 'data');
    rethrow(errMessage);
end


% subfunctions

%% NJ: Sequence B (probable) and A (improbable)
%% SWITCH in probabilities

    %function runTrial(trialsNum, blockLoop, displayType)
     function runTrial(trialsNum, blockLoop, displayType, trainMainSelector, sequenceTypeFixed)
        
        numA = 1;
        numB = 2;
        numC = 3;
        
       for trialLoop = 1:trialsNum
           
        if displayType == 2
            
                delayVal = randsample(1:9, 1);

            
                delayJitter = ((delayVal / 2) - 2.5) / 10;
                
                delayTime = 0.4 + delayJitter;
                
            elseif displayType == 4
                
                 delayVal = randsample(1:9, 1);

            
                delayJitter = ((delayVal / 2) - 2.5) / 10;
                
                delayTime = 0.4 + delayJitter;
                
                
            else
           
            delayTime = 0.4;
            
        end
           
           numA = numB;
           numB = numC;
                  
           if strcmp(trainMainSelector, 'training_demo')
             sequenceSelect = randsample(1:20, 1);

             if sequenceSelect >= 4                                                                                                                                                                                              
                 sequenceType = 'B';
                 seqVector = [1 3 2 3 4 1 2 4 3 1 4 2 1 3 2 3 4 1 2 4 3 1 4 2];


             else
                 
                 sequenceType = 'A';
                 seqVector = [1 2 1 4 3 2 4 1 3 4 2 3 1 2 1 4 3 2 4 1 3 4 2 3];
                 
             end
             
           elseif strcmp(trainMainSelector, 'main_experiment' )
                   
                   sequenceType = sequenceTypeFixed( (blockLoop-1)* trialsNum + trialLoop );
                   
                   if  sequenceType == 'B'
                       seqVector = [1 3 2 3 4 1 2 4 3 1 4 2 1 3 2 3 4 1 2 4 3 1 4 2];
                       
                   elseif sequenceType == 'A'
                       seqVector = [1 2 1 4 3 2 4 1 3 4 2 3 1 2 1 4 3 2 4 1 3 4 2 3];
                      
                           
                   else
                           
                           printf('%s', 'Invalid sequenceType');
                   end
           else
                   printf('%s', 'Unkown experiment type');
           end 

             
             seqPos = findstr(seqVector,[numA numB]);
             
             numPos = seqPos(1,1) + 2;
             
             numC = seqVector(1,numPos);
             
             
             displayScreen(numA, numB, numC, sequenceType, trialLoop, blockLoop, delayTime)
             
           
           
       end
               
        
    end    
     

    function displayScreen(numA, numB, numC, SequenceType, trialLoop, blockLoop, delayTime)
        
baseRect = [0 0 200 200];
        

for squaresLoop = 1:4

    xPos = (squaresLoop + 0.5) * xSection;
    yPos = 2 * ySection;

centeredRect = CenterRectOnPointd(baseRect, xPos, yPos);

rectColour = 255;

Screen('FillRect', scr, rectColour, centeredRect);

end

% Flip to the screen
Screen('Flip', scr); 
WaitSecs(delayTime);

for squaresLoop = 1:4

    xPos = (squaresLoop + 0.5) * xSection;
    yPos = 2 * ySection;

centeredRect = CenterRectOnPointd(baseRect, xPos, yPos);

Screen('FillRect', scr, rectColour, centeredRect);

end

%Draw cross

fixCrossDimPix = 40;

xCoords = [-fixCrossDimPix fixCrossDimPix -fixCrossDimPix fixCrossDimPix];
yCoords = [fixCrossDimPix -fixCrossDimPix -fixCrossDimPix fixCrossDimPix];
allCoords = [xCoords; yCoords];

lineWidthPix = 4;

% disp(objectcolour);
% disp(mid_coords);

%numC = 2;

mid_coords_X = (numC + 0.5) * xSection;
mid_coords = [mid_coords_X yPos];



lineColour = [0 0 0];

Screen('DrawLines', scr, allCoords, lineWidthPix, lineColour, mid_coords, 2);
        
startSecs = Screen('Flip', scr); 

%WaitSecs(1);        

KbQueueFlush(); 
 
KbQueueStart();   
   
waitTime = 2;        


while 1
    
    keyboard_response = 99;
    RestrictKeysForKbCheck([z_key, x_key, n_key, m_key, esc_key]);
    [ ~, first_press]=KbQueueCheck;
    timeSecs = first_press(find(first_press));
    
    if first_press(esc_key)
            error('You interrupted the script by pressing Escape after exposure');
        elseif first_press(z_key)
            keyresponse = 1;
            reactionTime = timeSecs - startSecs;
            
                if keyresponse ~= numC
          
                        PsychPortAudio('Start', pa);
           
                end
            
            RestrictKeysForKbCheck([]);
            
            fprintf(fileID,'%d\t%d\t%s\t%d\t%d\t%d\t%d\t%d\t%d\n', blockLoop, trialLoop, SequenceType, numA, numB, numC, reactionTime, keyresponse, delayTime);
            
            break;
        elseif first_press(x_key)
            keyresponse = 2;
            reactionTime = timeSecs - startSecs;
            
            if keyresponse ~= numC
          
                        PsychPortAudio('Start', pa);
           
                end
            
            RestrictKeysForKbCheck([]);
            fprintf(fileID,'%d\t%d\t%s\t%d\t%d\t%d\t%d\t%d\t%d\n', blockLoop, trialLoop, SequenceType, numA, numB, numC, reactionTime, keyresponse, delayTime);
            
            break;
          elseif first_press(n_key)
            keyresponse = 3;
            reactionTime = timeSecs - startSecs;
            
            if keyresponse ~= numC
          
                        PsychPortAudio('Start', pa);
           
                end
            
            RestrictKeysForKbCheck([]);
            fprintf(fileID,'%d\t%d\t%s\t%d\t%d\t%d\t%d\t%d\t%d\n', blockLoop, trialLoop, SequenceType, numA, numB, numC, reactionTime, keyresponse, delayTime);
            
            break;    
             elseif first_press(m_key)
             
            keyresponse = 4;
            reactionTime = timeSecs - startSecs;
            
            if keyresponse ~= numC
          
                        PsychPortAudio('Start', pa);
                        
           
                end
            
            RestrictKeysForKbCheck([]);
            fprintf(fileID,'%d\t%d\t%s\t%d\t%d\t%d\t%d\t%d\t%d\n', blockLoop, trialLoop, SequenceType, numA, numB, numC, reactionTime, keyresponse, delayTime);
            
            break;  
        elseif GetSecs()-startSecs > waitTime
            reactionTime = 999;
            keyresponse = 999;
            
        RestrictKeysForKbCheck([]);
        PsychPortAudio('Start', pa);
        fprintf(fileID,'%d\t%d\t%s\t%d\t%d\t%d\t%d\t%d\t%d\n', blockLoop, trialLoop, SequenceType, numA, numB, numC, reactionTime, keyresponse, delayTime);
            
       break; 
       
        
            
    end
       
end

        
    end

%% Block break
function countdown_pause(time_loop, text_string)
    
    image = fullfile(pwd, 'Pictures', sprintf('%d.jpg', randi(50)));
    temp_image = imread(image, 'jpg');
    temp_texture = Screen('MakeTexture', scr, temp_image);
    
    KbQueueFlush();
    
    KbQueueStart;
    for h = 1:time_loop
        time_max = time_loop + 1;
    msg = sprintf('%s %d s', text_string, time_max-h);
    DrawFormattedText(scr, msg, 'center', 0, 0);
    Screen('DrawTexture', scr, temp_texture);
    DrawFormattedText(scr, '30 second break. Press "Space" to continue.', 'center', yfull-80, 0);
    Screen('Flip', scr); KbStrokeWait;
    WaitSecs(1);
        [~, first_press] = KbQueueCheck;
        if first_press(esc_key)
            error('You interrupted the script by pressing Escape after exposure');
        elseif first_press(space_key)
            break
        end
    end

    Screen('Flip', scr);
    KbQueueStop;
    WaitSecs(1);

end


% function training_demo(taskType)
%        
%         
%        runTrial(20, 99, taskType, 'Training');
%        runTrial(20, 99, taskType);
%     
%      Line1 = 'Do you want to repeat the demo?';
%     dottedline = '------------------------------';
%     Line2 = '(y)es or (n)o?';
%     text_string = sprintf('%s\n%s\n\n%s', Line1, dottedline, Line2);
%     DrawFormattedText(scr, text_string, 'center', 'center', 0);
%     Screen('Flip', scr);
%    
%     KbQueueStart();    
%    
% waitTime    = 30;        
% 
% startTime = GetSecs();
% pass_var = 0;
% 
% while 1
%     
%     keyboard_response = 'null';
%     RestrictKeysForKbCheck([y_key, n_key]);
%     [ ~, firstPress]=KbQueueCheck;
%     
%     if firstPress(y_key)
%         RestrictKeysForKbCheck([]);
%         training_demo(taskType);
%         
%     elseif firstPress(n_key)
%         RestrictKeysForKbCheck([]);
%        break
%            
%     elseif GetSecs()-startTime > waitTime
%         RestrictKeysForKbCheck([]);
%        break
%         
%    end
%        
% end    
%         
%     end   



end


