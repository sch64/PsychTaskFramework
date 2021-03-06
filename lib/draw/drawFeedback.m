function drawFeedback(trialData, blockSettings)
% DRAWFEEDBACK Draws the feedback according to trial data and settings
%
% TODO: Implement vertical switch

windowPtr = blockSettings.device.windowPtr;
W = blockSettings.device.windowWidth; % width
H = blockSettings.device.windowHeight; % height
center = [W / 2, H / 2];

feedbackSize = blockSettings.objects.feedback.dims;
pxOffCenter = [0.05 * W, 0];

% NOTE: Use structs / element class?
button1 = centerRectDims(center, feedbackSize, -pxOffCenter);
button2 = centerRectDims(center, feedbackSize, pxOffCenter);

button1_color = blockSettings.objects.feedback.colorNoAnswer;
button2_color = blockSettings.objects.feedback.colorNoAnswer;

%% Record choice & assign feedback color
% TODO: If a function can translate choice + refSide into a lottery choice,
% this could flag stochastic dominance violations as they happen
if trialData.choice == 1
    button1_color = blockSettings.objects.feedback.colorAnswer;
elseif trialData.choice == 2
    button2_color = blockSettings.objects.feedback.colorAnswer;
end

%% Display feedback (two squares)
Screen('FillRect', windowPtr, button1_color, button1);
Screen('FillRect', windowPtr, button2_color, button2);
end
