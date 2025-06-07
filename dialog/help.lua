proxy_dialog = [[
add_label_with_icon|big|`#Proxy Commands|left|12658|

add_spacer|small|

add_label_with_icon|small|`#Main Features:|left|9408|
add_smalltext|`5/surg `@(Enables Auto Surg)|
add_smalltext|`5/wrench `@(Select Wrench Mode Pull/Kick/Ban/Trade)|

add_spacer|small|

add_label_with_icon|small|`#Information:|left|10652|
add_smalltext|`5/balance && /bal `@(Show Your Current Lock Balance)|
add_smalltext|`5/calc [Math Problem] `@(Calculates a Math Problem and Displays The Answer)|

add_spacer|small|

add_label_with_icon|small|`#Shortcuts:|left|8834|
add_smalltext|`5/warp && /wp `@(Warps To A World)|
add_smalltext|`5/pvend [item] `@(Locates The Cheapest Selling Item In A Vending Machine And Pathfinds To It)|

end_dialog|cmdproxy|Close|
]]

SendVariantList({ [0] = "OnDialogRequest", [1] = proxy_dialog })
