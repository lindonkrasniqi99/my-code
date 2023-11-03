clear all
close all
Screen('Preference','SkipSyncTests', 0);
[win, screenRect]=Screen('OpenWindow', 0, [220 208 255], [50 50 1200 890]);
[nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Hey! \n \n \n \n You do not understand me, do you? \n \n \n \n Lets change that! \n','center','center', [0 0 250]);
Screen('Flip',win);
roundsPlayed=0;
pause(1.5)

[nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Che lingua parli? \n \n \n \n Hangi dili biliyorsun? \n \n \n \n Çfarë gjuhe flet?','center','center', [0 0 250]);
Screen('Flip',win);
pause(1.5)
fileList =["italian.jpg", "turkish.jpg", "albanian.jpg","italiano.jpg", "turkce.jpg", "shqip.jpg"];

rectSize=300;
gridSize=3;
displaySize=gridSize*rectSize;
rectCount =0; % to count the rectangles
% nested loop
for x=1:rectSize:displaySize% outer loop
    for y=1:rectSize:displaySize % inner loop
        rectCount = rectCount+1;
        myRects(rectCount,:)=[x y x+rectSize/2 y+rectSize /2];
    end
end

screenCntrX=screenRect(3)/2;
screenCntrY=screenRect(4)/2;

gridCntr=displaySize/2;

myRects(:,[1 3])=myRects(:,[1 3])+screenCntrX-gridCntr+rectSize/4+displaySize/7;
myRects(:,[2 4])=myRects(:,[2 4])+screenCntrY-gridCntr+rectSize/4;
totalNumberRect=rectCount;

% initialising display
    for k=1:6
        picInGrid=fileList(k);
        im=imread(picInGrid);
        somet=Screen('MakeTexture',win,im);
        Screen('DrawTexture',win,somet,[],myRects(k,:));
    end
     Screen(win,'Flip');
     pause(2);

nativeItalian=0;
nativeAlbanian=0;
nativeTurkish=0;
noClickYet=true;
notClicked=[1 1 1 1 1 1];
while noClickYet==1
    for j=1:6
        picInGrid=fileList(j);
        im=imread(picInGrid);
        somet=Screen('MakeTexture',win,im);
        if notClicked(j)
        Screen('DrawTexture',win,somet,[],myRects(j,:));
        end
    end
    Screen(win,'Flip');
    [x,y,buttons]=GetMouse(win);
    for j=1:6
        if buttons(1)==1;
            if x>myRects(j,1) && x<myRects(j,3) && y>myRects(j,2) && y<myRects(j,4) & notClicked(j)==1;
                notClicked(j)=0;
                if notClicked(1)==0 | notClicked(4)==0;
                   noClickYet=false;
                   nativeItalian=1;
                elseif notClicked(2)==0 | notClicked(5)==0;
                   noClickYet=false;
                   nativeTurkish=1;
                elseif notClicked(3)==0 | notClicked(6)==0;
                   noClickYet=false;
                   nativeAlbanian=1;
                end
            end
    end
end
end

pause(.5)

if nativeAlbanian==1
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'A je gati te vazhdojme 100% ne anglisht?','center','center', [0 0 250]);
elseif nativeTurkish==1
        [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, '%100 ingilizce devam etmeye hazir misin?','center','center', [0 0 250]);
elseif nativeItalian==1
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Sei pronto per continuare al 100% in inglese?','center','center', [0 0 250]);
end
Screen('Flip',win);
pause(1.5)
rectSize=500;
gridSize=2;
displaySize=gridSize*rectSize;
rectCount =0; % to count the rectangles
% nested loop
for x=1:rectSize:displaySize% outer loop
    for y=1:rectSize:displaySize % inner loop
        rectCount = rectCount+1;
        myRects(rectCount,:)=[x y x+rectSize/2 y+rectSize /2];
    end
end


screenCntrX=screenRect(3)/2+displaySize/4;
screenCntrY=screenRect(4)/2;

gridCntr=displaySize/2;


myRects(:,[1 3])=myRects(:,[1 3])+screenCntrX-gridCntr+rectSize/4;
myRects(:,[2 4])=myRects(:,[2 4])+screenCntrY-gridCntr+rectSize/4;
totalNumberRect=rectCount;

continueEnglish=["yes.jpeg","no.jpg"];
    for k=1:2
        piccc=continueEnglish(k);
        im=imread(piccc);
        somet=Screen('MakeTexture',win,im);
        Screen('DrawTexture',win,somet,[],myRects(k,:));
    end
     Screen(win,'Flip');
     pause(1.5);

english=0;
noClickYet=true;
notClicked=[1 1];
while noClickYet==1
    for j=1:2
        piccc=continueEnglish(j);
        im=imread(piccc);
        somet=Screen('MakeTexture',win,im);
        if notClicked(j)
        Screen('DrawTexture',win,somet,[],myRects(j,:));
        end
    end
    Screen(win,'Flip');
    [x,y,buttons]=GetMouse(win);
    for j=1:2
        if buttons(1)==1;
            if x>myRects(j,1) && x<myRects(j,3) && y>myRects(j,2) && y<myRects(j,4) & notClicked(j)==1;
                notClicked(j)=0;
                if notClicked(1)==0;
                   noClickYet=false;
                   english=1;
                   
                elseif notClicked(2)==0;
                   noClickYet=false;
                end
            end
         end
    end
end
pause(.5)


if english==1
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Is it your first time here?','center','center', [0 0 250]);
elseif nativeAlbanian==1
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'A eshte hera jote e pare ketu?','center','center', [0 0 250]);
elseif nativeTurkish==1
        [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Burada ilk kez mi bulunuyorsun?','center','center', [0 0 250]);
elseif nativeItalian==1
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'È la tua prima volta qui?','center','center', [0 0 250]);
end
Screen('Flip',win);
pause(1.5)
rectSize=500;
gridSize=2;
displaySize=gridSize*rectSize;
rectCount =0; % to count the rectangles
% nested loop
for x=1:rectSize:displaySize% outer loop
    for y=1:rectSize:displaySize % inner loop
        rectCount = rectCount+1;
        myRects(rectCount,:)=[x y x+rectSize/2 y+rectSize /2];
    end
end


screenCntrX=screenRect(3)/2+displaySize/4;
screenCntrY=screenRect(4)/2;

gridCntr=displaySize/2;


myRects(:,[1 3])=myRects(:,[1 3])+screenCntrX-gridCntr+rectSize/4;
myRects(:,[2 4])=myRects(:,[2 4])+screenCntrY-gridCntr+rectSize/4;
totalNumberRect=rectCount;

