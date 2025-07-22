execute as @e[type=trident] if data entity @s item.components."minecraft:enchantments"."ygc:magnetism" at @s store result storage magnetism level int 1.0 run data get entity @s item.components."minecraft:enchantments"."ygc:magnetism"
execute as @e[type=trident] if data entity @s item.components."minecraft:enchantments"."ygc:magnetism" at @s run function ygc:magnetize with storage magnetism

execute as @e[tag=spawned] at @s if block ~ ~ ~ air run setblock ~ ~ ~ dispenser[facing=down]{CustomName:"Block Breaker",lock:{count:999}}
tag @e[tag=spawned] remove spawned
execute as @e[tag=block_breaker] at @s unless block ~ ~ ~ dispenser run summon item ~ ~ ~ {Item:{id:"minecraft:silverfish_spawn_egg",components:{item_model:"minecraft:dispenser",item_name:"Block Breaker",entity_data:{id:"minecraft:marker",Tags:[block_breaker,spawned]}}}}
execute as @e[tag=block_breaker] at @s unless block ~ ~ ~ dispenser run kill @s
execute as @e[tag=block_breaker] at @s if block ~ ~ ~ dispenser[facing=down,triggered=true] run setblock ~ ~-1 ~ air destroy

execute as @e[scores={thunder=1..}] run weather thunder 300s
scoreboard players reset @a[scores={thunder=1..}] thunder

execute as @e[type=item,nbt={Item:{id:"minecraft:fermented_spider_eye",components:{"minecraft:item_name":"Dried Fermented Spider Eye"}}}] at @s if entity @e[distance=..0.3,type=item,nbt={Item:{id:"minecraft:potion",components:{"minecraft:potion_contents":{potion:"minecraft:awkward"}}}}] run particle smoke ~ ~ ~ 0 0 0 1 10 force
execute as @e[type=item,nbt={Item:{id:"minecraft:fermented_spider_eye",components:{"minecraft:item_name":"Dried Fermented Spider Eye"}}}] at @s if entity @e[distance=..0.3,type=item,nbt={Item:{id:"minecraft:potion",components:{"minecraft:potion_contents":{potion:"minecraft:awkward"}}}}] run playsound entity.zombie_villager.cure
execute as @e[type=item,nbt={Item:{id:"minecraft:fermented_spider_eye",components:{"minecraft:item_name":"Dried Fermented Spider Eye"}}}] at @s if entity @e[distance=..0.3,type=item,nbt={Item:{id:"minecraft:potion",components:{"minecraft:potion_contents":{potion:"minecraft:awkward"}}}}] run summon item ~ ~0.5 ~ {Item:{id:"sugar",components:{item_name:"Drugs",use_cooldown:{cooldown_group:"drugs",seconds:590},consumable:{on_consume_effects:[{type:"apply_effects",effects:[{id:"saturation",duration:12000}]},{type:"remove_effects",effects:["slowness","mining_fatigue","hunger"]}]}}}}
execute as @e[type=item,nbt={Item:{id:"minecraft:fermented_spider_eye",components:{"minecraft:item_name":"Dried Fermented Spider Eye"}}}] at @s if entity @e[distance=..0.3,type=item,nbt={Item:{id:"minecraft:potion",components:{"minecraft:potion_contents":{potion:"minecraft:awkward"}}}}] run kill @e[distance=..0.3,type=item]


execute as @a[nbt={active_effects:[{id:"minecraft:saturation",duration:1}]}] run effect give @s slowness 3600 2
execute as @a[nbt={active_effects:[{id:"minecraft:saturation",duration:1}]}] run effect give @s mining_fatigue 3600 0
execute as @a[nbt={active_effects:[{id:"minecraft:saturation",duration:1}]}] run effect give @s hunger 3600 0

execute as @e[type=creeper] on vehicle if entity @s[nbt={OnGround:0b}] on passengers run tag @s add bomb
execute as @e[type=creeper] on vehicle if entity @s[nbt={OnGround:0b}] on passengers run data merge entity @s {powered:true}
execute as @e[type=creeper,tag=bomb] on vehicle if entity @s[nbt={OnGround:1b}] on passengers run data merge entity @s {ignited:true,Fuse:1,ExplosionRadius:5}

execute as @a if items entity @s weapon.mainhand #minecraft:mob_armor run item modify entity @s weapon.mainhand {"function": "minecraft:set_components","components": {"minecraft:enchantable": {"value": 1}}}


recipe give @a ygc:block_breaker
recipe give @a ygc:copper_block_blasting
recipe give @a ygc:glider
recipe give @a ygc:gold_block_blasting
recipe give @a ygc:iron_block_blasting
recipe give @a ygc:trident
recipe give @a ygc:thunder_charm