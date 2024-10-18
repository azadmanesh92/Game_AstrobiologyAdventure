
function astrobiology_adventure
    % Create the main figure
    hFig = figure('Name', 'Astrobiology Adventure', 'NumberTitle', 'off', ...
                  'Position', [100, 100, 800, 600], 'MenuBar', 'none');

    % Create UI components
    uicontrol('Style', 'text', 'String', 'Choose a Planet:', ...
              'Position', [50, 550, 100, 30]);
    planetMenu = uicontrol('Style', 'popup', 'String', {'Earth', 'Mars', 'Europa', 'Titan'}, ...
                           'Position', [150, 550, 100, 30], 'Callback', @selectPlanet);
    
    uicontrol('Style', 'text', 'String', 'Select Elements to Mix:', ...
              'Position', [50, 500, 150, 30]);
    elementList = uicontrol('Style', 'listbox', 'String', {'Water', 'Methane', 'Ammonia', 'Silicon'}, ...
                            'Position', [50, 400, 150, 100], 'Max', 2);
    
    uicontrol('Style', 'pushbutton', 'String', 'Create Creature', ...
              'Position', [50, 350, 150, 30], 'Callback', @createCreature);

    % Placeholder for creature display
    creatureDisplay = axes('Position', [0.3, 0.1, 0.6, 0.8]);

    % Callback functions
    function selectPlanet(~, ~)
        selectedPlanet = planetMenu.String{planetMenu.Value};
        disp(['Selected Planet: ', selectedPlanet]);
        % Update graphics based on selected planet
    end

    function createCreature(~, ~)
        selectedElements = elementList.String(elementList.Value);
        creature = generateCreature(selectedElements);
        displayCreature(creature);
    end

    function creature = generateCreature(elements)
        % Generate a creature based on selected elements
        creature.name = ['Zog', num2str(randi(100))]; % Random name
        creature.size = randi([1, 10]); % Random size
        creature.color = rand(1, 3); % Random color
        creature.ability = 'Produces Rainbows'; % Funny ability
        creature.backstory = 'Once a humble blob, now a cosmic hero!'; 
    end

    function displayCreature(creature)
        % Display the creature properties
        axes(creatureDisplay);
        cla; % Clear axes
        % Create a simple representation of the creature
        rectangle('Position', [0.5, 0.5, creature.size, creature.size], ...
                  'FaceColor', creature.color);
        title(['Creature: ', creature.name]);
        xlabel(['Ability: ', creature.ability]);
        text(0.5, 0.2, creature.backstory, 'HorizontalAlignment', 'center');
    end
end