firstTime=["yes.jpeg","no.jpg"];
    for k=1:2
        piccc=firstTime(k);
        im=imread(piccc);
        somet=Screen('MakeTexture',win,im);
        Screen('DrawTexture',win,somet,[],myRects(k,:));
    end
     Screen(win,'Flip');
     pause(1.5)

first=0;
noClickYet=true;
notClicked=[1 1];
while noClickYet==1
    for j=1:2
        piccc=firstTime(j);
        im=imread(piccc);
        somet=Screen('MakeTexture',win,im);
        if notClicked(j)
        Screen('DrawTexture',win,somet,[],myRects(j,:));
        end
    end
    Screen(win,'Flip');
    [x,y,buttons]=GetMouse(win);
    for j=1:2
        if buttons(1)==1;
            if x>myRects(j,1) && x<myRects(j,3) && y>myRects(j,2) && y<myRects(j,4) & notClicked(j)==1;
                notClicked(j)=0;
                if notClicked(1)==0;
                   noClickYet=false;
                   first=1;
                elseif notClicked(2)==0;
                   noClickYet=false;
                end
            end
         end
    end
end
pause(.5)
gameScores = readtable("scores.xlsx","TextType","string");
[m,n] = size(gameScores);
genderUnknown=0;
userMatched=0;
while userMatched==0

if first==1
    username=[];
    wait4username=true;
