package com.iii.trip.trainandhotel.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iii.trip.trainandhotel.repository.City;
import com.iii.trip.trainandhotel.repository.CityRepository;
import com.iii.trip.trainandhotel.repository.Hotel;
import com.iii.trip.trainandhotel.repository.HotelRepository;
import com.iii.trip.trainandhotel.repository.Room;
import com.iii.trip.trainandhotel.repository.RoomOrder;
import com.iii.trip.trainandhotel.repository.RoomOrderRepository;
import com.iii.trip.trainandhotel.repository.RoomRepository;
import com.iii.trip.trainandhotel.repository.Train;
import com.iii.trip.trainandhotel.repository.TrainRepository;
import com.iii.trip.trainandhotel.repository.TrainStation;
import com.iii.trip.trainandhotel.repository.TrainStationRepository;

@Service("initialService")
@Transactional
public class InitialServiceImpl implements InitialService {

	@Autowired
	CityRepository cityRepo;
	@Autowired
	HotelRepository hotelRepo;
	@Autowired
	RoomRepository roomRepo;
	@Autowired
	TrainRepository trainRepo;
	@Autowired
	RoomOrderRepository roomOrderRepo;
	@Autowired
	TrainStationRepository tsRepo;
	
	

	
	@Override
	public void initAll() {
		trainRepo.deleteAll();
		roomRepo.deleteAll();
		roomOrderRepo.deleteAll();
		hotelRepo.deleteAll();
		cityRepo.deleteAll();
		trainRepo.deleteAll();
		tsRepo.deleteAll();
		
		if (cityRepo.findAll().isEmpty()) {
			initCities();
		}
		if (hotelRepo.findAll().isEmpty()) {
			initHotels();
		}
		if (roomRepo.findAll().isEmpty()) {
			initRooms();
		}
		if (roomOrderRepo.findAll().isEmpty()) {
			initRoomOrderies();
		}
		if(trainRepo.findAll().isEmpty()) {
			if(tsRepo.findAll().isEmpty()) {
			initTrain();
			}
		}
	}
	

	@Override
	public void initCities() {
		City tmp = null;
		
		tmp = new City();
		tmp.setName("基隆市");
		String path = "/static/img/基隆市.jpg";
		tmp.setPic(path);
		cityRepo.save(tmp);
		
		tmp = new City();
		tmp.setName("臺北市");
		path = "/static/img/台北市.jpg";
		tmp.setPic(path);
		cityRepo.save(tmp);

		tmp = new City();
		tmp.setName("新北市");
		path = "/static/img/新北市.jpeg";
		tmp.setPic(path);
		cityRepo.save(tmp);

		tmp = new City();
		tmp.setName("桃園縣");
		path = "/static/img/桃園縣.jpg";
		tmp.setPic(path);
		cityRepo.save(tmp);

		tmp = new City();
		tmp.setName("新竹市");
		path = "/static/img/新竹市.jpg";
		tmp.setPic(path);
		cityRepo.save(tmp);

		tmp = new City();
		tmp.setName("新竹縣");
		path = "/static/img/新竹縣.jpg";
		tmp.setPic(path);
		cityRepo.save(tmp);
		
		tmp = new City();
		tmp.setName("苗栗縣");
		path = "/static/img/苗栗.jpg";
		tmp.setPic(path);
		cityRepo.save(tmp);

		tmp = new City();
		tmp.setName("臺中市");
		path = "/static/img/台中市.jpg";
		tmp.setPic(path);
		cityRepo.save(tmp);

		tmp = new City();
		tmp.setName("彰化縣");
		path = "/static/img/彰化.jpg";
		tmp.setPic(path);
		cityRepo.save(tmp);
		
		tmp = new City();
		tmp.setName("南投縣");
		path = "/static/img/南投.jpg";
		tmp.setPic(path);
		cityRepo.save(tmp);

		tmp = new City();
		tmp.setName("雲林縣");
		path = "/static/img/雲林.jpg";
		tmp.setPic(path);
		cityRepo.save(tmp);
		
		tmp = new City();
		tmp.setName("嘉義市");
		path = "/static/img/嘉義市.jpg";
		tmp.setPic(path);
		cityRepo.save(tmp);
		
		tmp = new City();
		tmp.setName("嘉義縣");
		path = "/static/img/嘉義縣.jpg";
		tmp.setPic(path);
		cityRepo.save(tmp);

		tmp = new City();
		tmp.setName("臺南市");
		path = "/static/img/台南.jpg";
		tmp.setPic(path);
		cityRepo.save(tmp);
		
		tmp = new City();
		tmp.setName("屏東縣");
		path = "/static/img/屏東.jpg";
		tmp.setPic(path);
		cityRepo.save(tmp);
		
		tmp = new City();
		tmp.setName("高雄市");
		path = "/static/img/高雄.jpg";
		tmp.setPic(path);
		cityRepo.save(tmp);

		tmp = new City();
		tmp.setName("宜蘭縣");
		path = "/static/img/宜蘭.jpg";
		tmp.setPic(path);
		cityRepo.save(tmp);

		tmp = new City();
		tmp.setName("花蓮縣");
		path = "/static/img/花蓮.jpg";
		tmp.setPic(path);
		cityRepo.save(tmp);

		tmp = new City();
		tmp.setName("臺東縣");
		path = "/static/img/台東.jpg";
		tmp.setPic(path);
		cityRepo.save(tmp);
		
		tmp = new City();
		tmp.setName("澎湖縣");
		path = "/static/img/澎湖.jpg";
		tmp.setPic(path);
		cityRepo.save(tmp);
		
		tmp = new City();
		tmp.setName("金門縣");
		path = "/static/img/金門.jpg";
		tmp.setPic(path);
		cityRepo.save(tmp);
	}

