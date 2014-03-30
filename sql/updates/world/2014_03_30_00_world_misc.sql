-- Fix Quest 11133, 27212  Discrediting the Deserters
-- Fix Guards gossip menu for directions and the quest

UPDATE creature_template SET gossip_menu_id = 8851 WHERE entry = 4979;
UPDATE creature_template SET AIName = 'SmartAI' WHERE entry = 4979;

DELETE FROM gossip_menu_option WHERE menu_id = 8851;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES 
(8851, 0, 0, 'That you\'re not a stupid guy. Maybe read these pamphlets in his spare time, think?', 1, 1, 0, 0, 0, 0, ''),
(8851, 1, 0, 'Bank', 1, 1, 12854, 477, 0, 0, ''),
(8851, 2, 0, 'Class Trainer', 1, 1, 12855, 0, 0, 0, ''),
(8851, 3, 0, 'Profession Trainer', 1, 1, 12865, 0, 0, 0, '');

DELETE FROM smart_scripts WHERE entryorguid = 4979;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(4979, 0, 0, 1, 62, 0, 100, 0, 8851, 0, 0, 0, 1, 1, 5000, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Talk'),
(4979, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 33, 4979, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link-Kredit'),
(4979, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

DELETE FROM creature_text WHERE entry = 4979;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(4979, 1, 1, 'Hey, thanks.', 12, 0, 100, 1, 0, 0, 'theramore guard SAY_QUEST1'),
(4979, 1, 2, '...to establish a fund for the purchase of hair gel? I like my hair the way it is, thanks!', 12, 0, 100, 1, 0, 0, 'theramore guard SAY_QUEST2'),
(4979, 1, 3, '...the deserters seek a Theramore where citizens will be free to juggle at all hours of the day? What is this nonsense?', 12, 0, 100, 1, 0, 0, 'theramore guard SAY_QUEST2'),
(4979, 1, 4, '...receive 50 percent off deserter undergarments? What is this garbage?', 12, 0, 100, 1, 0, 0, 'theramore guard SAY_QUEST2'),
(4979, 1, 5, '...to establish the chicken as the official symbol of Theramore?! These guys are nuts!', 12, 0, 100, 1, 0, 0, 'theramore guard SAY_QUEST2'),
(4979, 1, 6, 'This... this is a joke, right?', 12, 0, 100, 1, 0, 0, 'theramore guard SAY_QUEST3'),
(4979, 1, 7, 'I\'d never join anything like this. Better keep this, though. It\'ll come in handy in the privy...', 12, 0, 100, 1, 0, 0, 'theramore guard SAY_QUEST3'),
(4979, 1, 9, '...as a deserter, you\'ll enjoy activities like tethered swimming and dog grooming? How ridiculous!', 12, 0, 100, 1, 0, 0, 'theramore guard SAY_QUEST2'),
(4979, 1, 10, 'What a bunch of lunatics! You actually believe this stuff?', 12, 0, 100, 1, 0, 0, 'theramore guard SAY_QUEST3');