if english==1
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Decide on a username to use for the rest of the time! \n  Write in lower caps without space bar. Then, press enter','center','center', [0 0 250]);
elseif nativeAlbanian==1
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Shkruaje nje username per te perdorur tere kohen dhe pastaj prek enter! \n  Shkruaj ne lower caps dhe mos e prek space bar','center','center', [0 0 250]);
elseif nativeTurkish==1
        [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Zamanin geri kalaninda kullanmak için bir kullanici adi yazin! \n  Boşluk çubuğu olmadan küçük harflerle yazin. Ardindan entera basin','center','center', [0 0 250]);
elseif nativeItalian==1
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Scrivi un nome utente da utilizzare per il resto del tempo! \n Scrivi in ​​maiuscolo senza barra spaziatrice. Quindi premere invio','center','center', [0 0 250]);
end
Screen('Flip',win);
    while wait4username==true
    [keyTime keyCode] = KbStrokeWait;
    keyName = KbName(keyCode);
    if keyName=='return'
        break
    else
        username = [username keyName];
        DrawFormattedText(win,username,'center','center', [0 0 250])
        Screen(win,'Flip');
    end
    end
    userMatched=1;
    userNumber=m+1;
    username = convertCharsToStrings(username);
else
    username=[];
    wait4username=true;
if english==1
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Write the username you have been using from the start!  \n Do not use uppercase or spacebar. Then, press enter.','center','center', [0 0 250]);
elseif nativeAlbanian==1
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Shkruaje username qe ke perdorur nga fillimi dhe pastaj prek enter! \n Mos perdor uppercase apo spacebar','center','center', [0 0 250]);
elseif nativeTurkish==1
        [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Baştan beri kullandiğiniz kullanici adini yazin! \n  Boşluk çubuğu olmadan küçük harflerle yazin. Ardindan entera basin','center','center', [0 0 250]);
elseif nativeItalian==1
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Scrivi il nome utente che hai utilizzato dallinizio. \n Scrivi in ​​maiuscolo senza barra spaziatrice. Quindi premere invio','center','center', [0 0 250]);
end
Screen('Flip',win);
    while wait4username==true
    [keyTime keyCode] = KbStrokeWait;
    keyName = KbName(keyCode);
    if keyName=='return'
        break
    else
        username = [username keyName];
        DrawFormattedText(win,username,'center','center', [0 0 250])
        Screen(win,'Flip');
    end
    end

    for k=1:m
        testUser=gameScores{k,"Username"};
    if username == testUser
        userNumber=k;
        userMatched=1;
        genderUnknown=1;
        if gameScores{userNumber,"gender_girl_"}==1
            girl=1;
            boy=0;
        else
            girl=0;
            boy=1;
        end
    end
    end
end
end

while genderUnknown==0
if english==1
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Are you a boy or a girl?','center','center', [0 0 250]);
elseif nativeAlbanian==1
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Pyetja e rradhës! A je djalë apo vajzë?','center','center', [0 0 250]);
elseif nativeTurkish==1
        [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Sonraki sonu! Erkek mısın kadın mı?','center','center', [0 0 250]);
elseif nativeItalian==1
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Sei un ragazzo o una ragazza?','center','center', [0 0 250]);
end
Screen('Flip',win);
pause(1.5)
rectSize=500;
gridSize=2;
displaySize=gridSize*rectSize;
rectCount =0; % to count the rectangles
% nested loop
for x=1:rectSize:displaySize% outer loop
    for y=1:rectSize:displaySize % inner loop
        rectCount = rectCount+1;
        myRects(rectCount,:)=[x y x+rectSize/2 y+rectSize /2];
    end
end


screenCntrX=screenRect(3)/2+displaySize/4;
screenCntrY=screenRect(4)/2;

gridCntr=displaySize/2;


myRects(:,[1 3])=myRects(:,[1 3])+screenCntrX-gridCntr+rectSize/4;
myRects(:,[2 4])=myRects(:,[2 4])+screenCntrY-gridCntr+rectSize/4;
totalNumberRect=rectCount;

gender=["girl.jpg","boy.jpg"];
    for k=1:2
        piccc=gender(k);
        im=imread(piccc);
        somet=Screen('MakeTexture',win,im);
        Screen('DrawTexture',win,somet,[],myRects(k,:));
    end
     Screen(win,'Flip');
     pause(1.5);

boy=0;
girl=0;
noClickYet=true;
notClicked=[1 1];
while noClickYet==1
    for j=1:2
        piccc=gender(j);
        im=imread(piccc);
        somet=Screen('MakeTexture',win,im);
        if notClicked(j)
        Screen('DrawTexture',win,somet,[],myRects(j,:));
        end
    end
    Screen(win,'Flip');
    [x,y,buttons]=GetMouse(win);
    for j=1:2
        if buttons(1)==1;
            if x>myRects(j,1) && x<myRects(j,3) && y>myRects(j,2) && y<myRects(j,4) & notClicked(j)==1;
                notClicked(j)=0;
                if notClicked(1)==0;
                   noClickYet=false;
                   girl=1;
                   genderUnknown=1;
                elseif notClicked(2)==0;
                   noClickYet=false;
                   boy=1;
                   genderUnknown=1;
                end
            end
         end
    end
end
end
pause(.5)

if first==1
    rowToBeAdded = {username, girl, 0, 0, 0};
    gameScores = [gameScores;rowToBeAdded];
end

listeningScore=gameScores{userNumber,"listening"};
readingScore=gameScores{userNumber,"reading"};
spellingScore=gameScores{userNumber,"spelling"};


if english==1
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'What do you want to do?','center','center', [0 0 250]);
elseif nativeAlbanian==1
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Cka dëshiron të bëjmë?','center','center', [0 0 250]);
elseif nativeTurkish==1
        [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Ne yapmak istersen?','center','center', [0 0 250]);
elseif nativeItalian==1
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Che cosa vuoi fare?','center','center', [0 0 250]);
end
Screen('Flip',win);
pause(2)
continuePlaying=0;
while continuePlaying==0
picturesOfObjects=["ant.jpg","axe.jpg","banana.jpg","bat.jpg","belt.jpg","brush.jpg","canary.jpg","cape.jpg","cat.jpg","cherry.jpg","dog.jpg","dress.jpg","duck.jpg","eagle.jpg","fox.jpg","goat.jpg","goose.jpg","hat.jpg","jacket.jpg","kiwi.jpg","koala.jpg","ladder.jpg","lemon.jpg","lion.jpg","mole.jpg","peach.jpg","pencil.jpg","penguin.jpg","pig.jpg","pumpkin.jpg","rabbit.jpg","sheep.jpg","shirt.jpg","skunk.jpg","swan.jpg","tiger.jpg","tomato.jpg","zebra.jpg"];
picturesOfObjectsWithOutJPG=erase(picturesOfObjects,".jpg");
myPitches=["A.wav","B.wav","C.wav","D.wav","E.wav","F.wav","G.wav","H.wav","I.wav","J.wav","K.wav","L.wav","M.wav","N.wav","O.wav","P.wav","Q.wav","R.wav","S.wav","T.wav","U.wav","V.wav","W.wav","X.wav","Y.wav","Z.wav"];
picsOfLetters=["A.jpg","B.jpg","C.jpg","D.jpg","E.jpg","F.jpg","G.jpg","H.jpg","I.jpg","J.jpg","K.jpg","L.jpg","M.jpg","N.jpg","O.jpg","P.jpg","Q.jpg","R.jpg","S.jpg","T.jpg","U.jpg","V.jpg","W.jpg","X.jpg","Y.jpg","Z.jpg"];
%Let them choose module they want to work in
rectSize=300;
gridSize=3;
displaySize=gridSize*rectSize;
rectCount =0; % to count the rectangles
% nested loop
for x=1:rectSize:displaySize% outer loop
    for y=1:rectSize:displaySize % inner loop
        rectCount = rectCount+1;
        myRects(rectCount,:)=[x y x+rectSize/2 y+rectSize /2];
    end
end

screenCntrX=screenRect(3)/2;
screenCntrY=screenRect(4)/2;

gridCntr=displaySize/2;

myRects(:,[1 3])=myRects(:,[1 3])+screenCntrX-gridCntr+rectSize/4;
myRects(:,[2 4])=myRects(:,[2 4])+screenCntrY-gridCntr+rectSize/4;
totalNumberRect=rectCount;

moduleList=["ABCD.jpg","listen.jpg","listenwords.jpg","reading.jpg","spelling.jpg","listeneasy.jpg","spellingListenWord.jpg","spellingWords.jpg","exit.jpg"];

% initialising display
    for k=1:9
        moduleShown=moduleList(k);
        imag=imread(moduleShown);
        somet=Screen('MakeTexture',win,imag);
        Screen('DrawTexture',win,somet,[],myRects(k,:));
    end
     Screen(win,'Flip');
pause(.5)

noClickYetNow=true;
notClickedNow=[1 1 1 1 1 1 1 1 1];
ABCD=0;
listen=0;
listenwords=0;
reading=0;
spelling=0;
listeneasy=0;
spellingListenWord=0;
spellingListenLetter=0;
    while noClickYetNow==1
    for j=1:9
        picInGrid=moduleList(j);
        im=imread(picInGrid);
        somet=Screen('MakeTexture',win,im);
        if notClickedNow(j)
        Screen('DrawTexture',win,somet,[],myRects(j,:));
        end
    end
    Screen(win,'Flip');
    [x,y,buttons]=GetMouse(win);
    for j=1:9
        if buttons(1)==1;
            if x>myRects(j,1) && x<myRects(j,3) && y>myRects(j,2) && y<myRects(j,4) & notClickedNow(j)==1;
                notClickedNow(j)=0;
                if notClickedNow(1)==0;
                   noClickYetNow=false;
                   ABCD=1;
                elseif notClickedNow(2)==0;
                   noClickYetNow=false;
                    listen=1;
                elseif notClickedNow(3)==0;
                   noClickYetNow=false;
                    listenwords=1;
                elseif notClickedNow(4)==0;
                   noClickYetNow=false;
                    reading=1;
                elseif notClickedNow(5)==0;
                   noClickYetNow=false;
                    spelling=1;                
                elseif notClickedNow(6)==0;
                   noClickYetNow=false;
                    listeneasy=1;
                elseif notClickedNow(7)==0;
                   noClickYetNow=false;
                    spellingListenWord=1;
                elseif notClickedNow(8)==0;
                   noClickYetNow=false;
                    spellingListenLetter=1;
                elseif notClickedNow(9)==0;
                   noClickYetNow=false;
                    continuePlaying=1;
                end
            end
    end
end
    end
pause(.5)

if ABCD==1
    if english==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Lets reherse the alphabet!','center','center', [0 0 250]);
    elseif nativeAlbanian==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Le të bëjmë alfabetin!','center','center', [0 0 250]);
    elseif nativeTurkish==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'O zaman, alfabeyi yapalım!','center','center', [0 0 250]);
    elseif nativeItalian==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Facciamo lalfabeto!','center','center', [0 0 250]);
    end
    Screen(win,'Flip');
    pause(1.5)
    samplingRate = 48000; % quality of sound
   % howLong=3;
    for letters=1:26
    InitializePsychSound(1);
    [waveform,Fs]=audioread(myPitches(letters));
    pahandle = PsychPortAudio('Open', [], [], [], samplingRate,1);
    PsychPortAudio('FillBuffer', pahandle, waveform');
    PsychPortAudio('Start', pahandle)
    shownLetter=picsOfLetters(letters);
    im=imread(shownLetter);
    somet=Screen('MakeTexture',win,im);
    Screen('DrawTexture',win,somet);
    Screen(win,'Flip');
    pause(.5)    
    end
    roundsPlayed=roundsPlayed+1;
elseif listen==1;
    if english==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Listen to me as I spell a word letter-by-letter, and tell me which one it is!','center','center', [0 0 250]);
    elseif nativeAlbanian==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Më degjo teksa e shqiptoj shkronjë-shkronjë një fjalë dhe më trego cila është!','center','center', [0 0 250]);
    elseif nativeTurkish==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Beni dinle. Bir kelime harf harf söyleceğim! Hangisi olduğunu seç!','center','center', [0 0 250]);
    elseif nativeItalian==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Ascoltami mentre scrivo una parola. Dimmi quale era!','center','center', [0 0 250]);
    end
    Screen(win,'Flip');
    pause(2)
shuffledPicturesOfObjects=Shuffle(picturesOfObjects);
picsShown=string.empty;
    for k=1:9
        objectShown=shuffledPicturesOfObjects(k);
        picsShown(k)=objectShown;
        imag=imread(objectShown);
        somet=Screen('MakeTexture',win,imag);
        Screen('DrawTexture',win,somet,[],myRects(k,:));
    end
    Screen(win,'Flip');
    y=randsample(9,1);pollypocket
    imimi

    sayoutloud=picsShown(y);
    saidoutloud=erase(sayoutloud,".jpg");
    tobespelled=char(saidoutloud);
    samplingRate = 48000; % quality of sound
    for k=1:length(tobespelled)
    letterOutLoud=append(tobespelled(k),'.wav');
    InitializePsychSound(1);
    [waveform,Fs]=audioread(letterOutLoud);
    pahandle = PsychPortAudio('Open', [], [], [], samplingRate,1);
    PsychPortAudio('FillBuffer', pahandle, waveform');
    PsychPortAudio('Start', pahandle)
    pause(1)
    end
    noClickYetNow=true;

    if english==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Which word did I say?','center','center', [0 0 250]);
     elseif nativeAlbanian==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Cilën fjalë e thashë?','center','center', [0 0 250]);
    elseif nativeTurkish==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Hangi söz söyledim?','center','center', [0 0 250]);
    elseif nativeItalian==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Quale parola ho detto?','center','center', [0 0 250]);
    end
    Screen(win,'Flip');
    pause(2)
[val,pos]=intersect(picsShown,sayoutloud);
notClickedNow=[1 1 1 1 1 1 1 1 1];
correctAnswer=0;
    while noClickYetNow==1
for k=1:9
        objectShown=shuffledPicturesOfObjects(k);
        picsShown(k)=objectShown;
        imag=imread(objectShown);
        somet=Screen('MakeTexture',win,imag);
        Screen('DrawTexture',win,somet,[],myRects(k,:));
    end
    Screen(win,'Flip');
    [x,y,buttons]=GetMouse(win);
    for j=1:9
        if buttons(1)==1;
            if x>myRects(j,1) && x<myRects(j,3) && y>myRects(j,2) && y<myRects(j,4) && notClickedNow(j)==1;
                notClickedNow(j)=0;
                if notClickedNow(pos)==0
                   noClickYetNow=false;
                   listeningScore=listeningScore+1;
                   spellingScore=spellingScore+1;
                   if boy==1;
                    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Bravo!','center','center', [0 0 250]);
                   else
                    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Brava!','center','center', [0 0 250]);
                   end
                                                          Screen(win,'Flip');
                                                              pause(2)
                else
                   listeningScore=listeningScore-1;
                   spellingScore=spellingScore-1;
                    if english==1;
     saidOutLoud=convertStringsToChars(string(saidoutloud));
     text='That was incorrect :(. The correct word was: ';
     text1=strcat(text,saidOutLoud);
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,text1,'center','center', [0 0 250]);
                    elseif nativeAlbanian==1;
     saidOutLoud=convertStringsToChars(string(saidoutloud));
     text='Nuk ishte e saktë :(. Fjala e sakte ishte: ';
     text1=strcat(text,saidOutLoud);
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,text1,'center','center', [0 0 250]);
    elseif nativeTurkish==1;
     saidOutLoud=convertStringsToChars(string(saidoutloud));
     text='Yanlış seçtin :(. Dogru sozu bu: ';
     text1=strcat(text,saidOutLoud);
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,text1,'center','center', [0 0 250]);
    elseif nativeItalian==1;
     saidOutLoud=convertStringsToChars(string(saidoutloud));
     text='Hai scelto male :(. La parola corretta era: ';
     text1=strcat(text,saidOutLoud);
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,text1,'center','center', [0 0 250]);
                        end
                      noClickYetNow=false;    
                      Screen(win,'Flip');
                          pause(2)
                end
            end
        end
    end
    end
    roundsPlayed=roundsPlayed+1;
