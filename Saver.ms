macroScript test
category:"#Kobranovsky"
toolTip:"YebKnopka"
(
try(destroydialog testDialog)catch()
(

rollout testDialog "YebKnopka"
(

	group "Save Path:" -- save path 
	(
		edittext etSavePath ""
	)

	group "Save Name:"-- save name 
	(
		checkbox checkBoxName "Change Name?"  checked:on triState: 0
		edittext etSaveName ""
	)

	function SaveVfbContent pic = 
	(
		buffer = CoronaRenderer.CoronaFp.getVfbContent 0 true true--more info here: https://corona-renderer.com/wiki/maxscript
		buffer.filename = pic
		save buffer quiet:true
		close buffer; free buffer -- release it from the ram without waiting the garbage collector

	)

	group "Horny button" -- for fun 
    (
	button btn_button "Press Me If You Can"
	on btn_button pressed do
	(
		messageBox "weaker" width:300
		)
	)

	group "Yebuchaja Knopka" -- that button 
	(
		button doIt "Do it" 
		on doIt pressed do
		(

			fileName = "_" + etSaveName.text + "_"
			savePath = etSavePath.text

			t = getLocalTime() 
			#(2009, 4, 3, 8, 22, 42, 19, 62)
			splitSign = "_"
				"_"
			renderDate = t[1] as string +"_"+ t[2] as string +"_"+ t[4] as string + splitSign + (formattedPrint t[5] format:".2d") +"_" + (formattedPrint t[6] format:".2d")  +"_"+ t[7] as string
			"2009_4_8_22_42_19"


			renderFilename = "\\" + renderDate + fileName + ".jpg"
			img = savePath + renderFilename

			SaveVfbContent img

			print "done"

		)
	)


hyperlink hyperLink "Site" align:#center hoverColor:(color 0 255 255) address:"http://be.net/kobranov"
label vrsn "version 1.0" 	--link	

	)
	)
createDialog testDialog width:300

)