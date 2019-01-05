package team.lala.timebank.commons;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component
public class ContinentDistributor {
	static Map<String, String> map = new HashMap<>();
	
	public static String getContinentByCountry(String countryName) {
		return map.get(countryName);
		
	}

	
	
	private ContinentDistributor() {
//亞洲
		map.put("中國","東亞");
		map.put("蒙古","東亞");
		map.put("朝鮮","東亞");
		map.put("韓國","東亞");
		map.put("日本","東亞");
		map.put("越南","東南亞");
		map.put("竂國","東南亞");
		map.put("柬埔寨","東南亞");
		map.put("緬甸","東南亞");
		map.put("泰國","東南亞");
		map.put("馬來西亞","東南亞");
		map.put("新加坡","東南亞");
		map.put("菲律賓","東南亞");
		map.put("印尼","東南亞");
		map.put("東帝汶","東南亞");		
		map.put("哈薩克","中南亞");
		map.put("吉爾吉斯","中南亞");
		map.put("烏茲別克","中南亞");
		map.put("塔吉克斯坦","中南亞");
		map.put("土庫曼斯坦","中南亞");
		map.put("阿富汗","中南亞");
		map.put("巴基斯坦","中南亞");
		map.put("尼泊爾","中南亞");
		map.put("不丹","中南亞");
		map.put("印度","中南亞");
		map.put("孟加拉","中南亞");
		map.put("斯里蘭卡","中南亞");
		map.put("馬爾地夫","中南亞");		
		map.put("伊朗","西亞");
		map.put("伊拉克","西亞");
		map.put("科威特","西亞");
		map.put("沙烏地阿拉伯","西亞");
		map.put("巴林","西亞");
		map.put("卡塔爾","西亞");
		map.put("阿曼","西亞");
		map.put("葉門","西亞");
		map.put("約旦","西亞");
		map.put("以色列","西亞");
		map.put("敘利亞","西亞");
		map.put("黎巴嫩","西亞");
		map.put("土耳其","西亞");
		map.put("賽普勒斯","西亞");
		map.put("阿塞拜疆","西亞");
		map.put("格魯吉亞","西亞");
		map.put("亞美尼亞","西亞");
//美洲
		map.put("墨西哥","中美洲");
		map.put("貝里斯","中美洲");
		map.put("瓜地馬拉","中美洲");
		map.put("伯利茲","中美洲");
		map.put("薩爾瓦多","中美洲");
		map.put("洪都拉斯","中美洲");
		map.put("尼加拉瓜","中美洲");
		map.put("哥斯達黎加","中美洲");
		map.put("巴拿馬","中美洲");		
		map.put("哥倫比亞","南美洲");
		map.put("厄瓜多爾","南美洲");
		map.put("委內瑞拉","南美洲");
		map.put("圭亞那","南美洲");
		map.put("蘇里南","南美洲");
		map.put("秘魯","南美洲");
		map.put("玻利維亞","南美洲");
		map.put("圭亞那","南美洲");			
		map.put("巴哈馬","加勒比群島");
		map.put("古巴","加勒比群島");
		map.put("牙買加","加勒比群島");
		map.put("海地","加勒比群島");
		map.put("多明尼加","加勒比群島");
		map.put("波多黎各","加勒比群島");
		map.put("安圭拉","加勒比群島");
		map.put("蒙特塞拉特","加勒比群島");
		map.put("萊索托","加勒比群島");
//非洲
		map.put("埃及","北非");
		map.put("蘇丹","北非");
		map.put("利比亞","北非");
		map.put("突尼斯","北非");
		map.put("阿爾及利亞","北非");
		map.put("摩洛哥","北非");
		map.put("西撒哈拉","北非");	
		map.put("尚比亞","南非");
		map.put("辛巴威","南非");
		map.put("博茨瓦納","南非");
		map.put("納米比亞","南非");
		map.put("南非","南非");
		map.put("斯威士蘭","南非");
		map.put("萊索托","南非");		
		map.put("塞內加爾","西非");
		map.put("岡比亞","南非");
		map.put("幾內亞","南非");
		map.put("加納","南非");
		map.put("多哥","南非");
		map.put("尼日爾","南非");
		map.put("聖赫勒拿","南非");		
		map.put("索馬里","東非");
		map.put("肯亞","東非");
		map.put("肯雅","東非");
		map.put("烏干達","東非");
		map.put("坦桑尼亞","東非");
		map.put("盧旺達","東非");
		map.put("布隆迪","東非");
		map.put("馬拉維","東非");
		map.put("馬達加斯加","東非");
		map.put("莫三比克","東非");
		map.put("科摩羅","東非");
		map.put("馬約特","東非");
		map.put("埃塞俄比亞","東非");
//大洋洲
		map.put("斐濟","大洋洲");
		map.put("薩摩亞","大洋洲");
//歐洲
		map.put("羅馬尼亞","歐洲");
		

		
	}
	
	
}