elseif listenwords==1;
    if english==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Listen to a word and tell me which one it is!','center','center', [0 0 250]);   
    elseif nativeAlbanian==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Dëgjo një fjalë dhe më trego cila është!','center','center', [0 0 250]);
    elseif nativeTurkish==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Bir kelimeyi din ve hangisi okudğunu seç!','center','center', [0 0 250]);
    elseif nativeItalian==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Ascolta una parola e dimmi quale hai letto!','center','center', [0 0 250]);
    end
    Screen(win,'Flip');
    pause(2)
    shuffledPicturesOfObjects=Shuffle(picturesOfObjects);
    picsShown=string.empty;
    for k=1:9
        objectShown=shuffledPicturesOfObjects(k);
        picsShown(k)=objectShown;
        imag=imread(objectShown);
        somet=Screen('MakeTexture',win,imag);
        Screen('DrawTexture',win,somet,[],myRects(k,:));
    end
    Screen(win,'Flip');
    pause(1)
    y=randsample(9,1);
    sayoutloud=picsShown(y);
    saidoutloud=erase(sayoutloud,".jpg");
    tobespelled=char(saidoutloud);
    samplingRate = 48000; % quality of sound
    letterOutLoud=append(tobespelled,'.wav');
    InitializePsychSound(1);
    [waveform,Fs]=audioread(letterOutLoud);
    pahandle = PsychPortAudio('Open', [], [], [], samplingRate,1);
    PsychPortAudio('FillBuffer', pahandle, waveform');
    PsychPortAudio('Start', pahandle)
    pause(2)
    noClickYetNow=true;

    if english==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Which word did I say?','center','center', [0 0 250]);
    elseif nativeAlbanian==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Cilën fjalë e thashë?','center','center', [0 0 250]);
    elseif nativeTurkish==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Hangi söz söyledim?','center','center', [0 0 250]);
    elseif nativeItalian==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Quale parola ho detto?','center','center', [0 0 250]);
end
    Screen(win,'Flip');
    pause(2)
[val,pos]=intersect(picsShown,sayoutloud);
notClickedNow=[1 1 1 1 1 1 1 1 1];
while noClickYetNow==1
for k=1:9
        objectShown=shuffledPicturesOfObjects(k);
        picsShown(k)=objectShown;
        imag=imread(objectShown);
        somet=Screen('MakeTexture',win,imag);
        Screen('DrawTexture',win,somet,[],myRects(k,:));
    end
    Screen(win,'Flip');
    [x,y,buttons]=GetMouse(win);
    for j=1:9
        if buttons(1)==1;
            if x>myRects(j,1) && x<myRects(j,3) && y>myRects(j,2) && y<myRects(j,4) & notClickedNow(j)==1;
                notClickedNow(j)=0;
                if notClickedNow(pos)==0
                   noClickYetNow=false;
                   listeningScore=listeningScore+1;
                   if boy==1;
                    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Bravo!','center','center', [0 0 250]);
                   else
                    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Brava!','center','center', [0 0 250]);
                   end

                   Screen(win,'Flip');
                       pause(2)
                else
                   listeningScore=listeningScore-1;
    if english==1;
     saidOutLoud=convertStringsToChars(string(saidoutloud));
     text='That was incorrect :(. The correct word was: ';
     text1=strcat(text,saidOutLoud);
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,text1,'center','center', [0 0 250]);
    elseif nativeAlbanian==1;
     saidOutLoud=convertStringsToChars(string(saidoutloud));
     text='Nuk ishte e saktë :(. Fjala e sakte ishte: ';
     text1=strcat(text,saidOutLoud);
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,text1,'center','center', [0 0 250]);
    elseif nativeTurkish==1;
    saidOutLoud=convertStringsToChars(string(saidoutloud));
     text='Yanlış seçtin :(. Dogru sozu bu: ';
     text1=strcat(text,saidOutLoud);
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,text1,'center','center', [0 0 250]);
    elseif nativeItalian==1;
     saidOutLoud=convertStringsToChars(string(saidoutloud));
     text='Hai scelto male :(. La parola corretta era: ';
     text1=strcat(text,saidOutLoud);
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,text1,'center','center', [0 0 250]);
                end
                      noClickYetNow=false;
                      Screen(win,'Flip');
                          pause(2)
                end
            end
        end
    end
