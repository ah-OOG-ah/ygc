execute if block ^ ^ ^0.5 glass_pane run setblock ^ ^ ^0.5 air destroy
execute if block ^ ^ ^0.5 #air run particle smoke ~ ~ ~ 0.1 0.1 0.1 0 4 force
execute if block ^ ^ ^0.5 #air positioned ~ ~-1 ~ as @e[distance=..1] run damage @s 8 arrow
execute if block ^ ^ ^0.5 #air positioned ~ ~-1 ~ unless entity @n[distance=..1] positioned ~ ~1 ~ positioned ^ ^ ^0.5 run function ygc:ray