	@Override
	public void initHotels() {
		Hotel hotel = null;
		City city = null;
		
		hotel = new Hotel();
		hotel.setName("台北W");
		city = cityRepo.findByName("臺北市");
		hotel.setCity(city);
		hotel.setAddress("台北信義區忠孝東路5段10號");
		hotel.setIntro("台北 W 飯店兼具藝術與時尚元素，提供奢華住宿體驗，坐落在信義區中心地帶。飯店位於統一時代百貨台北店正上方，擁有美麗的 WET® 室外游泳池和時尚的 Woobar 酒吧，館內的 AWAY® SPA 可為客人提供嬌寵的按摩服務。\n"
				+ "\n"
				+ "客房的風格時尚，室內設計融入在地風情，設有落地窗，可欣賞台北 101、周圍群山與台北市的壯麗景緻。房內選用招牌寢具，設有附沙發或沙發床的休息區、平面電視及音響系統。私人衛浴提供浴缸與精品盥洗用品。\n"
				+ "\n"
				+ "FIT® 健身中心面積 420 平方公尺，提供現代化健身器材、iPod 基座和 LCD 液晶顯示器。飯店也設有大型活動場地，配備最先進的會議設施，可滿足各種活動與商務需求。\n"
				+ "\n"
				+ "知名的紫艷中餐廳提供精緻用餐環境，演繹全新中式料理。其他用餐選擇包括 The Kitchen Table 餐廳的多國美食自助餐，以及池畔酒吧的雞尾酒。\n"
				+ "\n"
				+ "台北 W 飯店距離捷運市政府站僅 2 分鐘步行路程，距離指標性的台北 101 大樓 10 分鐘步行路程。此外，飯店距離台北松山機場 20 分鐘車程，距桃園國際機場 45 分鐘車程，從台北車站搭乘捷運抵達飯店需時 10 分鐘。");
		hotel.setPermission("1");
		hotel.setUserId("a123");
		hotel.setClickCount(0);
		hotel.setType("飯店");
		hotelRepo.save(hotel);

		hotel = new Hotel();
		hotel.setName("煙波大飯店新竹湖");
		city = cityRepo.findByName("宜蘭縣");
		hotel.setCity(city);
		hotel.setAddress("新竹市明湖路773號");
		hotel.setIntro("沐然香憇位於宜蘭礁溪，設有花園和烤肉設施。民宿提供免費的無線網路和私人停車場。\n"
				+ "\n"
				+ "每間客房均配有空調和平面電視。房內備有瓶裝水和電熱水壺。客房均設有附步入式淋浴間的獨立衛浴。為了提供舒適的住宿體驗，房內亦備有毛巾、免費盥洗用品、拖鞋和吹風機。\n"
				+ "\n"
				+ "民宿內設有共用廚房和寬敞的共用休息室。民宿備有自行車供客人免費使用，該地區是騎乘自行車的熱門地點。");
		hotel.setPermission("1");
		hotel.setUserId("b123");
		hotel.setClickCount(0);
		hotel.setType("民宿");
		hotelRepo.save(hotel);
		
		
		hotel = new Hotel();
		hotel.setName("沐然香憩");
		city = cityRepo.findByName("新竹市");
		hotel.setCity(city);
		hotel.setAddress("礁溪鄉六結路65巷11弄18號");
		hotel.setIntro("煙波大飯店新竹都會館位於新竹市，距離遠東巨城購物中心步行 5 分鐘。飯店提供免費 WiFi 並設有免費私人停車場。\n"
				+ "\n"
				+ "煙波大飯店新竹都會館距離新竹火車站 6 分鐘車程，距離國立清華大學約 10 分鐘車程，距離高鐵新竹站 23 分鐘車程。\n"
				+ "\n"
				+ "每間客房均設有空調、衛星電視和水壺。私人衛浴內備有拖鞋、免費盥洗用品和吹風機。\n"
				+ "\n"
				+ "館內設有 24 小時櫃台。");
		hotel.setPermission("1");
		hotel.setUserId("a123");
		hotel.setClickCount(0);
		hotel.setType("飯店");
		hotelRepo.save(hotel);
		
	}

	
	@Override
	public void initRooms() {
		Room room = null;
		List<Hotel> hotelList = null;
		Hotel hotel = null;
		City city = null;
		String name=null;
		int quan = 10;
		
		
		name = "雙人房";
		hotelList = hotelRepo.findByName("台北W");
		hotel = hotelList.isEmpty() ? null : hotelList.get(0);
		city = hotel == null ? null : hotel.getCity();
		for(int i =1;i<=quan;i++) {
			room = new Room();
			if(i<10) {
				room.setName(name+"0"+i);
			}else {
				room.setName(name+i);
			}
			room.setCapacity("2");
			room.setPrice(i * 100.0);
			room.setHotel(hotel);
			room.setCity(city);
			room.setBed("1");
			roomRepo.save(room);
			
		}
		name = "三人房";
		hotelList = hotelRepo.findByName("台北W");
		hotel = hotelList.isEmpty() ? null : hotelList.get(0);
		city = hotel == null ? null : hotel.getCity();
		for(int i =1;i<=quan;i++) {
			room = new Room();
			if(i<10) {
				room.setName(name+"0"+i);
			}else {
				room.setName(name+i);
			}
			room.setCapacity("3");
			room.setPrice(i * 100.0);
			room.setHotel(hotel);
			room.setCity(city);
			room.setBed("2");
			roomRepo.save(room);
		}
		
		name = "五人房";
		hotelList = hotelRepo.findByName("煙波大飯店新竹湖");
		hotel = hotelList.isEmpty() ? null : hotelList.get(0);
		city = hotel == null ? null : hotel.getCity();
		for(int i =1;i<=quan;i++) {
			room = new Room();
			if(i<10) {
				room.setName(name+"0"+i);
			}else {
				room.setName(name+i);
			}
			room.setCapacity("5");
			room.setPrice(i * 100.0);
			room.setHotel(hotel);
			room.setCity(city);
			room.setBed("3");
			roomRepo.save(room);
			
		}
		
		name = "雙人房";
		hotelList = hotelRepo.findByName("煙波大飯店新竹湖");
		hotel = hotelList.isEmpty() ? null : hotelList.get(0);
		city = hotel == null ? null : hotel.getCity();
		for(int i =1;i<=quan;i++) {
			room = new Room();
			if(i<10) {
				room.setName(name+"0"+i);
			}else {
				room.setName(name+i);
			}
			room.setCapacity("2");
			room.setPrice(i * 100.0);
			room.setHotel(hotel);
			room.setCity(city);
			room.setBed("2");
			roomRepo.save(room);
			
		}
		
		/*
		Room room = null;
		List<Hotel> hotelList = null;
		Hotel hotel = null;
		City city = null;
		int floor = 1;

		floor = 9;
		hotelList = hotelService.findByName("台北W");
		hotel = hotelList.isEmpty() ? null : hotelList.get(0);
		city = hotel == null ? null : hotel.getCity();
		for (int i = 2; i < (floor + 1); i++) {
			for (int j = 1; j < (floor - i + 2); j++) {
				room = new Room();
				room.setName(String.format("%d%02d", i, j));
				room.setCapacity(String.valueOf(i));
				room.setPrice(i * 100.0);
				room.setHotel(hotel);
				room.setCity(city);
				room.setSmoke("1");
				roomService.save(room);
			}
		}

		floor = 5;
		hotelList = hotelService.findByName("煙波大飯店新竹湖");
		hotel = hotelList.isEmpty() ? null : hotelList.get(0);
		city = hotel == null ? null : hotel.getCity();
		for (int i = 2; i < (floor + 1); i++) {
			for (int j = 1; j < (floor - i + 2); j++) {
				room = new Room();
				room.setName(String.format("%d%02d", i, j));
				room.setCapacity(String.valueOf(i));
				room.setPrice(i * 100.0);
				room.setHotel(hotel);
				room.setCity(city);
				room.setSmoke("");
				roomService.save(room);
			}
		}
		*/
	}