end
roundsPlayed=roundsPlayed+1;

elseif reading==1;
    if english==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Read this word and choose from the options!','center','center', [0 0 250]);
    elseif nativeAlbanian==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Lexoje këtë fjalë dhe zgjidh nga opsionet!','center','center', [0 0 250]);
    elseif nativeTurkish==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Bu sözu oku ve seçeneklerden birini seç!','center','center', [0 0 250]);
    elseif nativeItalian==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Leggi questa parola e scegli tra le opzioni!','center','center', [0 0 250]);
    end
    Screen(win,'Flip');
    pause(2)
    picsShown=string.empty;
    y=randsample(length(picturesOfObjectsWithOutJPG),1);
    wordShown=picturesOfObjectsWithOutJPG(y);
    wordShownJPG=wordShown + '.jpg';
    B = convertStringsToChars(wordShown);
    picsShown(1)=wordShownJPG;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,B,'center','center', [0 0 250]);
    Screen(win,'Flip');
    pause(2)
    [val,pos]=intersect(picturesOfObjects,wordShownJPG);
    picturesOfObjects(pos) = [];

    shuffledPicturesOfObjects=Shuffle(picturesOfObjects);
    for k=2:9
        toAddToList=shuffledPicturesOfObjects(k);
        picsShown(k)=toAddToList;
    end
   
    shuffledPicsShown=Shuffle(picsShown);
    [val,pos]=intersect(shuffledPicsShown,wordShownJPG);
notClickedNow=[1 1 1 1 1 1 1 1 1];
noClickYetNow=1;
while noClickYetNow==1
    for k=1:9
        objectShown=shuffledPicsShown(k);
        imag=imread(objectShown);
        somet=Screen('MakeTexture',win,imag);
        Screen('DrawTexture',win,somet,[],myRects(k,:));
    end
    Screen(win,'Flip');
    [x,y,buttons]=GetMouse(win);
    for j=1:9
        if buttons(1)==1;
            if x>myRects(j,1) && x<myRects(j,3) && y>myRects(j,2) && y<myRects(j,4) && notClickedNow(j)==1;
                notClickedNow(j)=0;
                if notClickedNow(pos)==0
                   noClickYetNow=false;
                   readingScore=readingScore+2;
                   if boy==1
                    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Bravo!','center','center', [0 0 250]);
                   else
                    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Brava!','center','center', [0 0 250]);
                   end
                                       Screen(win,'Flip');
                                       pause(2)
                else
                   readingScore=readingScore-2;
if english==1;
     saidOutLoud=convertStringsToChars(string(wordShown));
     text='That was incorrect :(. The correct word was: ';
     text1=strcat(text,saidOutLoud);
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,text1,'center','center', [0 0 250]);
elseif nativeAlbanian==1;
     saidOutLoud=convertStringsToChars(string(wordShown));
     text='Nuk ishte e saktë :(. Fjala e sakte ishte: ';
     text1=strcat(text,saidOutLoud);
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,text1,'center','center', [0 0 250]);
    elseif nativeTurkish==1;
     saidOutLoud=convertStringsToChars(string(wordShown));
     text='Yanlış seçtin :(. Dogru sozu bu: ';
     text1=strcat(text,saidOutLoud);
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,text1,'center','center', [0 0 250]);
    elseif nativeItalian==1;
     saidOutLoud=convertStringsToChars(string(wordShown));
     text='Hai scelto male :(. La parola corretta era: ';
     text1=strcat(text,saidOutLoud);
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,text1,'center','center', [0 0 250]);
                    end
                      noClickYetNow=false;
                          Screen(win,'Flip');
                          pause(2)
                 
               
                end
            end
        end
    end
