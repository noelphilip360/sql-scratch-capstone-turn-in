{\rtf1\ansi\ansicpg1252\cocoartf1671\cocoasubrtf200
{\fonttbl\f0\fswiss\fcharset0 ArialMT;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;\red56\green56\blue56;\red255\green255\blue255;
}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;\cssrgb\c28235\c28235\c28235;\cssrgb\c100000\c100000\c100000;
}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\sl264\slmult1\partightenfactor0

\f0\fs29\fsmilli14667 \cf2 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2  
\fs22 SELECT *\
 FROM survey\
 LIMIT 10;\
\'97\
\pard\pardeftab720\sl264\slmult1\partightenfactor0
\cf2  SELECT question, COUNT (DISTINCT user_id)\
 FROM survey\
 GROUP BY 1;\
\pard\pardeftab720\sl264\slmult1\partightenfactor0
\cf2 \'97-\
\pard\pardeftab720\sl264\slmult1\partightenfactor0
\cf3 \cb4 \strokec3  SELECT *\cf2 \strokec2 \
\cf3 \strokec3  FROM quiz\cf2 \strokec2 \
\cf3 \strokec3  LIMIT 5;\cf2 \strokec2 \
\pard\pardeftab720\sl264\slmult1\partightenfactor0
\cf2 \cb1 \
\pard\pardeftab720\sl264\slmult1\partightenfactor0
\cf3 \cb4 \strokec3  SELECT *\cf2 \strokec2 \
\cf3 \strokec3  FROM home_try_on\cf2 \strokec2 \
\cf3 \strokec3  LIMIT 5;\
\
\pard\pardeftab720\sl264\slmult1\partightenfactor0
\cf3  SELECT *\cf2 \strokec2 \
\cf3 \strokec3  FROM purchase\cf2 \strokec2 \
\cf3 \strokec3  LIMIT 5;\
\'97\
\pard\pardeftab720\sl264\slmult1\partightenfactor0
\cf2 \cb1 \strokec2 SELECT DISTINCT q.user_id, \
 	 h.user_id IS NOT NULL AS 'is_home_try_on',\
 	 h.number_of_pairs, \
 \'a0\'a0p.user_id IS NOT NULL AS 'is_purchase'\
FROM quiz AS q\
 LEFT JOIN home_try_on AS h\
 	ON q.user_id = h.user_id\
 LEFT JOIN purchase AS p\
 	ON h.user_id = p.user_id\
 LIMIT 10;\
\pard\pardeftab720\sl264\slmult1\partightenfactor0
\cf2 \cb4 \'97\
\pard\pardeftab720\sl264\slmult1\partightenfactor0
\cf2 \cb1 WITH funnels AS (\
SELECT DISTINCT q.user_id, \
 	 h.user_id IS NOT NULL AS 'is_home_try_on',\
 	 h.number_of_pairs, \
 \'a0\'a0p.user_id IS NOT NULL AS 'is_purchase'\
FROM quiz AS q\
 LEFT JOIN home_try_on AS h\
 	ON q.user_id = h.user_id\
 LEFT JOIN purchase AS p\
 	ON h.user_id = p.user_id)\
 \'a0\
 SELECT COUNT (DISTINCT user_id) AS num_quiz,\
 \'a0	SUM (is_home_try_on) AS home_tried,\
 \'a0\'a0\'a01.0 * SUM(is_home_try_on)/COUNT(user_id),\
 \'a0\'a0\'a0SUM (is_purchase) AS purchased,\
 \'a0\'a0\'a01.0 * SUM(is_purchase)/SUM (is_home_try_on)\
 \'a0FROM funnels;\
\pard\pardeftab720\sl264\slmult1\partightenfactor0
\cf2 \cb4 \
\pard\pardeftab720\sl264\slmult1\partightenfactor0
\cf2 \
}