var simplemaps_countrymap_mapdata={
	
  main_settings: {
   //General settings
    width: "300", //'700' or 'responsive'
    background_color: "#FFFFFF",
    background_transparent: "yes",
    border_color: "#ffffff",
    
    //State defaults
    state_description: "인구수",
    state_color: "#88A4BC",
    state_hover_color: "#3B729F",
    state_url: "",
    border_size: 1.5,
    all_states_inactive: "no",
    all_states_zoomable: "yes",
    
    //Location defaults
    location_description: "인구수",
    location_url: "",
    location_color: "#FF0067",
    location_opacity: 0.8,
    location_hover_opacity: 1,
    location_size: 25,
    location_type: "square",
    location_image_source: "frog.png",
    location_border_color: "#FFFFFF",
    location_border: 2,
    location_hover_border: 2.5,
    all_locations_inactive: "no",
    all_locations_hidden: "no",
    
    //Label defaults
    label_color: "#d5ddec",
    label_hover_color: "#d5ddec",
    label_size: 22,
    label_font: "Arial",
    hide_labels: "no",
    hide_eastern_labels: "no",
   
    //Zoom settings
    zoom: "yes",
    manual_zoom: "yes",
    back_image: "no",
    initial_back: "no",
    initial_zoom: "-1",
    initial_zoom_solo: "no",
    region_opacity: 1,
    region_hover_opacity: 0.6,
    zoom_out_incrementally: "yes",
    zoom_percentage: 0.99,
    zoom_time: 0.5,
    
    //Popup settings
    popup_color: "white",
    popup_opacity: 0.9,
    popup_shadow: 2,
    popup_corners: 5,
    popup_font: "12px/1.5 Verdana, Arial, Helvetica, sans-serif",
    popup_nocss: "no",
    
    //Advanced settings
    div: "map",
    auto_load: "yes",
    url_new_tab: "no",
    images_directory: "default",
    fade_time: 0.1,
    /*link_text: "View Website",*/
    popups: "detect",
    state_image_url: "",
    state_image_position: "",
    location_image_url: ""
  },
  state_specific: {
    KOR2494: {
      color: "#ff6683",
      name: "North Jorji"
    },
    KOR2496: {
      color: "#ff6683",
      name: "Gangwon"
    },
    KOR2497: {
      color: "#ff6683",
      name: "Seoul"
    },
    KOR2498: {
      color: "#ff0031",
      name: "Gyeonggi"
    },
    KOR2499: {
      color: "#ff6683",
      name: "North Jeolla"
    },
    KOR2500: {
      color: "#ff6683",
      name: "Gwangju"
    },
    KOR2502: {
      color: "#ff6683",
      name: "South Chungcheong"
    },
    KOR2495: {
        color: "#ff335a",
        name: "Incheon"
    },
    KOR2503: {
      color: "#ff6683",
      name: "Daejeon"
    },
    KOR2504: {
      color: "#ff6683",
      name: "Daegu"
    },
    KOR2505: {
      color: "#ff6683",
      name: "South Gyeongsang"
    },
    KOR2506: {
      color: "#ff6683",
      name: "South Jeolla"
    },
    KOR2507: {
      color: "#ff6683",
      name: "Busan"
    },
    KOR2508: {
      color: "#ff6683",
      name: "Ulsan"
    },
    KOR2509: {
      color: "#99001d",
      name: "North Gyeongsang"
    },
    KOR2510: {
      color: "#ff6683",
      name: "바보"
    },
    KOR5129: {
      color: "#ff6683",
      name: "Sejong"
    }
  },
//  점찍기
  locations: {},
  labels: {},
  regions: {},
  data: {
    data: {
      KOR2494: "100",
      KOR2496: "33",
      KOR2497: "44",
      KOR2498: "555",
      KOR2499: "55",
      KOR2500: "66",
      KOR2502: "77",
      KOR2504: "99",
      KOR2503: "88",
      KOR2506: "13",
      KOR2507: "14",
      KOR2508: "16",
      KOR2509: "1000",
      KOR2510: "34",
      KOR5129: "54",
      KOR2495: "220",
      KOR2505: "12"
    }
  }
};