end
roundsPlayed=roundsPlayed+1;
elseif spelling==1;
    if english==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Write this word!','center','center', [0 0 250]);
    elseif nativeAlbanian==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Shkruaje këtë fjalë!','center','center', [0 0 250]);
    elseif nativeTurkish==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'O zaman, bu kelime yaz!','center','center', [0 0 250]);
    elseif nativeItalian==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Scrivi la parola!','center','center', [0 0 250]);
    end
    Screen(win,'Flip');
    pause(2)
    shuffledPicturesOfObjects=Shuffle(picturesOfObjects);
    picShown=shuffledPicturesOfObjects(1);
    imag=imread(picShown);
    somet=Screen('MakeTexture',win,imag);
    Screen('DrawTexture',win,somet)    
    Screen(win,'Flip');
    picShownNoJPG=erase(picShown,".jpg")
    pause(2)
    if english==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Write this word! \n Do not use uppercase or spacebar. Then, press enter.','center','center', [0 0 250]);
    elseif nativeAlbanian==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Shkruaje këtë fjalë! \n Mos perdor uppercase apo spacebar. Pastaj shtyp enter ','center','center', [0 0 250]);
    elseif nativeTurkish==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'O zaman, bu kelime yaz! \n Büyük harf veya boşluk çubuğu kullanmayın. Ardından, entera basinz','center','center', [0 0 250]);
    elseif nativeItalian==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Scrivi la parola! \n Non utilizzare maiuscole o barra spaziatrice. Quindi, premi invio','center','center', [0 0 250]);
    end
    Screen(win,'Flip');

    %show random image, check to see if letterPressed == objectwithoutJPG
 
    %received help for this code below on handling typed text from
    %collegues     %Laura and Irmak

    letterPressed=[];
    wait2leave=true;

    while wait2leave==true
    [keyTime keyCode] = KbStrokeWait;
    keyName = KbName(keyCode);
    if keyName=='return'
        break
    else
        letterPressed = [letterPressed keyName];
        DrawFormattedText(win,letterPressed,'center','center', [0 0 250])
        Screen(win,'Flip');
    end
    end

    if letterPressed == picShownNoJPG
        spellingScore=spellingScore+1;
        if boy==1
        [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Bravo!','center','center', [0 0 250]);
        else
        [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Brava!','center','center', [0 0 250]);
        end
        Screen(win,'Flip');
        pause(2)
    else
        spellingScore=spellingScore-1;
        if english==1;
     saidOutLoud=convertStringsToChars(string(picShownNoJPG));
     text='That was incorrect :(. The correct word was: ';
     text1=strcat(text,saidOutLoud);
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,text1,'center','center', [0 0 250]);
        elseif nativeAlbanian==1;
     saidOutLoud=convertStringsToChars(string(picShownNoJPG));
     text='Nuk ishte e saktë :(. Fjala e sakte ishte: ';
     text1=strcat(text,saidOutLoud);
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,text1,'center','center', [0 0 250]);
    elseif nativeTurkish==1;
     saidOutLoud=convertStringsToChars(string(picShownNoJPG));
     text='Yanlış seçtin :(. Dogru sozu bu: ';
     text1=strcat(text,saidOutLoud);
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,text1,'center','center', [0 0 250]);
    elseif nativeItalian==1;
     saidOutLoud=convertStringsToChars(string(picShownNoJPG));
     text='Hai scelto male :(. La parola corretta era: ';
     text1=strcat(text,saidOutLoud);
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,text1,'center','center', [0 0 250]);
    end
    end                
    Screen(win,'Flip');
        pause(2)
roundsPlayed=roundsPlayed+1;

elseif listeneasy==1
    if english==1
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Listen to me as I spell a word letter by letter, then tell me which one it is!','center','center', [0 0 250]);
    elseif nativeAlbanian==1
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Më dëgjo teksa e shqiptoj shkronjë-shkronjë një fjalë dhe më trego cila është!','center','center', [0 0 250]);
    elseif nativeTurkish==1
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Beni dinle. Bir kelime harf harf söyleceğim! Hangisi olduğunu seç!','center','center', [0 0 250]);
    elseif nativeItalian==1
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Ascoltami mentre scrivo una parola. Dimmi quale era!','center','center', [0 0 250]);
    end
    Screen(win,'Flip');
    pause(2)
shuffledPicturesOfObjects=Shuffle(picturesOfObjects);
picsShown=string.empty;
for k=1:9
        objectShown=shuffledPicturesOfObjects(k);
        picsShown(k)=objectShown;
        imag=imread(objectShown);
end
    y=randsample(9,1);
    sayoutloud=picsShown(y);
    saidoutloud=erase(sayoutloud,".jpg");
    tobespelled=char(saidoutloud);
    samplingRate = 48000; % quality of sound
    for k=1:length(tobespelled)
    letterOutLoud=append(tobespelled(k),'.wav');
    InitializePsychSound(1);
    [waveform,Fs]=audioread(letterOutLoud);
    pahandle = PsychPortAudio('Open', [], [], [], samplingRate,1);
    PsychPortAudio('FillBuffer', pahandle, waveform');
    PsychPortAudio('Start', pahandle)
    spellLetter=append(tobespelled(k),'.jpg');
    imageLetter=spellLetter;
    im=imread(imageLetter);
    somet=Screen('MakeTexture',win,im);
    Screen('DrawTexture',win,somet);
    Screen(win,'Flip');
    pause(1)
    end
    noClickYetNow=true;

    if english==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Which word did I say?','center','center', [0 0 250]);
    elseif nativeAlbanian==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Cilën fjalë e thashë?','center','center', [0 0 250]);
    elseif nativeTurkish==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Hangi söz söyledim?','center','center', [0 0 250]);
    elseif nativeItalian==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Quale parola ho detto','center','center', [0 0 250]);
end
    Screen(win,'Flip');
    pause(2)
[val,pos]=intersect(picsShown,sayoutloud);
notClickedNow=[1 1 1 1 1 1 1 1 1];
correctAnswer=0;
    while noClickYetNow==1
for k=1:9
        objectShown=shuffledPicturesOfObjects(k);
        picsShown(k)=objectShown;
        imag=imread(objectShown);
        somet=Screen('MakeTexture',win,imag);
        Screen('DrawTexture',win,somet,[],myRects(k,:));
    end
    Screen(win,'Flip');
    [x,y,buttons]=GetMouse(win);
    for j=1:9
        if buttons(1)==1;
            if x>myRects(j,1) && x<myRects(j,3) && y>myRects(j,2) && y<myRects(j,4) && notClickedNow(j)==1;
                notClickedNow(j)=0;
                if notClickedNow(pos)==0
                   noClickYetNow=false;
                   spellingScore=spellingScore+1;
                   if boy==1;
                    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Bravo!','center','center', [0 0 250]);
                   else
                    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Brava!','center','center', [0 0 250]);
                   end
                                       Screen(win,'Flip');
                                       pause(2)
                else
                   spellingScore=spellingScore-1;
      if english==1;
     saidOutLoud=convertStringsToChars(string(saidoutloud));
     text='That was incorrect :(. The correct word was: ';
     text1=strcat(text,saidOutLoud);
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,text1,'center','center', [0 0 250]);
     elseif nativeAlbanian==1;
     saidOutLoud=convertStringsToChars(string(saidoutloud));
     text='Nuk ishte e saktë :(. Fjala e sakte ishte: ';
     text1=strcat(text,saidOutLoud);
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,text1,'center','center', [0 0 250]);
    elseif nativeTurkish==1;
     saidOutLoud=convertStringsToChars(string(saidoutloud));
     text='Yanlış seçtin :(. Dogru sozu bu: ';
     text1=strcat(text,saidOutLoud);
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,text1,'center','center', [0 0 250]);
    elseif nativeItalian==1;
     saidOutLoud=convertStringsToChars(string(saidoutloud));
     text='Hai scelto male :(. La parola corretta era: ';
     text1=strcat(text,saidOutLoud);
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,text1,'center','center', [0 0 250]);
                    end
                      noClickYetNow=false;
                          Screen(win,'Flip');
                          pause(2)
                 
               
                end
            end
        end
    end
    end
    roundsPlayed=roundsPlayed+1;
