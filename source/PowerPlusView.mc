using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;

class PowerPlusView extends Ui.DataField {

    var mPowerValue			=	0	;
	var mAvgPowerValue		=	0	;
	var mMaxPowerValue		=	0	;	
	
// Position label -------------------
	var mPowerLabelX		=	0	;
	var mPowerLabelY		=	0	;
	var mAvgPowerLabelX		=	0	;
	var mAvgPowerLabelY		=	0	;	
	var mMaxPowerLabelX		=	0	;
	var mMaxPowerLabelY		=	0	;
// Position value -------------------			        
	var mPowerValX			=	0	;
	var mPowerValY			=	0	;	
	var mAvgPowerValX		=	0	;
	var mAvgPowerValY		=	0	;
	var mMaxPowerValX		=	0	;
	var mMaxPowerValY		=	0	;
	
	
	private var 
		screenCenterX	= 0,
		screenCenterY	= 0,
		posx        	= 0,
		posy        	= 0;
	
	
	private var title   = "",
				status  = "",
				model = "???";
					
    function initialize() {
        DataField.initialize()		;		        
    }


    // Set your layout here. Anytime the size of obscurity of
    // the draw context is changed this will be called.
    function onLayout(dc) {
        // Use the generic, centered layout 
        
        screenCenterY = (dc.getHeight() /2);
        screenCenterX = (dc.getWidth() /2 );    
        //System.println(screenCenterH);
        //System.println(screenCenterV);        
    	model = Ui.loadResource(Rez.Strings.DeviceModel);        
          
		switch (model) {
			case "default":
			// Position label -----------------------------------------------------------
				mPowerLabelX		=	screenCenterX	-	24	;
				mPowerLabelY		=	screenCenterY	-	46	;
				mAvgPowerLabelX		=	screenCenterX	+	38	;
				mAvgPowerLabelY		=	screenCenterY	-	48	;				
				mMaxPowerLabelX		=	screenCenterX	+	34	;
				mMaxPowerLabelY		=	screenCenterY	+	00	;
				  
				mPowerValX			=	screenCenterX	+	15	;
				mPowerValY			=	screenCenterY	-	10	;
				mAvgPowerValX		=	screenCenterX	+	25	;
				mAvgPowerValY		=	screenCenterY	-	28	;
				mMaxPowerValX		=	screenCenterX	+	25	;
				mMaxPowerValY		=	screenCenterY	+	16	;  		
				break;	
					
			case "edge820":
				mPowerLabelX		=	screenCenterX	-	14	;
				mPowerLabelY		=	screenCenterY	-	23	;
				mAvgPowerLabelX		=	screenCenterX	-   8	;
				mAvgPowerLabelY		=	screenCenterY	-	23	;
				mMaxPowerLabelX		=	screenCenterX	+	20	;
				mMaxPowerLabelY		=	screenCenterY	-	8	;
				
				mPowerValX			=	screenCenterX	+	14	;
				mPowerValY			=	screenCenterY	-	06	;
				mAvgPowerValX		=	screenCenterX	+	16	;
				mAvgPowerValY		=	screenCenterY	-	24	;
				mMaxPowerValX		=	screenCenterX	+	16	;
				mMaxPowerValY		=	screenCenterY	+	6	;  		
				break;

			case "edge_520":
				mPowerLabelX		=	screenCenterX	-	14	;
				mPowerLabelY		=	screenCenterY	-	23	;
				mAvgPowerLabelX		=	screenCenterX	-   8	;
				mAvgPowerLabelY		=	screenCenterY	-	23	;
				mMaxPowerLabelX		=	screenCenterX	+	20	;
				mMaxPowerLabelY		=	screenCenterY	-	8	;
				
				mPowerValX			=	screenCenterX	+	14	;
				mPowerValY			=	screenCenterY	-	06	;
				mAvgPowerValX		=	screenCenterX	+	16	;
				mAvgPowerValY		=	screenCenterY	-	24	;
				mMaxPowerValX		=	screenCenterX	+	16	;
				mMaxPowerValY		=	screenCenterY	+	6	;
				break;
			
			case "edge_1000":		
				mPowerLabelX		=	screenCenterX	-	24	;
				mPowerLabelY		=	screenCenterY	-	40	;
				mAvgPowerLabelX		=	screenCenterX	+	38	;
				mAvgPowerLabelY		=	screenCenterY	-	40	;				
				mMaxPowerLabelX		=	screenCenterX	+	34	;
				mMaxPowerLabelY		=	screenCenterY	+	00	;
				  
				mPowerValX			=	screenCenterX	+	15	;
				mPowerValY			=	screenCenterY	-	20	;
				mAvgPowerValX		=	screenCenterX	+	24	;
				mAvgPowerValY		=	screenCenterY	-	26	;
				mMaxPowerValX		=	screenCenterX	+	24	;
				mMaxPowerValY		=	screenCenterY	+	16	;       		
				break;
		}
		          
        //System.println(model);
          
        View.setLayout(Rez.Layouts.MainLayout(dc));
        var powerlabelView			=	View.findDrawableById("powerlabel")			;
        powerlabelView.locX			=	mPowerLabelX								;        
        powerlabelView.locY			=	mPowerLabelY								;
        
        var avgpowerlabelView		=	View.findDrawableById("avgpowerlabel")		;
        avgpowerlabelView.locX		=	mAvgPowerLabelX								;        
        avgpowerlabelView.locY		=	mAvgPowerLabelY								;
        
        var maxpowerlabelView		=	View.findDrawableById("maxpowerlabel")		;
        maxpowerlabelView.locX		=	mMaxPowerLabelX								;
        maxpowerlabelView.locY		=	mMaxPowerLabelY								;
        
        var powerView				=	View.findDrawableById("power")				;
        powerView.locX				=	mPowerValX									;
        powerView.locY				=	mPowerValY									;
        	
        var avgpowerView			=	View.findDrawableById("avgpower")			;
        avgpowerView.locX			=	mAvgPowerValX								;
        avgpowerView.locY			=	mAvgPowerValY								;
        
        
        var maxpowerView			=	View.findDrawableById("maxpower")			;
        maxpowerView.locX			=	mMaxPowerValX								;
        maxpowerView.locY			=	mMaxPowerValY								;
        
        
        View.findDrawableById("powerlabel").setText(Rez.Strings.powerlabel)			;
        View.findDrawableById("avgpowerlabel").setText(Rez.Strings.avgpowerlabel)	;
        View.findDrawableById("maxpowerlabel").setText(Rez.Strings.maxpowerlabel)	;

        return true;
    }

