class Website {
  final String id;
  final String name;
  final String domain;
  final String imageUrl;
  final String countryName;

  Website({
    this.id,
    this.name,
    this.domain,
    this.imageUrl,
    this.countryName,
  });
}

List<Website> webs = [
  //Liberia websites
  Website(
      id: "newDawn",
      name: "NewDawn",
      domain: "https://thenewdawnliberia.com",
      countryName: "Liberia",
      imageUrl:
          "https://thenewdawnliberia.com/wp-content/uploads/2018/08/logo.png",),
  Website(
      id: "fpa",
      name: "Front Page Africa",
      domain: "https://frontpageafricaonline.com",
      countryName: "Liberia",
      imageUrl:
          "https://new.frontpageafricaonline.com/wp-content/uploads/2018/05/newfpa-logo.png",),
  Website(
      id: "observer",
      name: "The Observer",
      domain: "https://www.liberianobserver.com/",
      countryName: "Liberia",
      imageUrl:
          "http://liberianobserver.com/wp-content/uploads/2017/03/Observer_logo_2-300x70-300x70.png",),
  Website(
      id: "emansion",
      name: "Executive Mansion",
      domain: "https://www.emansion.gov.lr/",
      countryName: "Liberia",
      imageUrl:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Coat_of_arms_of_Liberia.svg/1200px-Coat_of_arms_of_Liberia.svg.png",),
  Website(
    id: "bushchicken",
    name: "Bush Chicken",
    domain: "https://bushchicken.com/",
    countryName: "Liberia",
    imageUrl:
        "https://upload.wikimedia.org/wikipedia/en/d/d9/The_Bush_Chicken.jpg",
  ),
  Website(
    id: "plusliberia",
    name: "Plus Liberia",
    domain: "https://plusliberia.com/",
    countryName: "Liberia",
    imageUrl:
        "https://plusliberia.com/wp-content/uploads/2021/01/PlusLiberiaLogo-7.png",
  ),
  Website(
    id: "themonroviatimes",
    name: "Monrovia Times",
    domain: "https://themonroviatimes.com/",
    countryName: "Liberia",
    imageUrl: "https://themonroviatimes.files.wordpress.com/2018/05/side1.png",
  ),
  Website(
    id: "smartnewsliberia",
    name: "Smart News Liberia",
    domain: "https://smartnewsliberia.com/",
    countryName: "Liberia",
    imageUrl:
        "https://smartnewsliberia.com/wp-content/uploads/2020/11/wp-1605386617438-150x150.jpg",
  ),
  Website(
    id: "gossipliberia",
    name: "Gossip Liberia",
    domain: "https://gossipliberia.com/",
    countryName: "Liberia",
    imageUrl:
        "https://gossipliberia.com/wp-content/uploads/2019/09/logo-header-1.png",
  ),
  Website(
    id: "newrepublicliberia",
    name: "New Republic Liberia",
    domain: "https://www.newrepublicliberia.com/",
    countryName: "Liberia",
    imageUrl:
        "https://www.newrepublicliberia.com/wp-content/uploads/2020/12/NewRepublic-Logo.jpg",
  ),
  Website(
    id: "analystliberiaonline",
    name: "The Analyst",
    domain: "https://analystliberiaonline.com/",
    countryName: "Liberia",
    imageUrl:
        "https://www.analystliberiaonline.com/wp-content/uploads/2020/09/Analyst-Logo-sept2020.jpg",
  ),


  //Cote d'Ivoire websites
  Website(
    id: "Fratmat",
    name: "Fratmat",
    domain: "fratmat.info",
    countryName: "Cote d'Ivoire",
    imageUrl: "https://www.fratmat.info/theme_fratmat/images/logo.png",
  ),
  Website(
    id: "Le Nouveau Reveil",
    name: "Le Nouveau Reveil",
    domain: "http://www.lenouveaureveil.com",
    countryName: "Cote d'Ivoire",
    imageUrl: "http://www.lenouveaureveil.com/images/logo_new_fp.gif",
  ),
  Website(
    id: "Abidjan Net",
    name: "Abidjan Net",
    domain: "http://abidjan.net",
    countryName: "Cote d'Ivoire",
    imageUrl: "https://abidjan.net/images/logo_abidjan2.jpg?v=141220201253",
  ),
  Website(
    id: "Gbich",
    name: "Gbich",
    domain: "https://gbich.net",
    countryName: "Cote d'Ivoire",
    imageUrl: "https://gbich.net/wp-content/uploads/2020/08/logo-gbichnet.png",
  ),
  Website(
    id: "Afrique Sur 7",
    name: "Afrique Sur 7",
    domain: "https://www.afrique-sur7.ci",
    countryName: "Cote d'Ivoire",
    imageUrl:
        "https://www.afrique-sur7.ci/templates.as7/desktop/images/logo_header.png",
  ),
  Website(
    id: "Sport Ivoire",
    name: "Sport Ivoire",
    domain: "http://www.sport-ivoire.ci",
    countryName: "Cote d'Ivoire",
    imageUrl:
        "http://www.sport-ivoire.ci/sites/all/themes/multipurpose/images/logo-sport-ivoire.png",
  ),
  Website(
    id: "notrevoienews",
    name: "Notre Voie",
    domain: "https://www.notrevoienews.com/",
    countryName: "Cote d'Ivoire",
    imageUrl:
        "https://www.notrevoienews.com/wp-content/uploads/2019/03/logo-newsletter-notrevoie-img001.png",
  ),
  Website(
    id: "Magazine",
    name: "Magazine",
    domain: "https://lifemag-ci.com",
    countryName: "Cote d'Ivoire",
    imageUrl:
        "https://lifemag-ci.com/wp-content/uploads/2017/02/logo-Life-Magazine.png",
  ),
  Website(
    id: "IvoireBusiness",
    name: "Ivoire Business",
    domain: "https://www.ivoirebusiness.net",
    countryName: "Cote d'Ivoire",
    imageUrl:
        "https://www.ivoirebusiness.net/sites/all/themes/ivoirebusiness3/logo.png",
  ),
  Website(
    id: "Ivoire Matin",
    name: "Ivoire Matin",
    domain: "http://www.ivoirematin.com",
    countryName: "Cote d'Ivoire",
    imageUrl: "http://www.ivoirematin.com/images/logo.png",
  ),
  //Nigeria websites
  Website(
    id: "The Guardian",
    name: "The Guardian",
    domain: "https://guardian.ng",
    countryName: "Nigeria",
    imageUrl: "https://guardian.ng/wp-content/themes/guardian2016/img/guardian_logo.png",
  ),
  Website(
    id: "Vanguard",
    name: "Vanguard",
    domain: "https://www.vanguardngr.com",
    countryName: "Nigeria",
    imageUrl: "https://www.vanguardngr.com/vanguardngr-logo.svg",
  ),
 Website(
    id: "Premium Times",
    name: "Premium Times",
    domain: "https://media.premiumtimesng.com",
    countryName: "Nigeria",
    imageUrl: "https://media.premiumtimesng.com/wp-content/files/2020/09/ptn-logo.png",
  ),
Website(
    id: "Daily Trust",
    name: "Daily Trust",
    domain: "https://dailytrust.com",
    countryName: "Nigeria",
    imageUrl: "https://dailytrust.com/images/dailytrust.svg",
  ),
Website(
    id: "Channels TV",
    name: "Channels TV",
    domain: "https://www.channelstv.com",
    countryName: "Nigeria",
    imageUrl: "https://www.channelstv.com/wp-content/themes/channels2016/ctvlogo.png",
  ),

Website(
    id: "Legit",
    name: "Legit",
    domain: "https://static-legit.akamaized.net",
    countryName: "Nigeria",
    imageUrl: "https://static-legit.akamaized.net/legit/img/logo-header.svg",
  ),
Website(
    id: "The Nation",
    name: "The Nation",
    domain: "https://thenationonlineng.net",
    countryName: "Nigeria",
    imageUrl: "https://thenationonlineng.net/wp-content/uploads/2019/05/trans-tn.fw_.fw_-1-2.png",
  ),
Website(
    id: "Tribune",
    name: "Tribune",
    domain: "https://tribuneonlineng.com",
    countryName: "Nigeria",
    imageUrl: "https://tribuneonlineng.com/wp-content/uploads/2020/03/Tribune-Online-Homelogo.jpg",
  ),
Website(
    id: "Sun",
    name: "Sun",
    domain: "https://www.sunnewsonline.com",
    countryName: "Nigeria",
    imageUrl: "https://www.sunnewsonline.com/wp-content/uploads/2018/12/thesunnews-logo-latest.gif",
  ),


];