elseif spellingListenWord==1
    if english==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Write this word!','center','center', [0 0 250]);
    elseif nativeAlbanian==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Shkruaje këtë fjalë!','center','center', [0 0 250]);
    elseif nativeTurkish==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'O zaman, bu kelime yaz!','center','center', [0 0 250]);
    elseif nativeItalian==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Scrivi la parola!','center','center', [0 0 250]);
 end
    Screen(win,'Flip');
   
    shuffledPicturesOfObjects=Shuffle(picturesOfObjects);
    wordSaid=shuffledPicturesOfObjects(1);
    saidoutloud=erase(wordSaid,".jpg");
    tobespelled=char(saidoutloud);
    samplingRate = 48000; % quality of sound
    letterOutLoud=append(tobespelled,'.wav');
    InitializePsychSound(1);
    [waveform,Fs]=audioread(letterOutLoud);
    pahandle = PsychPortAudio('Open', [], [], [], samplingRate,1);
    PsychPortAudio('FillBuffer', pahandle, waveform');
    PsychPortAudio('Start', pahandle)
    pause(2)
    if english==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Write the word! \n Do not use uppercase or spacebar. Then press enter','center','center', [0 0 250]); 
    elseif nativeAlbanian==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Shkruaje këtë fjalë! \n Mos perdor uppercase apo spacebar. Pastaj shtyp enter ','center','center', [0 0 250]);
    elseif nativeTurkish==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'O zaman, bu kelime yaz! \n Büyük harf veya boşluk çubuğu kullanmayın. Ardından entera basin','center','center', [0 0 250]);
    elseif nativeItalian==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Scrivi la parola! \n Non utilizzare maiuscole o barra spaziatrice. Quindi premere invio','center','center', [0 0 250]);
    end
    Screen(win,'Flip');

    %show random image, check to see if letterPressed == objectwithoutJPG
 
    %received help for this code below on handling typed text from
    %collegues     %Laura and Irmak

    letterPressed=[];
    wait2leave=true;

    while wait2leave==true
    [keyTime keyCode] = KbStrokeWait;
    keyName = KbName(keyCode);
    if keyName=='return'
        break
    else
        letterPressed = [letterPressed keyName];
        DrawFormattedText(win,letterPressed,'center','center', [0 0 250])
        Screen(win,'Flip');
    end
    end

    if letterPressed == saidoutloud
        spellingScore=spellingScore+1;
        listeningScore=listeningScore+1;
        if boy==1
        [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Bravo!','center','center', [0 0 250]);
        else
        [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Brava!','center','center', [0 0 250]);
        end
                Screen(win,'Flip');
            pause(2)
    else
        spellingScore=spellingScore-1;
        listeningScore=listeningScore-1;
if english==1;
     saidOutLoud=convertStringsToChars(string(saidoutloud));
     text='That was incorrect :(. The correct word was: ';
     text1=strcat(text,saidOutLoud);
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,text1,'center','center', [0 0 250]);   
    elseif nativeAlbanian==1;
     saidOutLoud=convertStringsToChars(string(saidoutloud));
     text='Nuk ishte e saktë :(. Fjala e sakte ishte: ';
     text1=strcat(text,saidOutLoud);
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,text1,'center','center', [0 0 250]);
    elseif nativeTurkish==1;
     saidOutLoud=convertStringsToChars(string(saidoutloud));
     text='Yanlış seçtin :(. Dogru sozu bu: ';
     text1=strcat(text,saidOutLoud);
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,text1,'center','center', [0 0 250]);
    elseif nativeItalian==1;
     saidOutLoud=convertStringsToChars(string(saidoutloud));
     text='Hai scelto male :(. La parola corretta era: ';
     text1=strcat(text,saidOutLoud);
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,text1,'center','center', [0 0 250]);        
end
    end                
    Screen(win,'Flip');
        pause(2)
    roundsPlayed=roundsPlayed+1;



elseif spellingListenLetter==1;
    if english==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Write the word!','center','center', [0 0 250]);
    elseif nativeAlbanian==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Shkruaje këtë fjalë!','center','center', [0 0 250]);
    elseif nativeTurkish==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'O zaman, bu kelime yaz!','center','center', [0 0 250]);
    elseif nativeItalian==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Scrivi la parola!','center','center', [0 0 250]);
    end
    Screen(win,'Flip');
    pause(1)
   
    shuffledPicturesOfObjects=Shuffle(picturesOfObjects);
    wordSaid=shuffledPicturesOfObjects(1);
    saidoutloud=erase(wordSaid,".jpg");
    tobespelled=char(saidoutloud);
    samplingRate = 48000; % quality of sound
    for k=1:length(tobespelled)
    letterOutLoud=append(tobespelled(k),'.wav');
    InitializePsychSound(1);
    [waveform,Fs]=audioread(letterOutLoud);
    pahandle = PsychPortAudio('Open', [], [], [], samplingRate,1);
    PsychPortAudio('FillBuffer', pahandle, waveform');
    PsychPortAudio('Start', pahandle)
    spellLetter=append(tobespelled(k),'.jpg');
    imageLetter=spellLetter;
    im=imread(imageLetter);
    somet=Screen('MakeTexture',win,im);
    Screen('DrawTexture',win,somet);
    Screen(win,'Flip');
    pause(1)
    end
    wordSaidOutLoud=append(tobespelled,'.wav');
    [waveform,Fs]=audioread(wordSaidOutLoud);
    pahandle = PsychPortAudio('Open', [], [], [], samplingRate,1);
    PsychPortAudio('FillBuffer', pahandle, waveform');
    PsychPortAudio('Start', pahandle)
    pause(2)
    if english==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Write the word! \n Do not use uppercase or spacebar. Then press enter','center','center', [0 0 250]);
    elseif nativeAlbanian==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Shkruaje këtë fjalë! \n Mos perdor uppercase apo spacebar. Pastaj shtyp enter ','center','center', [0 0 250]);
    elseif nativeTurkish==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'O zaman, bu kelime yaz! \n Büyük harf veya boşluk çubuğu kullanmayın. Ardından entera basin','center','center', [0 0 250]);
    elseif nativeItalian==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Scrivi la parola! \n Non utilizzare maiuscole o barra spaziatrice. Quindi premere invio','center','center', [0 0 250]);
    end
    Screen(win,'Flip');

    letterPressed=[];
    wait2leave=true;

    while wait2leave==true
    [keyTime keyCode] = KbStrokeWait;
    keyName = KbName(keyCode);
    if keyName=='return'
        break
    else
        letterPressed = [letterPressed keyName];
        DrawFormattedText(win,letterPressed,'center','center', [0 0 250])
        Screen(win,'Flip');
    end
    end

    if letterPressed == saidoutloud
        spellingScore=spellingScore+1;
        listeningScore=listeningScore+1;
        readingScore=readingScore+2;
        if boy==1
        [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Bravo!','center','center', [0 0 250]);
        else
        [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Brava!','center','center', [0 0 250]);
        end
        Screen(win,'Flip');
        pause(2)
    else
        spellingScore=spellingScore-1;
        listeningScore=listeningScore-1;
        readingScore=readingScore-2;
if english==1;
     saidOutLoud=convertStringsToChars(string(saidoutloud));
     text='That was incorrect :(. The correct word was: ';
     text1=strcat(text,saidOutLoud);
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,text1,'center','center', [0 0 250]);
    elseif nativeAlbanian==1;
     saidOutLoud=convertStringsToChars(string(saidoutloud));
     text='Nuk ishte e saktë :(. Fjala e sakte ishte: ';
     text1=strcat(text,saidOutLoud);
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,text1,'center','center', [0 0 250]);
    elseif nativeTurkish==1;
     saidOutLoud=convertStringsToChars(string(saidoutloud));
     text='Yanlış seçtin :(. Dogru sozu bu: ';
     text1=strcat(text,saidOutLoud);
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,text1,'center','center', [0 0 250]);
    elseif nativeItalian==1;
     saidOutLoud=convertStringsToChars(string(saidoutloud));
     text='Hai scelto male :(. La parola corretta era: ';
     text1=strcat(text,saidOutLoud);
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,text1,'center','center', [0 0 250]);
     end
    end                
        Screen(win,'Flip');
        pause(2)
    roundsPlayed=roundsPlayed+1;
