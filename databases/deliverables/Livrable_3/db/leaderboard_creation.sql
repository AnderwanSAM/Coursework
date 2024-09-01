SELECT * FROM athletes_list 
INNER JOIN  score_board
ON athletes_list.id = score_board.athletes_id;
