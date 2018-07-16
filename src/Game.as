package
{
import com.tuarua.AdMobANE;
import com.tuarua.admobane.AdSize;
import com.tuarua.admobane.Align;
import com.tuarua.admobane.Targeting;
import com.tuarua.fre.ANEError;

import starling.core.Starling;

import starling.display.Quad;
import starling.display.Sprite;
import starling.utils.Color;

public class Game extends Sprite
{
    private var adMobANE:AdMobANE = new AdMobANE();
    public function Game()
    {
        //on iOS to retrieve your deviceID run: adt -devices -platform iOS
        var vecDevices:Vector.<String> = new <String>[];
        vecDevices.push("ca0e4f3d297c4090775226a7543acfcc1eb9e1fa"); //my iPhone 8
        adMobANE.testDevices = vecDevices;
        adMobANE.init("ca-app-pub-3940256099942544~3347511713", 0.5, true, Starling.current.contentScaleFactor);
        var quad:Quad = new Quad(200, 200, Color.RED);
        quad.x = 100;
        quad.y = 50;
        addChild(quad);
        LoadBanner();

    }
    private function LoadBanner()
    {
        try {
            var targeting:Targeting = new Targeting();
            targeting.birthday = new Date(1999, 5, 10);
            targeting.gender = Targeting.MALE;
            targeting.forChildren = true;
            targeting.contentUrl = "http://googleadsdeveloper.blogspot.com/2016/03/rewarded-video-support-for-admob.html";

            trace("adMobANE.banner.availableSizes:", adMobANE.banner.availableSizes);
            trace("Can we display a smart banner? ",adMobANE.banner.canDisplay(AdSize.FULL_BANNER));

            if (adMobANE.banner.canDisplay(AdSize.FULL_BANNER)) {
                adMobANE.banner.adSize = AdSize.FULL_BANNER;
            } else if (adMobANE.banner.canDisplay(AdSize.SMART_BANNER)) {
                adMobANE.banner.adSize = AdSize.SMART_BANNER;
            } else {
                adMobANE.banner.adSize = AdSize.BANNER;
            }

            adMobANE.banner.adUnit = "ca-app-pub-3940256099942544/6300978111";
            adMobANE.banner.targeting = targeting;
            adMobANE.banner.hAlign = Align.RIGHT;
            adMobANE.banner.vAlign = Align.BOTTOM;


            // x  & y supersede hAlign and vAlign if both > -1
            /*adMobANE.banner.x = 40;
            adMobANE.banner.y = 50;*/

            adMobANE.banner.load();


        } catch (e:ANEError) {
            trace(e.name);
            trace(e.errorID);
            trace(e.type);
            trace(e.message);
            trace(e.source);
            trace(e.getStackTrace());
        }
    }
}
}