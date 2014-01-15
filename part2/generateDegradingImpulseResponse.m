function output = generateDegradingImpulseResponse(input, width, height)
    imageWidth = size(input, 1);
    imageHeight = size(input, 2);
    output = zeros(imageWidth, imageHeight);
    
    % We want to obtain an integral of 1 (ie sum of total values = 1)
    value = 1 / (width * height);
    
    xBegin = floor((imageWidth / 2) - (width/ 2));
    yBegin = floor((imageHeight / 2) - (height / 2));
    for x = xBegin:(xBegin + height)
        for y = yBegin:(yBegin + width)
            output(x, y) = value;
        end
    end
end