end

if roundsPlayed==5
    if english==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,['Your reading score is ' num2str(readingScore) ' \n Your listening score is ' num2str(listeningScore) ' \n Your spelling score is ' num2str(spellingScore)] ,'center','center', [0 0 250]);
    elseif nativeAlbanian==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,['Kaq pike ke fituar ne lexim ' num2str(readingScore) ' \n Kaq pike ke fituar ne degjim ' num2str(listeningScore) ' \n Kaq pike ke fituar ne shkrim ' num2str(spellingScore)] ,'center','center', [0 0 250]);
    elseif nativeTurkish==1;
     [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,['Okuma puaniniz ' num2str(readingScore) ' \n Dinleme puaniniz ' num2str(listeningScore) ' \n Yazma puaniniz ' num2str(spellingScore)] ,'center','center', [0 0 250]);
    elseif nativeItalian==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,['Il tuo punteggio di lettura ' num2str(readingScore) ' \n Il tuo punteggio di ascolto ' num2str(listeningScore) ' \n Il tuo punteggio di scrittura ' num2str(spellingScore)] ,'center','center', [0 0 250]);
     end
    roundsPlayed=0;
    Screen(win,'Flip');
    pause(3)
end
    if english==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Do you want to continue?','center','center', [0 0 250]);
    elseif nativeAlbanian==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'A deshiron te vazhdojme?','center','center', [0 0 250]);
    elseif nativeTurkish==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Devam etmeyi ister misin?','center','center', [0 0 250]);
    elseif nativeItalian==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win, 'Vuoi continuare?','center','center', [0 0 250]);
 end
                                        Screen(win,'Flip');
pause(1.5)
rectSize=500;
gridSize=2;
displaySize=gridSize*rectSize;
rectCount =0; % to count the rectangles
% nested loop
for x=1:rectSize:displaySize% outer loop
    for y=1:rectSize:displaySize % inner loop
        rectCount = rectCount+1;
        myRects(rectCount,:)=[x y x+rectSize/2 y+rectSize /2];
    end
end


screenCntrX=screenRect(3)/2+displaySize/4;
screenCntrY=screenRect(4)/2;

gridCntr=displaySize/2;


myRects(:,[1 3])=myRects(:,[1 3])+screenCntrX-gridCntr+rectSize/4;
myRects(:,[2 4])=myRects(:,[2 4])+screenCntrY-gridCntr+rectSize/4;
totalNumberRect=rectCount;

continueGame=["yes.jpeg","no.jpg"];
% initialising display
    for k=1:2
        piccc=continueGame(k);
        im=imread(piccc);
        somet=Screen('MakeTexture',win,im);
        Screen('DrawTexture',win,somet,[],myRects(k,:));
    end
     Screen(win,'Flip');
     
     pause(2);

noClickYet=true;
notClicked=[1 1];
while noClickYet==1
    for j=1:2
        piccc=continueGame(j);
        im=imread(piccc);
        somet=Screen('MakeTexture',win,im);
        if notClicked(j)
        Screen('DrawTexture',win,somet,[],myRects(j,:));
        end
    end
    Screen(win,'Flip');
    [x,y,buttons]=GetMouse(win);
    for j=1:2
        if buttons(1)==1;
            if x>myRects(j,1) && x<myRects(j,3) && y>myRects(j,2) && y<myRects(j,4) & notClicked(j)==1;
                notClicked(j)=0;
                if notClicked(1)==0;
                   noClickYet=false;
                elseif notClicked(2)==0;
                   noClickYet=false;
                   continuePlaying=1;

                end
            end
    end
end
end
end
gameScores{userNumber,"listening"}=listeningScore;
gameScores{userNumber,"reading"}=readingScore;
gameScores{userNumber,"spelling"}=spellingScore;
    if english==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,['Your reading score is ' num2str(readingScore) ' \n Your listening score is ' num2str(listeningScore) ' \n Your spelling score is ' num2str(spellingScore)] ,'center','center', [0 0 250]);
    elseif nativeAlbanian==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,['Kaq pike ke fituar ne lexim ' num2str(readingScore) ' \n Kaq pike ke fituar ne degjim ' num2str(listeningScore) ' \n Kaq pike ke fituar ne shkrim ' num2str(spellingScore)] ,'center','center', [0 0 250]);
    elseif nativeTurkish==1;
     [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,['Okuma puaniniz ' num2str(readingScore) ' \n Dinleme puaniniz ' num2str(listeningScore) ' \n Yazma puaniniz ' num2str(spellingScore)] ,'center','center', [0 0 250]);
    elseif nativeItalian==1;
    [nx, ny, textbounds, wordbounds] = DrawFormattedText(win,['Il tuo punteggio di lettura ' num2str(readingScore) ' \n Il tuo punteggio di ascolto ' num2str(listeningScore) ' \n Il tuo punteggio di scrittura ' num2str(spellingScore)] ,'center','center', [0 0 250]);
    end
Screen(win,'Flip');
pause(3)
roundsPlayed=0;
filename = 'scores.xlsx';
writetable(gameScores,filename,'Sheet',1,'Range','A1')
sca