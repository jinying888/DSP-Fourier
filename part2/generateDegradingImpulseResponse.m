function output = generateDegradingImpulseResponse(input, width, height)
    imageWidth = size(input, 1);
    imageHeight = size(input, 2);
    output = zeros(imageWidth, imageHeight);
    
    % We want to obtain an integral of 1 (ie sum of total values = 1)
    value =  1 / (width * height);
    
    xBegin = ceil((imageWidth / 2) - (width / 2));
    yBegin = ceil((imageHeight / 2) - (height / 2));
    for x = xBegin:(xBegin + width - 1)
        for y = yBegin:(yBegin + height - 1)
            output(y, x) = value;
        end
    end
end