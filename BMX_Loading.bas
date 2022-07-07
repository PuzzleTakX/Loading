B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=11.8
@EndOfDesignText@
Sub Class_Globals
	
	Private canvas As Panel
	
	Private EvantName As String
	Private Padding As Int = 0.7%x
	Private mloader As Panel
	
	
	Private color As Int = 0xFF56C095
	Private Radius As Int = 16
	
	Private canvasColor As Int = 0xFFE2E2E2
	
	Public Speed As Int = 450
	Private isRunAnimation As Boolean = True
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize(ev As String)
	EvantName = ev
	
	
	canvas.Initialize("canvas")
	canvas.Background =  background(canvasColor)
	


	
	
End Sub

Public Sub AsView As Panel
	Return canvas
End Sub




'// metod


Public Sub initLib()
	mloader.Initialize("mloader")
	mloader.Background =  background(color)
	canvas.AddView(mloader,Padding,Padding,canvas.Height - (Padding * 2),canvas.Height - (Padding * 2))
'	canvas.AddView(mloader,Padding,Padding,canvas.Width - (Padding *2),canvas.Height - (Padding * 2))
End Sub

Public Sub getRadiusLoader As Int
	Return Radius
End Sub
Public Sub setRadiusLoader(r As Int)
	Radius = r
	mloader.Background =  background(color)
	canvas.Background =  background(canvasColor)
End Sub


Public Sub setColorLoader(c As Int)
	color = c
	mloader.Background= background(color)
End Sub
Public Sub getColorLoader As Int
	Return color
End Sub


Public Sub  start 
	chengeRadius(True)
	isRunAnimation = True
	Animation
End Sub

Public Sub stop 
	
	isRunAnimation = False
	Animation
End Sub

Public Sub isRun As Boolean
	Return isRunAnimation
End Sub



Private Sub Animation
	
	Do While True
		If isRunAnimation = False Then 
			chengeRadius(False)
			Exit
			
			Else
				' --------------
			mloader.SetLayoutAnimated(Speed,Padding,Padding,canvas.Width - (Padding * 2),canvas.Height - (Padding * 2))'open
			
			Sleep(Speed + 50)
			  ' --
			mloader.SetLayoutAnimated(Speed,canvas.Width  -canvas.Height ,Padding,canvas.Height - (Padding ),canvas.Height - (Padding * 2))' clos right
			Sleep(Speed)
			chengeRadius(False)
			Sleep(200)
			chengeRadius(True)
			mloader.SetLayoutAnimated(Speed,Padding,Padding,canvas.Width - (Padding * 2),canvas.Height - (Padding * 2))' open
			Sleep(Speed)
			chengeRadius(False)
			Sleep(200)
			chengeRadius(True)
			mloader.SetLayoutAnimated(Speed,Padding,Padding,canvas.Height - (Padding * 2),canvas.Height - (Padding * 2))
			Sleep(Speed)
			chengeRadius(False)
			Sleep(200)
			chengeRadius(True)

			
		End If
	Loop
End Sub

Private Sub chengeRadius(none As Boolean)
	If none Then
		Dim cz As ColorDrawable
		cz.Initialize(color,1 / 2)
		mloader.Background = cz
		Else
		Dim cz As ColorDrawable
		cz.Initialize(color,Radius)
		mloader.Background = cz
	End If
End Sub



Private Sub background(c As Int) As ColorDrawable
	Dim cz As ColorDrawable
	cz.Initialize(c,Radius)
	Return cz
End Sub