    // The given info object contains all the current workout
    // information. Calculate a value and save it locally in this method.
    function compute(info) {
        // See Activity.Info in the documentation for available information.     
        
        var	Costant	=	0.0	;
        var type = System.getDeviceSettings().distanceUnits;
        if( type == System.UNIT_METRIC ) {
        	 Costant	=	3.6	;
        }else{
        	 Costant	=	2.23694	;       
        }
        
        if(info.currentPower != null)
        {
			//mPowerValue		=	info.currentPower	*	3.6	;
        	mPowerValue		=	info.currentPower	;        	
        }
        else
        {
        	mPowerValue		=	0					;
        }
        
        
        if(info.averagePower != null)
        {
        	//mAvgPowerValue	=	info.averagePower	*	3.6	;        
        	mAvgPowerValue	=	info.averagePower	;
        }
        else
        {
        	mAvgPowerValue	=	0					;
        }
        
        if(info.maxPower != null)
        {
        	//mMaxPowerValue	=	info.maxPower	*	3.6		;        
        	mMaxPowerValue	=	info.maxPower		;
        }
        else
        {
        	mMaxPowerValue	=	0					;
        }
    }

    // Display the value you computed here. This will be called
    // once a second when the data field is visible.
    function onUpdate(dc) {
        // Set the background color
        View.findDrawableById("Background").setColor(getBackgroundColor());

        // Set the foreground color and value
        var power		=	View.findDrawableById("power")		;
        var avgpower	=	View.findDrawableById("avgpower")	;        
        var maxpower	=	View.findDrawableById("maxpower")	;
        		
        if (getBackgroundColor() == Gfx.COLOR_BLACK) {
            power.setColor(Gfx.COLOR_WHITE);
            avgpower.setColor(Gfx.COLOR_WHITE);
			maxpower.setColor(Gfx.COLOR_WHITE);
        } else {
            power.setColor(Gfx.COLOR_BLACK);
            avgpower.setColor(Gfx.COLOR_BLACK);
			maxpower.setColor(Gfx.COLOR_BLACK);
        }

        maxpower.setColor(Gfx.COLOR_DK_RED);        
		
		if( mPowerValue > mAvgPowerValue){
			power.setColor(Gfx.COLOR_DK_GREEN);
		}
		if( mPowerValue < mAvgPowerValue){
			power.setColor(Gfx.COLOR_DK_RED);
		}		
       
        power		.setText		(mPowerValue.format		("%d"))		;
        avgpower	.setText		(mAvgPowerValue.format	("%d"))		;
        maxpower	.setText		(mMaxPowerValue.format	("%d"))		;        

        // Call parent's onUpdate(dc) to redraw the layout
        View.onUpdate(dc);
    }
}
