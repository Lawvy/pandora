socialportal = [[text_scaling_string|roleassets1234

add_label_with_icon|big|`#Proxy Menu|left|12658|

add_spacer|small|

add_textbox|`@Hi, ]]..GetLocal().name..[[|
add_smalltext|`@Your Using Free Beta Version Of Pandora|
add_smalltext|`@Found a bug? Contact Me On Discord `0@lv3not7221|

add_spacer|small|

add_button_with_icon|wrenchlink|`@Wrench|staticPurpleFrame|32||
add_button_with_icon|loglink|`@Logging|staticPurpleFrame|2916||
add_button_with_icon|spinlink|`@Roulette|staticPurpleFrame|758||
add_button_with_icon|otherlink|`@Other|staticPurpleFrame|3180||
add_button_with_icon|proxy|`@Commands|staticPurpleFrame|12658||
add_button_with_icon||END_LIST|noflags|0||
add_button_with_icon|changelog|`@Changelog|staticPurpleFrame|3524||
add_button_with_icon|contact|`@Contact|staticPurpleFrame|8028||
add_button_with_icon|social|`@Social Portal|staticPurpleFrame|1366||
add_button_with_icon||END_LIST|noflags|0||

add_quick_exit
end_dialog|menuproxy|Close|
]]

SendVariantList({ [0] = "OnDialogRequest", [1] = socialportal })