	@Override
	public void initRoomOrderies() {
		List<Room> roomList = null;
		List<Hotel> hotelList = null;
		City city = new City();
		Hotel hotel = new Hotel();
		Room room = new Room();
		RoomOrder ro = new RoomOrder();

		//第一間
		hotelList = hotelRepo.findByName("煙波大飯店新竹湖");
		if(!hotelList.isEmpty() ) {
			hotel = hotelList.get(0);
		}
		roomList = roomRepo.findByNameAndHotel("雙人房02", hotel);
		if(!roomList.isEmpty()) {
			room = roomList.get(0);
		}
		city = roomList.get(0).getCity();
		ro.setStartDate(LocalDate.parse("2021-04-16"));
		ro.setEndDate(LocalDate.parse("2021-04-18"));
		ro.setCity(city);
		ro.setHotel(hotel);
		ro.setRoom(room);
		roomOrderRepo.save(ro);
		
		ro.setStartDate(LocalDate.parse("2021-04-25"));
		ro.setEndDate(LocalDate.parse("2021-04-27"));
		roomOrderRepo.save(ro);

		ro = new RoomOrder();
		
		//第二間
		roomList = roomRepo.findByNameAndHotel("雙人房02", hotel);
		if(!roomList.isEmpty()) {
			room = roomList.get(0);
		}
		
		ro.setStartDate(LocalDate.parse("2021-04-20"));
		ro.setEndDate(LocalDate.parse("2021-04-21"));
		ro.setCity(city);
		ro.setHotel(hotel);
		ro.setRoom(room);
		roomOrderRepo.save(ro);
		
		ro.setStartDate(LocalDate.parse("2021-04-14"));
		ro.setEndDate(LocalDate.parse("2021-04-18"));
		roomOrderRepo.save(ro);
		
		ro = new RoomOrder();
		//第三間
		roomList = roomRepo.findByNameAndHotel("五人房04", hotel);
		if(!roomList.isEmpty()) {
			room = roomList.get(0);
		}

		ro.setStartDate(LocalDate.parse("2021-04-15"));
		ro.setEndDate(LocalDate.parse("2021-04-20"));
		ro.setCity(city);
		ro.setHotel(hotel);
		ro.setRoom(room);
		roomOrderRepo.save(ro);
		
		ro = new RoomOrder();
		//第二旅館 第一間
		hotelList = hotelRepo.findByName("台北W");
		if(!hotelList.isEmpty() ) {
			hotel = hotelList.get(0);
		}
		roomList = roomRepo.findByNameAndHotel("雙人房02", hotel);
		if(!roomList.isEmpty()) {
			room = roomList.get(0);
		}
		city = roomList.get(0).getCity();

		ro.setStartDate(LocalDate.parse("2021-04-15"));
		ro.setEndDate(LocalDate.parse("2021-04-20"));
		ro.setCity(city);
		ro.setHotel(hotel);
		ro.setRoom(room);
		roomOrderRepo.save(ro);
		
		ro = new RoomOrder();
		//第二間
		roomList = roomRepo.findByNameAndHotel("雙人房03", hotel);
		if(!roomList.isEmpty()) {
			room = roomList.get(0);
		}
		ro.setStartDate(LocalDate.parse("2021-04-15"));
		ro.setEndDate(LocalDate.parse("2021-04-20"));
		ro.setCity(city);
		ro.setHotel(hotel);
		ro.setRoom(room);
		roomOrderRepo.save(ro);
		
	}

	@Override
	public void initTrain() {
		
		Train train = null;
		TrainStation ts = null;
	
		List<String> stations = new ArrayList<>();
		stations.add(0, "基隆");
		stations.add(1, "台北");
		stations.add(2, "板橋");
		stations.add(3, "桃園");
		stations.add(4, "新竹");
		stations.add(5, "苗栗");
		stations.add(6, "台中");
		stations.add(7, "彰化");
		stations.add(8, "南投");
		stations.add(9, "雲林");
		stations.add(10, "嘉義");
		stations.add(11, "台南");
		stations.add(12, "高雄");
		stations.add(13, "屏東");
		stations.add(14, "宜蘭");
		stations.add(15, "花蓮");
		stations.add(16, "台東");

		
		
		for (int i = 0; i < stations.size(); i++) {
			ts = new TrainStation();
			ts.setName(stations.get(i));
			tsRepo.save(ts);
			for (int j = 0; j < stations.size(); j++) {
				if (!stations.get(i).equals(stations.get(j))) {
					train = new Train();
					train.setStart(stations.get(i));
					train.setDest(stations.get(j));
					train.setPrice((double) Math.abs(i-j)*50);
					train.setQuantity(100);
					
					trainRepo.save(train);
				}
			}
		}
 
	}
}

