----#include !/Analytics
function ga_track(data)
  local url =  "http://www.google-analytics.com/collect"
  local payload = {
    v   = "1",
    tid = "UA-192712398-2",
    cid = Global.getVar("CCID"),
    uid = Global.getVar("UUID"),
  }
  for k, v in pairs(data) do
    payload[tostring(k)] = tostring(v)
  end
  WebRequest.post(url, payload)
end

function ga_event(category, action, label, value)
  local data = {
    t   = "event",
    ec  = category,
    ea  = action,
  }
  if label ~= nil then
    data["el"] = label
    if value ~=nil then
      data["ev"] = value
    end
  end
  ga_track(data)
end

function ga_view(screen, title)
  local data = {
    t   = "pageview",
    dp  = screen,
  }
  if title ~= nil then
    data["dt"] = title
  end
  ga_track(data)
end

function ga_timing(category, variable, time, label)
  ga_track({
    t   = "timing",
    utc = category,
    utv = variable,
    utt = time,
    utl = label,
  })
end

function ga_exception(description, is_fatal)
  if is_fatal == true then
    is_fatal = 1
  else
    is_fatal = 0
  end
  ga_track({
    t   = "exception",
    exd = description,
    exf = is_fatal,
  })
end

----#include !/Analytics
----#include !/CardSchema
----#include !/generated/cards
-- AUTO GENERATED (`npm run generate`). DO NOT MODIFY BY HAND.
GENERATED_CARDS_SCHEMA = {
  units = {
    ["REBEL"] = {
      ["LUKE SKYWALKER HERO OF THE REBELLION"] = {
        name = "Luke Skywalker",
        title = "Hero Of The Rebellion",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133196942/E1A8548A9C0688D979CAD83F32F130B0115D9C50/",
        size = "small",
        type = "Trooper",
        points = 120,
        speed = 2,
        upgrades = {
          Command = 1,
          Force = 1,
          Training = 1,
          Gear = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540537100371/0B15B2810ABEBE5429E4A24852D96BAC2DC28BF7/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540537079134/11A17263AD81DC9D4271B7C6BD809B69141DCB61/",
          },        
        },
        commands = {
          {
            name = "Son Of Skywalker",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133712958/CF63D0FDA40318CE886E6DA309CEB291857776E4/",
            pip = 1,
          },
          {
            name = "You Serve Your Master Well",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133714680/FD14E558D7D2B7EF32BD992FFC1C89141CD1F192/",
            pip = 1,
          },
          {
            name = "My Ally Is The Force",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133711308/CECAE0B5B62858582522F7FBED6463FE5834A64E/",
            pip = 2,
          },
          {
            name = "Full Of Surprises",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133709999/FA890B2A2EA1528C8BCF2A80AEB3B97A97BB9E15/",
            pip = 2,
          },
          {
            name = "Return Of The Jedi",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133711996/90C4CB28C0554DEC3797882252E6C5D3CCAC65A1/",
            pip = 3,
          },
          {
            name = "I Am A Jedi",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133710140/F162DE57287EB8C43F845BF34550B6666929E36A/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Rebel",
      },
      ["LEIA ORGANA FEARLESS AND INVENTIVE"] = {
        name = "Leia Organa",
        title = "Fearless And Inventive",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133196907/3603F95E0847EC7E202162FF2BA8E587A3B8E8D8/",
        size = "small",
        type = "Trooper",
        points = 75,
        speed = 2,
        upgrades = {
          Command = 2,
          Training = 1,
          Gear = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540537137572/2AC01B05AF1576F49C3156EDB614E2C1804C2A42/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540537137853/F8E5FE7B221E9115B36E22C14E5707B7CFA6CFC3/",
          },        
        },
        commands = {
          {
            name = "Coordinated Bombardment",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133709038/5F4C655FAD4092BA114E76531B141C09D17A413C/",
            pip = 1,
          },
          {
            name = "No Time For Sorrows",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133711809/CE6019479334BF3204C4BD05DF6615B7ABA02B44/",
            pip = 2,
          },
          {
            name = "A Beautiful Friendship",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133708647/EA50E83AC0C23B932428034601250A9C698E8F87/",
            pip = 2,
          },
          {
            name = "Somebody Has To Save Our Skins",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133712915/7EFEAD84C8B64A86D130C765225552D91AEAF814/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Rebel",
      },
      ["HAN SOLO UNORTHODOX GENERAL"] = {
        name = "Han Solo",
        title = "Unorthodox General",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133196276/8433A2CEDE2DA7DE9EFEE663DCD27875BA7CA3F6/",
        size = "small",
        type = "Trooper",
        points = 100,
        speed = 2,
        upgrades = {
          Command = 1,
          Training = 1,
          Gear = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540540669649/C440F429AB1182944D329D0C16C3402DB731CA87/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540540669835/B4E395AA781518EAC4FBFFCB27BAA646201F411C/",
          },        
        },
        commands = {
          {
            name = "Sorry About The Mess",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133713891/5010BC7FF52D6539147756EF04579FD860630D4E/",
            pip = 1,
          },
          {
            name = "Reckless Diversion",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133711955/8E5E53B03E9248B3BB6CCBC1942C831C02ACFF67/",
            pip = 2,
          },
          {
            name = "Change Of Plans",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133708965/8DA6716707434EDAF86655364C9557E3408B9B5E/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Rebel",
      },
      ["REBEL OFFICER RESOLUTE COMMANDER"] = {
        name = "Rebel Officer",
        title = "Resolute Commander",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384863340/260721B8F3E1D9501B665F44F02869C34B561AF6/",
        size = "small",
        type = "Trooper",
        points = 50,
        speed = 2,
        upgrades = {
          Command = 1,
          Gear = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780862726770/62FECAB3FED284E098751CC3BBC70C4CFF828A58/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780862727097/DE589901F66E4079D82BA2C819672F622A5D7240/",
          },        
        },
        rank = "Commander",
        faction = "Rebel",
      },
      ["LANDO CALRISSIAN CANNY GENERAL"] = {
        name = "Lando Calrissian",
        title = "Canny General",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133196874/E2254E94528D352BF5AEE9E92D4532EE44E46C7F/",
        size = "small",
        type = "Trooper",
        points = 105,
        speed = 2,
        upgrades = {
          Command = 1,
          Training = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809186518/DCA8031C62A867134FAA814D4976978058C01369/",
          },        
        },
        commands = {
          {
            name = "Corellian Spike",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133709076/0B6C95F039C36F8709EAA7D83441D537E9F10FA9/",
            pip = 1,
          },
          {
            name = "Ace Up His Sleeve",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133708717/1DF313D87604E77DA0B404B8C8388364671B5070/",
            pip = 2,
          },
          {
            name = "Idiot's Array",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133711194/7A82389E04650FF63B89965A425182594B7A7463/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Rebel",
      },
      ["PYKE SYNDICATE CAPO"] = {
        name = "Pyke Syndicate Capo",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718883/40D17DA044960A4A34979FBDEAE9296EB1E50346/",
        size = "small",
        type = "Trooper",
        points = 48,
        speed = 2,
        upgrades = {
          Command = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420351237/706DEA645FEE2EC9787F05F4FF2926632E2C4894/",
          },        
        },
        rank = "Commander",
        faction = "Rebel",
      },
      ["WICKET HERO OF BRIGHT TREE"] = {
        name = "Wicket",
        title = "Hero of Bright Tree",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133208061/787C79B49789528F2EF54F1668B0BF28EBD6635C/",
        size = "small",
        type = "Trooper",
        points = 70,
        speed = 2,
        upgrades = {
          Training = 3,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2023850162090106066/B6E661CAB8049A1B1CE975B53BB57B337E2C5DEE/",
          },        
        },
        commands = {
          {
            name = "Close Call",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133753263/3C95DC036CEC1999E18A0AB104AEC6EB7FCE3CA6/",
            pip = 1,
          },
          {
            name = "Sneaky Scouting",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133752539/377B718FE350EAE5B002F2AC0B72DCB94A98CF08/",
            pip = 2,
          },
          {
            name = "Courageous Counterattack",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133755677/82DB9DB79E1CB8732C43EDD3B117B69EE6DCA6B8/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Rebel",
      },
      ["LOGRAY SUPERSTITIOUS SHAMAN"] = {
        name = "Logray",
        title = "Superstitious Shaman",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133207972/4E2F553BC1FBA06D841591067D3D5E2AED2BF4E5/",
        size = "small",
        type = "Trooper",
        points = 45,
        speed = 2,
        upgrades = {
          Command = 1,
          Training = 3,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129309/3D6C219F243BDE984C42BB3444B01DB09B522CBB/",
          },        
        },
        rank = "Commander",
        faction = "Rebel",
      },
      ["C-3P0 GOLDEN GOD"] = {
        name = "C-3P0",
        title = "Golden God",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133206077/3E485B54786039A916672ED9387F5C2AC4415B97/",
        size = "small",
        type = "Trooper",
        points = 40,
        speed = 2,
        upgrades = {
        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/776232727456807069/DE7E32B39455DB5111769436FD0C5BFDA3841268/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/777357228032306506/D60CB8A1159723917EF1831D4042318A67458A7A/",
          },        
        },
        rank = "Commander",
        faction = "Rebel",
      },
      ["JYN ERSO STARDUST"] = {
        name = "Jyn Erso",
        title = "Stardust",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133196300/612F0E84DA6E44E3F325FA031FC6537A314B769F/",
        size = "small",
        type = "Trooper",
        points = 75,
        speed = 2,
        upgrades = {
          Command = 1,
          Training = 1,
          Gear = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/951848302305475778/55B558E631655D0430BAF76E71C93899AAECA7A1/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/951848302305475871/06400240648CC39F933BE504C74DA9BEF4D006C4/",
          },        
        },
        commands = {
          {
            name = "I Rebel",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133710266/ABE39C99F45579E1052C8F63229350F85EBE02D4/",
            pip = 1,
          },
          {
            name = "Trust Goes Both Ways",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133714087/00E3558ED7687A4BA73636EA8290E647CE946A5B/",
            pip = 2,
          },
          {
            name = "Rebellions Are Built on Hope",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133711911/08855BFCF5653BBBEC5E09846AA302C7665BAD94/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Rebel",
      },
      ["CASSIAN ANDOR CAPABLE INTELLIGENCE AGENT"] = {
        name = "Cassian Andor",
        title = "Capable Intelligence Agent",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133196164/8178848A6C088BDD3F7D1C3B2A2C52CD55A8ED64/",
        size = "small",
        type = "Trooper",
        points = 90,
        speed = 2,
        upgrades = {
          Training = 2,
          Gear = 1,
          Armament = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/773996263556990389/C38E9CAD7E5BA5496E1A211CA799E9ACBAC51D00/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/770611701143191344/5CAA4F0CE9A3FBE89A81560221ADCDDB5A801CC3/",
          },        
        },
        commands = {
          {
            name = "Crack Shot",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133709477/9F40BE3B7E4964FC3D3A6FE5D617D08E584F391B/",
            pip = 1,
          },
          {
            name = "Last Stand",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133711249/CCC78CABDD6AA13C1CE1421B63F76E18225B8359/",
            pip = 2,
          },
          {
            name = "Volunteer Mission",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133714589/039C85DD6F50BC392B1F1D3D542770E877B25A3C/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Rebel",
      },
      ["CHEWBACCA WALKING CARPET"] = {
        name = "Chewbacca",
        title = "Walking Carpet",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133196213/4E3D98C13521875895DBA499660FAD9C03401E19/",
        size = "small",
        type = "Wookiee Trooper",
        points = 90,
        speed = 2,
        upgrades = {
          Training = 2,
          Gear = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540540669973/90DD9EA44756CCF9B2473302DC644F3AEEED07B4/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670117/5AA04499FC8CC467864F9F335601E6335C03326D/",
          },        
        },
        commands = {
          {
            name = "Common Cause",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133708994/B3C343B1AB15D93C121AFBA7DBA5AF00A30519E5/",
            pip = 1,
          },
          {
            name = "Brains And Brawn",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133708752/39258ED34508F7BBCDB7FB38DC6E533D0F76A2AE/",
            pip = 2,
          },
          {
            name = "Notorious Scoundrels",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133711853/8E3AAF9ACF4DB73F5DA153B39F022E00F50CE865/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Rebel",
      },
      ["SABINE WREN EXPLOSIVE ARTIST"] = {
        name = "Sabine Wren",
        title = "Explosive Artist",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133198454/7B0CE6DEA21E5969ACFD78775BB716526A2F5E19/",
        size = "small",
        type = "Trooper",
        points = 125,
        speed = 3,
        upgrades = {
          Training = 1,
          Gear = 2,
          Armament = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809186599/4B154E18EF2C0ADE6C347FC4B15AD856D00546DF/",
          },        
        },
        commands = {
          {
            name = "Explosions!",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133709550/FD7BD543D5672320D01B8CB84960B07D13BFF009/",
            pip = 1,
          },
          {
            name = "Symbol Of Rebellion",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133714045/1B46D54400840D3F7B1C5DC9E65757945FD482C9/",
            pip = 2,
          },
          {
            name = "Legacy Of Mandalore",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133711283/D9F6D219F5B6DA873D7D366B31BC6EC667478368/",
            pip = 3,
          },        
        },
        additionalObjects = {
          "Proton Charge Token",
          "Proton Charge Token",
          "Graffiti Token",        
        },
        rank = "Operative",
        faction = "Rebel",
      },
      ["LUKE SKYWALKER JEDI KNIGHT"] = {
        name = "Luke Skywalker",
        title = "Jedi Knight",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133196988/42DDFCCED093080587DEC624C04303D85BF5C365/",
        size = "small",
        type = "Trooper",
        points = 195,
        speed = 2,
        upgrades = {
          Force = 3,
          Training = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/777357228030156264/12F93F60CC26F1FDC2B577D4014787B7CAFBF9A1/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/777357228030156398/F811CAE962A0BFE369544C0A96C251F5BF198B3A/",
          },        
        },
        commands = {
          {
            name = "Son Of Skywalker",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133712958/CF63D0FDA40318CE886E6DA309CEB291857776E4/",
            pip = 1,
          },
          {
            name = "You Serve Your Master Well",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133714680/FD14E558D7D2B7EF32BD992FFC1C89141CD1F192/",
            pip = 1,
          },
          {
            name = "My Ally Is The Force",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133711308/CECAE0B5B62858582522F7FBED6463FE5834A64E/",
            pip = 2,
          },
          {
            name = "Full Of Surprises",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133709999/FA890B2A2EA1528C8BCF2A80AEB3B97A97BB9E15/",
            pip = 2,
          },
          {
            name = "Return Of The Jedi",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133711996/90C4CB28C0554DEC3797882252E6C5D3CCAC65A1/",
            pip = 3,
          },
          {
            name = "I Am A Jedi",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133710140/F162DE57287EB8C43F845BF34550B6666929E36A/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Rebel",
      },
      ["R2-D2 HERO OF A THOUSAND DEVICES"] = {
        name = "R2-D2",
        title = "Hero Of A Thousand Devices",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384863210/CC236C516A4590747888E3A71ABA6C543905BD5F/",
        size = "small",
        type = "Droid Trooper",
        points = 55,
        speed = 1,
        upgrades = {
          Counterpart = 1,
          Comms = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/776232727456806966/EFBA4A71BFE748A2868C14B82DA3A7B0D559874A/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/777357228032306302/F5CA6FC54A8625E261F123D73792DE36D74E1686/",
          },        
        },
        commands = {
          {
            name = "Blast Off!",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133708728/EE34AF6EF6C63A6BC2C2E8985D9BCBA9809CACA6/",
            pip = 1,
          },
          {
            name = "Impromptu Immolation",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133711126/58749B0F102DF1389C70E66298838B28B9B6795E/",
            pip = 2,
          },
          {
            name = "Smoke Screen",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133712867/BD1886FA3B75683BB1B3D6C95971DFE1BBB5DD30/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Rebel",
      },
      ["K-2SO SARDONIC SECURITY DROID"] = {
        name = "K-2SO",
        title = "Sardonic Security Droid",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133196811/24F4099145C9D7E19B87DF774BF443DA448248D1/",
        size = "small",
        type = "Droid Trooper",
        points = 70,
        speed = 2,
        upgrades = {
          Comms = 1,
          Armament = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/773996263557000439/C9EA2A27264C73E42C016FE26E665CBB75F8E7DE/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/770611701143471855/26BE70BB475D8B61122C8954CCA2EC79C1ED4C25/",
          },        
        },
        commands = {
          {
            name = "Sacrifice",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133712817/9454157523A2CCA90773E8795DC9FBD317AB3059/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Rebel",
      },
      ["BOBA FETT DAIMYO OF MOS ESPA"] = {
        name = "Boba Fett",
        title = "Daimyo of Mos Espa",
        image = "https://steamusercontent-a.akamaihd.net/ugc/16579174465147196746/9D5131128D833819B159E467C76A731BA5E896EF/",
        size = "small",
        type = "Trooper",
        points = 120,
        speed = 2,
        upgrades = {
          Training = 2,
          Gear = 2,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728519554838398/33764317D1BE774E1F978082C1A97681C1183C01/",
          },        
        },
        commands = {
          {
            name = "A Simple Man",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133796666/FF13777E67A0A5315AB1DFE941DE403FEC542DA3/",
            pip = 1,
          },
          {
            name = "Whipcord Launcher",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133795508/C3589C8AFAB04E0FD8A92A983532CFCDF6FA1B89/",
            pip = 1,
          },
          {
            name = "Making His Way in the Galaxy",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133800518/86AF77B41A2B4EE0C0ED5C2100EEA0E97FAE08A8/",
            pip = 2,
          },
          {
            name = "ZX Flame Projector",
            image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865564034359/7CC1427FEA79D22D3128A5650F8A93159661A656/",
            pip = 2,
          },
          {
            name = "Rule with Respect",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133795310/09B0E60A61663E865F43404BD844454C358D8B41/",
            pip = 3,
          },
          {
            name = "Z-6 Jetpack Rocket",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133796142/01926BBF8B27E512F920012E557A61E05267633A/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Rebel",
      },
      ["DIN DJARIN THE MANDALORIAN"] = {
        name = "Din Djarin",
        title = "The Mandalorian",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137007934/A7B3E612E6E4A9392C36548BB7B507AFF0D3841D/",
        size = "small",
        type = "Trooper",
        points = 105,
        speed = 2,
        upgrades = {
          Training = 2,
          Comms = 1,
          Gear = 2,
          Armament = 1,
          Counterpart = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2446089105226763008/9B5002BC5C049F340FF7CDBC875F5053A5DB2574/",
          },        
        },
        commands = {
          {
            name = "This is the Way",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137015239/C47AEAA769E49330AF8A9A18B9E6FBBBC14D411B/",
            pip = 1,
          },
          {
            name = "I Like Those Odds",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137015412/584A22A4135D4349D3D2A2D269F97FAC5F14558C/",
            pip = 2,
          },
          {
            name = "The Hand Thing",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139777564/741083A5DC7A0B07FE1EFAC37B113604CA918C7F/",
            pip = 2,
          },
          {
            name = "Whistling Birds",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137015298/D63392C36661D3EB8E0376A51A461AA761D5827F/",
            pip = 3,
          },        
        },
        additionalObjects = {
          "Victory Token",        
        },
        rank = "Operative",
        faction = "Rebel",
      },
      ["IG-11 NURSE AND PROTECT"] = {
        name = "IG-11",
        title = "Nurse and Protect",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137008859/81A3C1FCE76085D59EE6AC6B2D28D6114E0CFBA2/",
        size = "small",
        type = "Droid Trooper",
        points = 110,
        speed = 2,
        upgrades = {
          Training = 1,
          Comms = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1789640371719058670/9E6B82A0BF8367F2C6D369BD3464DA5E9D0C7917/",
          },        
        },
        commands = {
          {
            name = "Mechanical Carnage",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137016841/F2528C4F77766BC90F225B6BBB4D3A42BB0EB0C4/",
            pip = 1,
          },
          {
            name = "A Machine Made For Killing",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137016998/E6071BE8EDF0A20E6032D047B35D5EF5FC8B7182/",
            pip = 2,
          },
          {
            name = "Anti-Capture Protocols",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137016902/C3B4710D3F5ACD27D67CB51B0C6B4E6B229B9BD9/",
            pip = 3,
          },        
        },
        additionalObjects = {
          "Victory Token",        
        },
        rank = "Operative",
        faction = "Rebel",
      },
      ["AHSOKA TANO FULCRUM"] = {
        name = "Ahsoka Tano",
        title = "Fulcrum",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133195586/1A1B3A8C98F61A54D40DD8920D859B78C1B08F2E/",
        size = "small",
        type = "Trooper",
        points = 165,
        speed = 2,
        upgrades = {
          Force = 2,
          Training = 2,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2023850162084443471/517A8997FB85780B040DD3017147753F438137CC/",
          },        
        },
        commands = {
          {
            name = "I am no Jedi",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133710197/7F9F965E20829475FF9BA4912847B9C623A46ACF/",
            pip = 1,
          },
          {
            name = "Swift Protector",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133713979/17BE69E23BB277BB589B016EAF7779DE55999582/",
            pip = 2,
          },
          {
            name = "Family Reunion",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133709585/EB651566F03586E293E563D69EFA56BF515E5251/",
            pip = 2,
          },
          {
            name = "A New Beginning",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133708687/2329C2477E6CB92E3434AC63CC2857D15ED189D0/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Rebel",
      },
      ["THE BAD BATCH CLONE FORCE 99"] = {
        name = "The Bad Batch",
        title = "Clone Force 99",
        image = "https://steamusercontent-a.akamaihd.net/ugc/12250968622432378580/92A3A64FE3A5BA176A4DF5D2BB6F66B8D47B840B/",
        size = "small",
        type = "Trooper",
        points = 140,
        speed = 2,
        upgrades = {
          Counterpart = 1,
          ["Heavy Weapon"] = 4,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2475370743175243916/EFBD0137414E802232F64B02C78A9D9275C9C1CB/",
          },        
        },
        commands = {
          {
            name = "We Do What We Do",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133795415/0235923ED3C127B003714A0C009AE79215524F73/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Rebel",
      },
      ["REBEL TROOPERS"] = {
        name = "Rebel Troopers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133198369/1E028B2F335F3E9FC0AABE4C0362F03AFB144C4E/",
        size = "small",
        type = "Trooper",
        points = 40,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780862746147/3F3A21962C4AC0DA0445024688BF580A144D3825/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670236/6257E7A3CE86803490A8A0FAC7F81C281D700F52/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780862752262/41BD6AB8B17AB7449226A3D80EF186EB8ABA3952/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780862750426/2563904D7561144EE85EBCD3E07D68F48D8DD034/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780862764799/98CBD8B4DD0C08CFA01A8E6C8B5A70A137804EAB/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780862750426/2563904D7561144EE85EBCD3E07D68F48D8DD034/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780862755846/CD522BCA5D6E918E13A3FF593D7212FF4B0E79CA/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780862750426/2563904D7561144EE85EBCD3E07D68F48D8DD034/",
          },        
        },
        rank = "Corps",
        faction = "Rebel",
      },
      ["FLEET TROOPERS"] = {
        name = "Fleet Troopers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133196242/48ACAF50F0BCD3D831101C13ECAF0BF0FBA9DC03/",
        size = "small",
        type = "Trooper",
        points = 40,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670464/96FB3825C890968C09B07A2E0E227886D2CC768C/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670556/9B759F6F1A8B7C11AE5F2908208CBA9EF99ECE2C/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670667/CB316B23D59F28C5EF22E94A43280D49DFFDD6AC/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670760/47DF3E87B3F71E8EA42A89ECFE96E4FB3990D7ED/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540540671182/A605D9D0DB356DC71473F5C9DF27DE1CADB4F320/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540540671278/9B94D359A61113F72EEB0435D70A1291431D737A/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670978/0642E99CB4E8CABA1AA10389F2387A1C70D9322D/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670760/47DF3E87B3F71E8EA42A89ECFE96E4FB3990D7ED/",
          },        
        },
        rank = "Corps",
        faction = "Rebel",
      },
      ["REBEL VETERANS"] = {
        name = "Rebel Veterans",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133198409/983DC405DCEE4973DB7FA2C3906BCF678F2B011D/",
        size = "small",
        type = "Trooper",
        points = 48,
        speed = 1,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Training = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192015/F194EFE217778158ED30DFD40EFC1F70BEC01772/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192135/526538CE10AC6856578996BE6B8AB7263D32D5C7/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192232/D15615AF2A0F4F4887E9BD3DFFA141C8ACCCEC78/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192135/526538CE10AC6856578996BE6B8AB7263D32D5C7/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192402/4D1858AA566FEEE91774E40B10C233AAD8C381D5/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192135/526538CE10AC6856578996BE6B8AB7263D32D5C7/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192498/BF583EA43B457E816CDE323C172B2F4558B7A8BD/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192135/526538CE10AC6856578996BE6B8AB7263D32D5C7/",
          },        
        },
        rank = "Corps",
        faction = "Rebel",
      },
      ["MARK II MEDIUM BLASTER TROOPER"] = {
        name = "Mark II Medium Blaster Trooper",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133197490/1B64AC039E75E3028CFF048F4DCAD95975C34A5D/",
        size = "medium",
        type = "Emplacement Trooper",
        points = 38,
        speed = 1,
        upgrades = {
          Comms = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359682702688462/6B35D0B4E18CB7D0081825BEDC6E6C4AE45AA329/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359682702688570/1827E8E24FE65F309AF936EF35D07CC2149CD95E/",
          },        
        },
        rank = "Corps",
        faction = "Rebel",
      },
      ["PYKE SYNDICATE FOOT SOLDIERS"] = {
        name = "Pyke Syndicate Foot Soldiers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718821/EBC76B7A94A5F3C03B036C17E3C26E0319F1C6EB/",
        size = "small",
        type = "Trooper",
        points = 44,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845548/FD104F41509A53EA1C888862A3C5F0B98F609F1F/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845646/BE0DEED782F96BD44C389DEDEA41EBEA0C7A6D04/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845697/15B6DCCA8D8D76E1CB78219C58790E40DDD7CE8A/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845389/0D7DFE0C5BF5CDD527A619B75A25A2177D417BD0/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },        
        },
        rank = "Corps",
        faction = "Rebel",
      },
      ["EWOK SKIRMISHERS"] = {
        name = "Ewok Skirmishers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133206135/9932914CEED1068F058672A166F0F7A67E5C68D5/",
        size = "small",
        type = "Trooper",
        points = 40,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 2,
          Training = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128972/9388116F0C7BE70B991CC7715943BF9FF08D3890/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129131/D612F1B1EBDA3172B69BEE40159CE5D999045A62/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129196/6EED0C8AAF8F50751EE4206471D1273B6C0F4B5A/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129252/FC0A6247B6AB21A99919659C1F9069186C6D82ED/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128356/9E8C70962F9D5BF853BD9310F2BB1E1A3F80DB5D/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128445/EBB56734DB6527B3566C317F6F4F0E84471D6776/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
          },        
        },
        rank = "Corps",
        faction = "Rebel",
      },
      ["REBEL COMMANDOS"] = {
        name = "Rebel Commandos",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133198280/BA9DB93D2D168B835C95075E8B1C52C79E044286/",
        size = "small",
        type = "Trooper",
        points = 48,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 1,
          Comms = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541173156/D637683F992DD0C4488252BE266EEEA1F26006B0/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541172655/B10522A40482843AF69A3F321BD091B0ECF52C6B/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541172497/B3E1593143504101920CC6419BE7C2EAEF52993F/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541188141/6E23E29BB42963B94A0B7DFE01C4C49D776D9657/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541173253/155BAA01BA51A8EB524DD434A3C512D8C0B3A04B/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541172655/B10522A40482843AF69A3F321BD091B0ECF52C6B/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541173354/3483C6FB73C66481BC6CCC398BAB8E796F7EC076/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541188141/6E23E29BB42963B94A0B7DFE01C4C49D776D9657/",
          },        
        },
        rank = "Special Forces",
        faction = "Rebel",
      },
      ["REBEL COMMANDOS STRIKE TEAM"] = {
        name = "Rebel Commandos",
        displayName = "Rebel Commandos (Strike Team)",
        title = "Strike Team",
        heavyWeaponTeam = true,
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133197589/A51BFFE52ED2FAE9DACE45BF774C7F5FE12CBC07/",
        size = "small",
        type = "Trooper",
        points = 20,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 1,
          Comms = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541173156/D637683F992DD0C4488252BE266EEEA1F26006B0/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541172655/B10522A40482843AF69A3F321BD091B0ECF52C6B/",
          },        
        },
        rank = "Special Forces",
        faction = "Rebel",
      },
      ["WOOKIEE WARRIORS FREEDOM FIGHTERS"] = {
        name = "Wookiee Warriors",
        title = "Freedom Fighters",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133195004/B68B0EBD3193888339421B0AFE8A9F9803EFC027/",
        size = "small",
        type = "Wookiee Trooper",
        points = 69,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 2,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541173937/5179F4315AD6B0839454E1934E794A7F006C7813/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541174467/18352D89A219B89F6C869D89B9EDE22822F7F950/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541174158/677BF72C323CFF2314C174393AFA361C398C5519/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541174034/90C4A124BB82CCE0B5E38E13860ED49BB9A4973B/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541174304/9053CDD2798CEA905F8486498D0104B6ACA2F078/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541174467/18352D89A219B89F6C869D89B9EDE22822F7F950/",
          },        
        },
        rank = "Special Forces",
        faction = "Rebel",
      },
      ["REBEL PATHFINDERS"] = {
        name = "Rebel Pathfinders",
        image = "https://steamusercontent-a.akamaihd.net/ugc/1683770969788604432/47C2CB26F7C98A3F449136D78165F64BE7D0A846/",
        size = "small",
        type = "Trooper",
        points = 56,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 1,
          Comms = 1,
          Gear = 1,
          Armament = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/951848302305475193/3C613417B99B185BBAEC7A4C66AAE10E8FD6F8D5/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/951848302305475310/FF2A55C2559DA2CA2108EE6D7E5605774EF1B04D/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/951848302305475558/EE0863D9DE3C9D35C486B7273E1D555BB1F09566/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/951848302305475310/FF2A55C2559DA2CA2108EE6D7E5605774EF1B04D/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/951848302305475456/26BF332D69FD5B08D677EBDB91948820E03690DB/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/951848302305475310/FF2A55C2559DA2CA2108EE6D7E5605774EF1B04D/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/951848302305475667/B5CC42E1CAB9059DEE4B1237222CF0FE3BB6B838/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/951848302305475310/FF2A55C2559DA2CA2108EE6D7E5605774EF1B04D/",
          },        
        },
        rank = "Special Forces",
        faction = "Rebel",
      },
      ["MANDALORIAN RESISTANCE"] = {
        name = "Mandalorian Resistance",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133197470/8F69CF0D59AA51A8D0EFB406C7B3594937BB8D3D/",
        size = "small",
        type = "Trooper",
        points = 68,
        speed = 3,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 1,
          Comms = 1,
          Gear = 1,
          Armament = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809186437/C255A6920C6B62ADD6B948311053BAAE4803BE29/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809186272/7872209AB5CBE104129F9AFC58267EB8F6CF80D1/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809186179/35024924D8BC8A727F508557AF7B714D2E3D22FF/",
          },        
        },
        rank = "Special Forces",
        faction = "Rebel",
      },
      ["MANDALORIAN RESISTANCE CLAN WREN"] = {
        name = "Mandalorian Resistance",
        title = "Clan Wren",
        displayName = "Clan Wren",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133197439/A9AEEBFD286112DACCAB9944794C5521EE60BB8E/",
        size = "small",
        type = "Trooper",
        points = 30,
        speed = 3,
        upgrades = {
          ["Heavy Weapon"] = 2,
          Training = 1,
          Comms = 1,
          Gear = 1,
          Armament = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809185852/7940F0BEFCFE905039054DA1CA3BBF3C0CB2C7A9/",
          },        
        },
        required = {
          "Ursa Wren",
          "Tristan Wren",        
        },
        rank = "Special Forces",
        faction = "Rebel",
      },
      ["WOOKIEE WARRIORS KASHYYYK RESISTANCE"] = {
        name = "Wookiee Warriors",
        title = "Kashyyyk Resistance",
        displayName = "Wookiee Warriors (Resistance)",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133195051/93FB6360319FCFB5CABA147A27FB34D2A843FAC2/",
        size = "small",
        type = "Wookiee Trooper",
        points = 72,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1619598366708043779/0D96CE1619F4B27F583257A366431E3BAD428F19/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1619598366708043883/1EA1B3C21A50C20D4D168AB91ECFE1C01A4F7DF5/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1619598366708043883/1EA1B3C21A50C20D4D168AB91ECFE1C01A4F7DF5/",
          },        
        },
        rank = "Special Forces",
        faction = "Rebel",
      },
      ["EWOK SLINGERS"] = {
        name = "Ewok Slingers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133206165/0E347DAEAF6A94808CAAC5869754E639B33F669F/",
        size = "small",
        type = "Trooper",
        points = 35,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 2,
          Training = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128972/9388116F0C7BE70B991CC7715943BF9FF08D3890/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128506/B24F2402EDC36C64688B7F492B382D972ABA30F1/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128565/24D88975D67E46B5FA9294EB6DCC146912D61F2F/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128627/19AC5B05F3A355226EE783B9F239B3B285EA077A/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128715/CB52DA6C0FC1DF3511C2A2D62CB2B3A13A9D4F8F/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128778/1D5BCB551375F1A7988C434F0B52E18434BB4747/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
          },        
        },
        rank = "Special Forces",
        faction = "Rebel",
      },
      ["REBEL SLEEPER CELL READY TO STRIKE"] = {
        name = "Rebel Sleeper Cell",
        title = "Ready to Strike",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133198319/3751EC4355C0216944AC0333339EEBB78ADD38D1/",
        size = "small",
        type = "Trooper",
        points = 70,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Gear = 1,
          Comms = 1,
          Training = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/2508033889679621098/DAC14B407CC47E5C2B4A3AFCF87A704907C3940A/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/2508033889679614622/B379336947ACE47BF9FBEECA30A93F6ABCD3842B/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/2508033889680567004/0BB417962A0ABE0E6381B767782F6BBA6AE62CE8/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/2508033889680567174/19D7BF881EDCD2F7FB8718CD79E678CFF56495FF/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/2508033889680568477/ECEA13C55B0C37AED1B8066D2158BE7F9A84FB32/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/2508033889680568730/452F1CC25775CDE1D107BC6C457E22740182F594/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/2508033889680572703/37BA3BE34A5FEBE80DB7A4EB6FB3BBFD87CCE22D/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/2508033889680573104/5EFBE526BA06E0026124917566EC020AACDBB9EB/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/2508033889680574338/C9C5456700D989BA3389499336AC8C5DA7586755/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/2508033889680574595/595808E8FBD39F09F2754FE48F97A4A493BD3A37/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/2508033889680574338/C9C5456700D989BA3389499336AC8C5DA7586755/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/2508033889680574595/595808E8FBD39F09F2754FE48F97A4A493BD3A37/",
          },        
        },
        rank = "Special Forces",
        faction = "Rebel",
      },
      ["AT-RT"] = {
        name = "AT-RT",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133195638/6804A989329D472D728452290CD8EFE41A02F9A2/",
        size = "large",
        type = "Ground Vehicle",
        points = 50,
        speed = 2,
        upgrades = {
          Hardpoint = 1,
          Comms = 1,        
        },
        silhouette = {
          height = 2.576,
          offset = 0,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541266463/014ECD21C93F864E1C1DFD104A365DFC555EBAF8/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541267239/D9891291A896CC024383C024B20C5ACF87EC8A18/",
          },        
        },
        rank = "Support",
        faction = "Rebel",
      },
      ["1.4 FD LASER CANNON TEAM"] = {
        name = "1.4 FD Laser Cannon Team",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133195524/B46674A1014A295A986942391D7C9DB1B92D8629/",
        size = "huge",
        type = "Emplacement Trooper",
        points = 65,
        speed = 1,
        upgrades = {
          Comms = 1,
          Generator = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541267781/BE163E2112B28E8C7C5E536B037D3115103F9642/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541269701/797EACA86E0FB799D16DC8FE907A70C4B976C5EE/",
          },        
        },
        rank = "Support",
        faction = "Rebel",
      },
      ["TAUNTAUN RIDERS"] = {
        name = "Tauntaun Riders",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133194939/65297606E28367C04BF4BB4DE3474EAB723F4416/",
        size = "medium",
        type = "Creature Trooper",
        points = 95,
        speed = 3,
        upgrades = {
          Training = 1,
          Comms = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/788608699499191489/E91DEB380842511B21284A125A505B6C71D18474/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/788608699499191676/8E19A176FF0B3D2923F8F3D6DEA80D389F77CB27/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/788608699499191881/3DBB7DF0943F0D25484DE34581411825BA566F8A/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/788608699499191676/8E19A176FF0B3D2923F8F3D6DEA80D389F77CB27/",
          },        
        },
        rank = "Support",
        faction = "Rebel",
      },
      ["SWOOP BIKE RIDERS"] = {
        name = "Swoop Bike Riders",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139721420/2BD490189FBB2AF2C7D6AA12EFA6EAA643EA2002/",
        size = "medium",
        type = "Repulsor Vehicle",
        points = 65,
        speed = 3,
        upgrades = {
          Comms = 1,        
        },
        silhouette = {
          height = 1.891,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1924743543116067434/0A068914BDD35AE6F63D7E29EBC7E0B5F712DA1F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1924743543116067490/87719312BE33C493B97B0915DB8C89FDC57D3F38/",
          },        
        },
        rank = "Support",
        faction = "Rebel",
      },
      ["T-47 AIRSPEEDER"] = {
        name = "T-47 Airspeeder",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133194839/3B6BF81A2960A253A671CEDBF09F3C22AD52277C/",
        size = "huge",
        type = "Repulsor Vehicle",
        points = 125,
        speed = 3,
        upgrades = {
          Pilot = 1,
          Hardpoint = 1,
          Comms = 1,        
        },
        silhouette = {
          height = 4.633,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1686023073179090715/187094FD9EBAFB6FF44A65F2D411D68154C0FAC7/",
          },        
        },
        rank = "Heavy",
        faction = "Rebel",
      },
      ["X-34 LANDSPEEDER"] = {
        name = "X-34 Landspeeder",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133195095/8AA9C62E3102445090A15FD71C48234EA2F1D03F/",
        size = "huge",
        type = "Repulsor Vehicle",
        points = 55,
        speed = 2,
        upgrades = {
          Pilot = 1,
          Crew = 2,
          Hardpoint = 1,
          Comms = 1,        
        },
        silhouette = {
          height = 1.9,
          offset = 0,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/949599512594267188/9FA2B8A42C94B6E3683F1B753CEBA14FC3258592/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/949599512594267308/582E5F56A65FE6CD486BCBABB510CAE4B4DF6C8C/",
          },        
        },
        rank = "Heavy",
        faction = "Rebel",
      },
      ["A-A5 SPEEDER TRUCK"] = {
        name = "A-A5 Speeder Truck",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133195560/90F1524F640B97B178EE17A8D5C3D73EDA51E80F/",
        size = "long",
        type = "Repulsor Vehicle",
        points = 65,
        speed = 1,
        height = 4,
        upgrades = {
          Pilot = 1,
          Crew = 2,
          Hardpoint = 1,
          Comms = 1,        
        },
        silhouette = {
          height = 3.591,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1802024425338475441/730DE7AD6E1A55EA9F9264DADC1DDC0AC2CCA565/",
          },        
        },
        rank = "Heavy",
        faction = "Rebel",
      },
      ["CHEWBACCA LET THE WOOKIEE WIN"] = {
        name = "Chewbacca",
        title = "Let the Wookiee Win",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133206109/0DCD00886E51BDA8114E68212DAB8591AFF28DE6/",
        size = "huge",
        type = "Ground Vehicle",
        points = 180,
        speed = 2,
        upgrades = {
        
        },
        silhouette = {
          height = 8.84,
          offset = 0,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/999141806429351360/24C098E7B3D1708CDCFB9AEA4B2C445EF2DBAEE0/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/1752434998239690716/C6578DAF9012605B1F44A907D1C28646E34A73CF/",
          },        
        },
        commands = {
          {
            name = "Common Cause",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133708994/B3C343B1AB15D93C121AFBA7DBA5AF00A30519E5/",
            pip = 1,
          },
          {
            name = "Brains And Brawn",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133708752/39258ED34508F7BBCDB7FB38DC6E533D0F76A2AE/",
            pip = 2,
          },
          {
            name = "Notorious Scoundrels",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133711853/8E3AAF9ACF4DB73F5DA153B39F022E00F50CE865/",
            pip = 3,
          },        
        },
        rank = "Heavy",
        faction = "Rebel",
      },
    },
    ["EMPIRE"] = {
      ["DARTH VADER DARK LORD OF THE SITH"] = {
        name = "Darth Vader",
        title = "Dark Lord Of The Sith",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135444419/726425B7C209349209399BDDB87B34BE0B4447AA/",
        size = "small",
        type = "Trooper",
        points = 190,
        speed = 1,
        upgrades = {
          Force = 3,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541323740/BF58AB674CB7D638333F1B04A7C9A5B9D7DBF0E4/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541324289/B37D84D512722740E8310629C3E7BFC45AF0FBC9/",
          },        
        },
        commands = {
          {
            name = "Implacable",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135444439/06F119390473A1CAA7F4785636130B4D857A61A8/",
            pip = 1,
          },
          {
            name = "Vader's Might",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135444550/33DB2D103378C35509E7FEE23A0ACD2BFEE8195E/",
            pip = 1,
          },
          {
            name = "New Ways To Motivate Them",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135444510/952B5595A8E35BF7E2A0B51933DEC0A855D8EBAB/",
            pip = 2,
          },
          {
            name = "Fear And Dead Men",
            image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384885751/FEED7C91A363ECAC94BCD7395AB4CA196889147B/",
            pip = 2,
          },
          {
            name = "Master Of Evil",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135444481/AF8E308CE2EE310C787E53AA0BAC97471DC05621/",
            pip = 3,
          },
          {
            name = "Darkness Descends",
            image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384868611/E02306C20DA2B9C1C2D5A987429939564A935200/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Empire",
      },
      ["GENERAL VEERS MASTER TACTICIAN"] = {
        name = "General Veers",
        title = "Master Tactician",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384862383/B5EA5EAF81F9D730B20E0EED4BFFDCE93CCDAE45/",
        size = "small",
        type = "Trooper",
        points = 75,
        speed = 2,
        upgrades = {
          Command = 2,
          Gear = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541565411/F5F84397A9353DAD3D913F34E49812C1C895DA65/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541565593/F948637FEE70F52681A5A3C49C0E00EF25471AC1/",
          },        
        },
        commands = {
          {
            name = "Maximum Firepower",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135449935/27D7D687763686F54338BA5A2848E1B1A65C62A7/",
            pip = 1,
          },
          {
            name = "Evasive Maneuvers",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135449823/16F99AFAA1AD6647F0B47ED9FBF3EEDF2A034BFE/",
            pip = 2,
          },
          {
            name = "Imperial Discipline",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135449883/86FF6A857D6EBD4365D06547285401B3E3D4B79F/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Empire",
      },
      ["DIRECTOR ORSON KRENNIC ARCHITECT OF TERROR"] = {
        name = "Director Orson Krennic",
        title = "Architect Of Terror",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384861964/1F16DA425DE63290D76463CDDDE253E5B201EA64/",
        size = "small",
        type = "Trooper",
        points = 65,
        speed = 2,
        upgrades = {
          Command = 2,
          Gear = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/951848302305476013/77069645EC03E0F1C1DB10C2CE7EA85917E45404/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/951848302305476130/772EEBD3EC49A7271C1C7647F817C51ED23DE3B2/",
          },        
        },
        commands = {
          {
            name = "Voracious Ambition",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135450643/8B21E1AC56AE75D2204878EA62E65325AE365494/",
            pip = 1,
          },
          {
            name = "Deploy The Garrison",
            image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865564035541/3076FCDDC51B733A5970AD91FE0698F9A1888084/",
            pip = 2,
          },
          {
            name = "Annihilation Looms",
            image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384868277/1F59C545DAC623A8CC344AA96E40981F9A656079/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Empire",
      },
      ["IDEN VERSIO INFERNO SQUAD LEADER"] = {
        name = "Iden Versio",
        title = "Inferno Squad Leader",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135447992/97B7DD726FEB2C4811A53FE5B68FB430713FB9FD/",
        size = "small",
        type = "Trooper",
        points = 100,
        speed = 2,
        upgrades = {
          Training = 2,
          Gear = 1,
          Armament = 1,
          Counterpart = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/773996263557021593/68887AFFBF8F1A2472A80F6514CD617A54A1D705/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/770611889400014191/9442AAB074AB2204C7A5CD8843037C71CFC44540/",
          },        
        },
        commands = {
          {
            name = "Pulse Scan",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135447957/DFC97CD26266A0F75601991E627A9A7D88D2DC26/",
            pip = 1,
          },
          {
            name = "Concussive Blast",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135447851/69B1F705930944BD26685CDCB3F7A52127D9BF25/",
            pip = 2,
          },
          {
            name = "Incapacitate",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135447917/9D2822AF6299DF22D89273129D1E7870430429DF/",
            pip = 2,
          },
          {
            name = "Tactical Strike",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135447971/CD83916F6A11CD5CE3D75CCACA9FA01C248FDF18/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Empire",
      },
      ["MOFF GIDEON LONG LIVE THE EMPIRE"] = {
        name = "Moff Gideon",
        title = "Long Live the Empire",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135445399/8AB358A896676499DDA9B176E90E39AEA6C36DB1/",
        size = "small",
        type = "Trooper",
        points = 100,
        speed = 2,
        upgrades = {
          Command = 2,
          Training = 1,
          Gear = 1,
          Armament = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2446089105227025807/2E7D8F479762060CAF447A2E5A6C27891C314EA2/",
          },        
        },
        commands = {
          {
            name = "Die at My Hand",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135445379/2E1BA2F22E9816B73C934205D77DDAB726F93D44/",
            pip = 1,
          },
          {
            name = "You Have Something I Want",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135445472/1CCEC5B09B861DA2530A4F9C5548480F5B9CC7B8/",
            pip = 2,
          },
          {
            name = "Moment of Consideration",
            image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384886856/80255CC3DC05C1CD68DB15DDDA530F15BB82EA99/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Empire",
      },
      ["PYKE SYNDICATE CAPO"] = {
        name = "Pyke Syndicate Capo",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718883/40D17DA044960A4A34979FBDEAE9296EB1E50346/",
        size = "small",
        type = "Trooper",
        points = 48,
        speed = 2,
        upgrades = {
          Command = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420351237/706DEA645FEE2EC9787F05F4FF2926632E2C4894/",
          },        
        },
        rank = "Commander",
        faction = "Empire",
      },
      ["BLACK SUN VIGO"] = {
        name = "Black Sun Vigo",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718200/725F66281B4596ACF010C38A1E37D169B597D56C/",
        size = "small",
        type = "Trooper",
        points = 50,
        speed = 2,
        upgrades = {
          Command = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143763/E93BA6716A05CA95AE2EA3B7C0DFD8AF145D5C22/",
          },        
        },
        rank = "Commander",
        faction = "Empire",
      },
      ["BOBA FETT INFAMOUS BOUNTY HUNTER"] = {
        name = "Boba Fett",
        title = "Infamous Bounty Hunter",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137005787/86FC806D7DFDD74A0AB92D0E1B2D4842E84DB677/",
        size = "small",
        type = "Trooper",
        points = 130,
        speed = 3,
        upgrades = {
          Training = 2,
          Comms = 1,
          Gear = 2,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541667697/9BC2C54E14EA265620F3D96553274503245D1681/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541669466/60DFE8F3EC756ECE7E5729D3261EF37CACA587C6/",
          },        
        },
        commands = {
          {
            name = "A Simple Man",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137003571/5A5FB50BC907A26126D8D458A0A4A3283DFFFEC0/",
            pip = 1,
          },
          {
            name = "Whipcord Launcher",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137003429/DD564B5EA75537F3EBD45048833E5810DF5B33F5/",
            pip = 1,
          },
          {
            name = "Making His Way in the Galaxy",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137003517/D14FF44B1B27BEA7A9058101AD2C8B1FB8FAA445/",
            pip = 2,
          },
          {
            name = "Rule with Respect",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137003465/FB8C27572F44CAC6D4D6222AE11DA7A1EE7E201F/",
            pip = 3,
          },
          {
            name = "Z-6 Jetpack Rocket",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137003593/EDE3AF9DE7EE272F32C187643DFE4A565B205FD6/",
            pip = 3,
          },        
        },
        additionalObjects = {
          "Victory Token",        
        },
        rank = "Operative",
        faction = "Empire",
      },
      ["BOSSK TRANDOSHAN TERROR"] = {
        name = "Bossk",
        title = "Trandoshan Terror",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137006564/2C7F90FF127392A78F71B82EF4E69C35973824AD/",
        size = "small",
        type = "Trooper",
        points = 105,
        speed = 2,
        upgrades = {
          Training = 2,
          Gear = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/948474323838791181/6B9D77B77DF8FD7AFA19342AD687F0E15A2E21B7/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/948474323838791276/ABFCDD8C71D484E6B6050080BB80B79D0DE93178/",
          },        
        },
        commands = {
          {
            name = "Merciless Munitions",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137013809/1D7FCC2F2A12F6B09B07345330F840800A846F7C/",
            pip = 1,
          },
          {
            name = "Reptilian Rampage",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137013972/29F197704D74AF20E8954F2BE8AC5C9203F9A2E6/",
            pip = 2,
          },
          {
            name = "Lying In Wait",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137013903/60F4AC014F68998F8A3587BA0A5389301A0BAA7C/",
            pip = 3,
          },        
        },
        additionalObjects = {
          "Proton Charge Token",
          "Victory Token",        
        },
        rank = "Operative",
        faction = "Empire",
      },
      ["CAD BANE NEEDS NO INTRODUCTION"] = {
        name = "Cad Bane",
        title = "Needs No Introduction",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137007196/49655B5A32FFAB3CE31BFCCFEA9811CD4A51B748/",
        size = "small",
        type = "Trooper",
        points = 105,
        speed = 2,
        upgrades = {
          Training = 2,
          Comms = 1,
          Gear = 1,
          Armament = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/1003681674396400482/F8900CFC9EF2309C9F54AE33AE5444B2B09DB1CD/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/1003681674396400696/907F4310FEA7A7CD89EE64A1AF3A8CC77897CCAC/",
          },        
        },
        commands = {
          {
            name = "I'm Your Worst Nightmare",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137014543/33FE8591FAFD29F8BEAF13D64851772A7FD794FE/",
            pip = 1,
          },
          {
            name = "I'm In Control",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137014579/D2FC7AF724D1C7527CCDDABF18517E9CB99DF061/",
            pip = 2,
          },
          {
            name = "I Make The Rules Now",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137014560/4B6E8AF4CB10FFE7EC529D204390FC45291FC962/",
            pip = 3,
          },        
        },
        additionalObjects = {
          "Bane Token: Blank",
          "Bane Token: Bomb",
          "Bane Token: Bane",
          "Victory Token",        
        },
        rank = "Operative",
        faction = "Empire",
      },
      ["DARTH VADER THE EMPEROR'S APPRENTICE"] = {
        name = "Darth Vader",
        title = "The Emperor's Apprentice",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135453126/1C9CAD022704D64F0B9139865DBEB8BCA11EBFA4/",
        size = "small",
        type = "Trooper",
        points = 175,
        speed = 2,
        upgrades = {
          Force = 2,
          Training = 2,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/777357228030156593/FEBA127ECDF2917EA8F8066BBB10BADA7D365D3E/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541324289/B37D84D512722740E8310629C3E7BFC45AF0FBC9/",
          },        
        },
        commands = {
          {
            name = "Implacable",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135444439/06F119390473A1CAA7F4785636130B4D857A61A8/",
            pip = 1,
          },
          {
            name = "Vader's Might",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135444550/33DB2D103378C35509E7FEE23A0ACD2BFEE8195E/",
            pip = 1,
          },
          {
            name = "New Ways To Motivate Them",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135444510/952B5595A8E35BF7E2A0B51933DEC0A855D8EBAB/",
            pip = 2,
          },
          {
            name = "Fear And Dead Men",
            image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384885751/FEED7C91A363ECAC94BCD7395AB4CA196889147B/",
            pip = 2,
          },
          {
            name = "Master Of Evil",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135444481/AF8E308CE2EE310C787E53AA0BAC97471DC05621/",
            pip = 3,
          },
          {
            name = "Darkness Descends",
            image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384868611/E02306C20DA2B9C1C2D5A987429939564A935200/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Empire",
      },
      ["IG-88 NOTORIOUS ASSASSIN DROID"] = {
        name = "IG-88",
        title = "Notorious Assassin Droid",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137009352/1C2EF08C41D85E6F3B214B380DA174D2AADE6BDB/",
        size = "small",
        type = "Droid Trooper",
        points = 110,
        speed = 2,
        upgrades = {
          Training = 1,
          Comms = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1789640371719058670/9E6B82A0BF8367F2C6D369BD3464DA5E9D0C7917/",
          },        
        },
        commands = {
          {
            name = "Focused on the Kill",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137026321/D9785EEF3FE2835319A9F3A2FB632A6E68D34371/",
            pip = 1,
          },
          {
            name = "A Machine Made For Killing",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137016998/E6071BE8EDF0A20E6032D047B35D5EF5FC8B7182/",
            pip = 2,
          },
          {
            name = "Independent Programming",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137017800/F888E446D9C374E57E091347F651D30A7CEEC81F/",
            pip = 2,
          },        
        },
        additionalObjects = {
          "Victory Token",        
        },
        rank = "Operative",
        faction = "Empire",
      },
      ["DIN DJARIN THE MANDALORIAN"] = {
        name = "Din Djarin",
        title = "The Mandalorian",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137007934/A7B3E612E6E4A9392C36548BB7B507AFF0D3841D/",
        size = "small",
        type = "Trooper",
        points = 105,
        speed = 2,
        upgrades = {
          Training = 2,
          Comms = 1,
          Gear = 2,
          Armament = 1,
          Counterpart = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2446089105226763008/9B5002BC5C049F340FF7CDBC875F5053A5DB2574/",
          },        
        },
        commands = {
          {
            name = "This is the Way",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137015239/C47AEAA769E49330AF8A9A18B9E6FBBBC14D411B/",
            pip = 1,
          },
          {
            name = "I Like Those Odds",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137015412/584A22A4135D4349D3D2A2D269F97FAC5F14558C/",
            pip = 2,
          },
          {
            name = "The Hand Thing",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139777564/741083A5DC7A0B07FE1EFAC37B113604CA918C7F/",
            pip = 2,
          },
          {
            name = "Whistling Birds",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137015298/D63392C36661D3EB8E0376A51A461AA761D5827F/",
            pip = 3,
          },        
        },
        additionalObjects = {
          "Victory Token",        
        },
        rank = "Operative",
        faction = "Empire",
      },
      ["IG-11 NURSE AND PROTECT"] = {
        name = "IG-11",
        title = "Nurse and Protect",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137008859/81A3C1FCE76085D59EE6AC6B2D28D6114E0CFBA2/",
        size = "small",
        type = "Droid Trooper",
        points = 110,
        speed = 2,
        upgrades = {
          Training = 1,
          Comms = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1789640371719058670/9E6B82A0BF8367F2C6D369BD3464DA5E9D0C7917/",
          },        
        },
        commands = {
          {
            name = "Mechanical Carnage",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137016841/F2528C4F77766BC90F225B6BBB4D3A42BB0EB0C4/",
            pip = 1,
          },
          {
            name = "A Machine Made For Killing",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137016998/E6071BE8EDF0A20E6032D047B35D5EF5FC8B7182/",
            pip = 2,
          },
          {
            name = "Anti-Capture Protocols",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137016902/C3B4710D3F5ACD27D67CB51B0C6B4E6B229B9BD9/",
            pip = 3,
          },        
        },
        additionalObjects = {
          "Victory Token",        
        },
        rank = "Operative",
        faction = "Empire",
      },
      ["FIFTH BROTHER THE KILL IS MINE"] = {
        name = "Fifth Brother",
        title = "The Kill is Mine",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137011062/2CD518FAF98E506E8D2316B4A21294FAE1D2DAF8/",
        size = "small",
        type = "Trooper",
        points = 105,
        speed = 2,
        upgrades = {
          Force = 1,
          Training = 2,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2456221571853672166/B86F663B609267644D837B4F18C59614C6785229/",
          },        
        },
        commands = {
          {
            name = "You Would Question Me?",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137018940/87231143078D7F264017F3EF0B7C221098555811/",
            pip = 2,
          },
          {
            name = "I Care Not for your Struggles",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137018989/07882CCD7D056DFFB777074A53C21811352E6844/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Empire",
      },
      ["SEVENTH SISTER COMPELLED TO INFLICT PAIN"] = {
        name = "Seventh Sister",
        title = "Compelled to Inflict Pain",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137011773/5377A3D119B96061C7EFAF2F8469BD5E889F3F13/",
        size = "small",
        type = "Trooper",
        points = 110,
        speed = 2,
        upgrades = {
          Force = 1,
          Training = 2,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2446090001278329724/E8E229E0E3FB6230D9F5A1823C71032A0FC9F2D0/",
          },        
        },
        commands = {
          {
            name = "Come and Prove It",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137019689/3B73F5638839DF849BC5921412BCC4ABCC35DAEC/",
            pip = 1,
          },
          {
            name = "Unexpected, but not Unwelcome",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137019893/59EB748713DD2A67E92CCFE9D3243D15C3670FBC/",
            pip = 2,
          },
          {
            name = "You Hide Your Fear Well",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137019788/90EA4637127092D742B503FE3E5DF0F9E96473A0/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Empire",
      },
      ["AGENT KALLUS HUNTER OF SPECTRES"] = {
        name = "Agent Kallus",
        title = "Hunter Of Spectres",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135448854/CC65D752275214DB6D5791534DDEFF4784D6259E/",
        size = "small",
        type = "Trooper",
        points = 90,
        speed = 2,
        upgrades = {
          Command = 1,
          Training = 1,
          Gear = 1,
          Armament = 1,
          Flaw = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2446089105227059084/0EB4EE32683338BC754DA5EC1F613ABA71048E90/",
          },        
        },
        commands = {
          {
            name = "Face Me!",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135448798/AACA6ECCF1997BBEB2F5A054C4EC8B0D47C2D0C7/",
            pip = 1,
          },
          {
            name = "ISB Investigation",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135448812/E8D9B9BDEB69B87FADD3E294851E7AFD6868EB42/",
            pip = 2,
          },
          {
            name = "Ruthless Tactics",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135448839/F78FAA7976B9225D466E754C622758F60EE30D5F/",
            pip = 3,
          },        
        },
        additionalObjects = {
          "Victory Token",        
        },
        rank = "Operative",
        faction = "Empire",
      },
      ["STORMTROOPERS"] = {
        name = "Stormtroopers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384863867/71125D3CB8BC663C340433AED88CA794951DCA34/",
        size = "small",
        type = "Trooper",
        points = 42,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2478747809413608082/BD8A164AAD4C70AE2F8CB8165F3D2DC9FD94C778/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2478747809407737751/27A207BFDA271D2EA267D400CBDF551B11EE093C/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2478747809407737751/27A207BFDA271D2EA267D400CBDF551B11EE093C/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2478747809407737751/27A207BFDA271D2EA267D400CBDF551B11EE093C/",
          },        
        },
        rank = "Corps",
        faction = "Empire",
      },
      ["STORMTROOPER RIOT SQUAD"] = {
        name = "Stormtrooper Riot Squad",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139658813/F6DC48260186CC0283711F9A6E216341F1631319/",
        size = "small",
        type = "Trooper",
        points = 50,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 2,
          Gear = 1,
          Training = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2491137781649821645/5FF305DCBED87DDE0DC92AB430557E501D5CDFC2/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2491137781649821736/A6557A52AB579A320023B7028C55A38815DC566E/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2491137781649821412/A274C8B3E646E0EBFB81D282570C5A1C6D263F2B/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2491137781649821736/A6557A52AB579A320023B7028C55A38815DC566E/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2491137781649821497/585AF58548561265B23B01A56577DE0732464636/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2491137781649821736/A6557A52AB579A320023B7028C55A38815DC566E/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2491137781649821557/0B4EFC2CDDBC7BB72768141562946583278CAAD6/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2491137781649821736/A6557A52AB579A320023B7028C55A38815DC566E/",
          },        
        },
        rank = "Corps",
        faction = "Empire",
      },
      ["STORMTROOPERS HEAVY RESPONSE UNIT"] = {
        name = "Stormtroopers Heavy Response Unit",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384863789/6869DCFFBE7B47365197E220FB76E24E70D13808/",
        size = "small",
        type = "Trooper",
        points = 36,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 2,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141156/BF26D516EA8F33C72822FF9AB369FF7CA444C403/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141746/A8FD77EB51C50C64CD924BDAEEDB70D8839E0EF3/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141545/30BEFE4E87E379AA361AFF5FD24A8F5D3F0BA4C0/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141746/A8FD77EB51C50C64CD924BDAEEDB70D8839E0EF3/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141624/1366A6A4D84D9FE597EEA2736AFC187F392418DA/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141746/A8FD77EB51C50C64CD924BDAEEDB70D8839E0EF3/",
          },        
        },
        rank = "Corps",
        faction = "Empire",
      },
      ["SNOWTROOPERS"] = {
        name = "Snowtroopers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384863754/2B0DF1A43014AABAE680518777D8D9B72CA26DF1/",
        size = "small",
        type = "Trooper",
        points = 42,
        speed = 1,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801027/2A5DEE9952A0179FC8448FFA52819B387124ACD7/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801215/595165C57A67BF2BD505BE6F0DF8F11AD4EA55D2/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801837/D52F333945BF667A37E06611977C36186CEFC7B6/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801215/595165C57A67BF2BD505BE6F0DF8F11AD4EA55D2/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801500/728C586E21D0A4EBD8DE54EEF4E097EFEEECE871/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801215/595165C57A67BF2BD505BE6F0DF8F11AD4EA55D2/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801363/743D9E272367ABB1F6296D5EFB6010637C58D5E4/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801215/595165C57A67BF2BD505BE6F0DF8F11AD4EA55D2/",
          },        
        },
        rank = "Corps",
        faction = "Empire",
      },
      ["SHORETROOPERS"] = {
        name = "Shoretroopers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384863691/D8CE49A682DADD9B1E57E3EA64BFA5F86F1AD883/",
        size = "small",
        type = "Trooper",
        points = 52,
        speed = 1,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Training = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359682702688359/642C317FE5C91E4DCC908FEA02A7ED4000B06A9F/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687694/C12AAE8B7F487BE4C1545E253AB3C026E0426AA1/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687570/0D2A602282BAACDCE665EF9D1D65CEA413944083/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687694/C12AAE8B7F487BE4C1545E253AB3C026E0426AA1/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359682702688133/C8D721D29D711045A27EEC3868D4B7A111C86F20/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687694/C12AAE8B7F487BE4C1545E253AB3C026E0426AA1/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687282/B02342FDEEE7DDE82DF96EB434B1D033B0A4C899/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687694/C12AAE8B7F487BE4C1545E253AB3C026E0426AA1/",
          },        
        },
        rank = "Corps",
        faction = "Empire",
      },
      ["DF-90 MORTAR TROOPER"] = {
        name = "DF-90 Mortar Trooper",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139662551/E8496B01C9619FBA2E5EEEBEF285ABEEF95ECF00/",
        size = "medium",
        type = "Emplacement Trooper",
        points = 40,
        speed = 1,
        upgrades = {
          Comms = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359682702688709/1EB7C549A90465F116EF307643FEA1D572CE1008/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359682702688820/94F2B4954FD378EA9E5544E37B80B8556812F2F2/",
          },        
        },
        rank = "Corps",
        faction = "Empire",
      },
      ["PYKE SYNDICATE FOOT SOLDIERS"] = {
        name = "Pyke Syndicate Foot Soldiers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718821/EBC76B7A94A5F3C03B036C17E3C26E0319F1C6EB/",
        size = "small",
        type = "Trooper",
        points = 44,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845548/FD104F41509A53EA1C888862A3C5F0B98F609F1F/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845646/BE0DEED782F96BD44C389DEDEA41EBEA0C7A6D04/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845697/15B6DCCA8D8D76E1CB78219C58790E40DDD7CE8A/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845389/0D7DFE0C5BF5CDD527A619B75A25A2177D417BD0/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },        
        },
        rank = "Corps",
        faction = "Empire",
      },
      ["BLACK SUN ENFORCERS"] = {
        name = "Black Sun Enforcers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718139/222491782E56EAECE8B93E78E946F308211DC049/",
        size = "small",
        type = "Trooper",
        points = 50,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845475/01738B0D52E2D9C2870D6E33A2D05ECD12201C85/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143724/48B5A35E10B4977E255D889A8FCAEA8C980A11A9/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143328/3D6F3C2E8DFB78B9B748FFC8F339B9C568D7408E/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143724/48B5A35E10B4977E255D889A8FCAEA8C980A11A9/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143328/3D6F3C2E8DFB78B9B748FFC8F339B9C568D7408E/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143724/48B5A35E10B4977E255D889A8FCAEA8C980A11A9/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143328/3D6F3C2E8DFB78B9B748FFC8F339B9C568D7408E/",
          },        
        },
        rank = "Corps",
        faction = "Empire",
      },
      ["SCOUT TROOPERS"] = {
        name = "Scout Troopers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139667737/5A74C7A6641FF79D0BEA098600B7338595160681/",
        size = "small",
        type = "Trooper",
        points = 48,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 1,
          Comms = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541911155/36E8C01A67E5E7A4188FC619261E0BAB0DF438C1/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/950714557093539603/6584D58DCD3135C901F302599C304E2D7044AD4B/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541911406/C33160A2888F0CE53C9712B1872478E038F9B0EA/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/950714557093539603/6584D58DCD3135C901F302599C304E2D7044AD4B/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541911585/324AE8DA9D33C07E2FE620FC4B49E2C190F39F5A/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/950714557093539603/6584D58DCD3135C901F302599C304E2D7044AD4B/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541911689/42647324CBDBF25155498DF1FFDDDC2EC04FB5EC/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/950714557093539603/6584D58DCD3135C901F302599C304E2D7044AD4B/",
          },        
        },
        rank = "Special Forces",
        faction = "Empire",
      },
      ["SCOUT TROOPERS STRIKE TEAM"] = {
        name = "Scout Troopers",
        title = "Strike Team",
        displayName = "Scout Troopers (Strike Team)",
        heavyWeaponTeam = true,
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384863628/C90F310AB2FFFFB744B68B2A0D3B0C657FA8ABA4/",
        size = "small",
        type = "Trooper",
        points = 20,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 1,
          Comms = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541911155/36E8C01A67E5E7A4188FC619261E0BAB0DF438C1/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/950714557093539603/6584D58DCD3135C901F302599C304E2D7044AD4B/",
          },        
        },
        rank = "Special Forces",
        faction = "Empire",
      },
      ["IMPERIAL DEATH TROOPERS"] = {
        name = "Imperial Death Troopers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139667689/20539A9EAB988308E299A3DE18818D7B9FBA63C9/",
        size = "small",
        type = "Trooper",
        points = 72,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 2,
          Comms = 1,
          Gear = 1,
          Armament = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/951848302305474570/777B8146B150032E3D733D17110BE5887D1AB991/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/951848302305474695/F076E77D0278B10EAE330BC9073B05BC9A3BCD57/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/951848302305474824/49EFFD221EF1EBD3F3365B6B73B9A4A5C6E6A075/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/951848302305474695/F076E77D0278B10EAE330BC9073B05BC9A3BCD57/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/951848302305474956/BB78111128E91BB2DB22F2990AFB438B9EA5FC0E/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/951848302305474695/F076E77D0278B10EAE330BC9073B05BC9A3BCD57/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/951848302305475069/81803116C6F5F9B133D2D0CC39E2A2CA6043E9DB/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/951848302305474695/F076E77D0278B10EAE330BC9073B05BC9A3BCD57/",
          },        
        },
        rank = "Special Forces",
        faction = "Empire",
      },
      ["IMPERIAL SPECIAL FORCES"] = {
        name = "Imperial Special Forces",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139667628/DC827BC31A0CA433CBACA568292623523896981F/",
        size = "small",
        type = "Trooper",
        points = 68,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 2,
          Comms = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1618438238122999812/779C9D69CA440F970DD0B7C6394A812732F9C588/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1618438238123043414/B7E9660E470DC070545782406C29F1E1356A5685/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1618438238122996093/C79160007FD884C2B8737DCA888D61C955073141/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1618438238123043414/B7E9660E470DC070545782406C29F1E1356A5685/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1618438238122996656/AAD706C50446522C98259A20C03E757C4F7B98B1/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1618438238123043414/B7E9660E470DC070545782406C29F1E1356A5685/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1618438238122997115/F100B28E5DBF4A56FB22D3410270BEE4EF344FEF/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1618438238123043414/B7E9660E470DC070545782406C29F1E1356A5685/",
          },        
        },
        rank = "Special Forces",
        faction = "Empire",
      },
      ["IMPERIAL SPECIAL FORCES INFERNO SQUAD"] = {
        name = "Imperial Special Forces",
        title = "Inferno Squad",
        displayName = "Inferno Squad",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139667572/5230C0C79688307883294267607D597037641B36/",
        size = "small",
        type = "Trooper",
        points = 34,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 2,
          Training = 2,
          Comms = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1618438238122999341/C1AEEE50112F060BA8E5CAFBC16F417A0EF7C3C0/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1618438238123043414/B7E9660E470DC070545782406C29F1E1356A5685/",
          },        
        },
        required = {
          "Gideon Hask",
          "Del Meeko",        
        },
        rank = "Special Forces",
        faction = "Empire",
      },
      ["74-Z SPEEDER BIKES"] = {
        name = "74-Z Speeder Bikes",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139672763/037D15DE4ACD0941BA57FEEBDEBE3F346E04F8BC/",
        size = "medium",
        type = "Repulsor Vehicle",
        points = 70,
        speed = 3,
        upgrades = {
          Comms = 1,        
        },
        silhouette = {
          height = 1.561,
          offset = 0,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540542045928/74630975D4992CA09BDDD88460874FB9E4095FC9/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540542045645/AF0264339BB7E1D09E74AF920E2FB693C3CA1592/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540542045506/0E2EC344AA0AD37699FFEFD4E1BA86A4FD4CD48B/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540542045645/AF0264339BB7E1D09E74AF920E2FB693C3CA1592/",
          },        
        },
        rank = "Support",
        faction = "Empire",
      },
      ["E-WEB HEAVY BLASTER TEAM"] = {
        name = "E-Web Heavy Blaster Team",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384862029/A422AB31270839D44F459E78D02C18165E459E4C/",
        size = "large",
        type = "Emplacement Trooper",
        points = 60,
        speed = 1,
        upgrades = {
          Comms = 1,
          Generator = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540542046063/4018BD67779A3F2ACCFA92C35306880C2FC60188/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540542046257/D259CAB86BBC7A60FB09149229F33508C8DF4CE8/",
          },        
        },
        rank = "Support",
        faction = "Empire",
      },
      ["DEWBACK RIDER"] = {
        name = "Dewback Rider",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139672717/75700C648595B7642273964A59B5CDFFBD650014/",
        size = "large",
        type = "Creature Trooper",
        points = 70,
        speed = 1,
        upgrades = {
          Training = 1,
          Comms = 1,
          Armament = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359682702688959/0FCB94B52F0C2DF6E3F296AB6980CEC158E3E496/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359682702689114/727755B3BE824994C869F1C869D8B5A07A3CD284/",
          },        
        },
        rank = "Support",
        faction = "Empire",
      },
      ["RANGE TROOPERS"] = {
        name = "Range Troopers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139672651/467BD8F23216F7AE5274DC84837483AE40571B02/",
        size = "small",
        type = "Trooper",
        points = 60,
        speed = 1,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Comms = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682669687/1A75297DAE22B6DFE46AF5B69EDC87652B23957F/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682582649/F03C73249983DDC1178314FD61C7D53DA27840EE/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682669758/7E6C79BDA776AD0618FF66FCD961C59DD6B0F4F1/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682582649/F03C73249983DDC1178314FD61C7D53DA27840EE/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682669758/7E6C79BDA776AD0618FF66FCD961C59DD6B0F4F1/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682582649/F03C73249983DDC1178314FD61C7D53DA27840EE/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682669758/7E6C79BDA776AD0618FF66FCD961C59DD6B0F4F1/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682582649/F03C73249983DDC1178314FD61C7D53DA27840EE/",
          },        
        },
        rank = "Support",
        faction = "Empire",
      },
      ["AT-ST"] = {
        name = "AT-ST",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384861327/6E2988CCCF7820F765C1D5486D95F8EFB77ABED1/",
        size = "huge",
        type = "Ground Vehicle",
        points = 145,
        speed = 2,
        upgrades = {
          Pilot = 1,
          Hardpoint = 3,
          Comms = 1,        
        },
        silhouette = {
          height = 8.84,
          offset = 0,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/999141806429351360/24C098E7B3D1708CDCFB9AEA4B2C445EF2DBAEE0/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/1752434998239690716/C6578DAF9012605B1F44A907D1C28646E34A73CF/",
          },        
        },
        rank = "Heavy",
        faction = "Empire",
      },
      ["TX-225 GAVW OCCUPIER TANK"] = {
        name = "TX-225 GAVw Occupier Tank",
        displayName = "Occupier Tank",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384864284/91145F71FC94DCE7BE3239F7B57430D050C04CBF/",
        size = "long",
        type = "Ground Vehicle",
        points = 125,
        speed = 1,
        upgrades = {
          Pilot = 1,
          Hardpoint = 1,
          Comms = 1,        
        },
        silhouette = {
          height = 2,
          offset = 0,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/770610077943664603/48F725F2C3EAAF7514813A42EE084CE2E7382909/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/770610077942978328/35E12FB664BC3AE0A7AFCCAFF306AFC7481CE4D3/",
          },        
        },
        rank = "Heavy",
        faction = "Empire",
      },
      ["LAAT/LE PATROL TRANSPORT"] = {
        name = "LAAT/LE Patrol Transport",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384862671/52E7A6A14E5822A396F273D924D083F6F3A86286/",
        size = "laat",
        type = "Repulsor Vehicle",
        points = 100,
        speed = 2,
        height = 7,
        upgrades = {
          Pilot = 1,
          Ordnance = 1,
          Comms = 1,        
        },
        silhouette = {
          height = 6.36,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1747939379132611640/1EEBEB993635A56525283FAFA0D62D347FB3121C/",
          },        
        },
        rank = "Heavy",
        faction = "Empire",
      },
      ["IMPERIAL DARK TROOPERS"] = {
        name = "Imperial Dark Troopers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384862505/D3093456F093CB155707B1BA64512664F2A4B7DB/",
        size = "small",
        type = "Droid Trooper",
        points = 95,
        speed = 1,
        tokens = 2,
        upgrades = {
          ["Heavy Weapon"] = 2,
          Personnel = 1,
          Programming = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1785135125810942830/666860D7C34C83C500C62BDDE115F30C59A42C74/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2004698291313176203/E77892ADB668EA0CB548F6ED71BE44CA3FB730E7/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1785135125810942938/E77EC5970DA310A2E1D96F796E98D82813AE0891/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2004698291313176203/E77892ADB668EA0CB548F6ED71BE44CA3FB730E7/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1785135125810943021/4B5888D461F54C2C281B108233D1F1D8D8C2A679/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2004698291313176203/E77892ADB668EA0CB548F6ED71BE44CA3FB730E7/",
          },        
        },
        rank = "Heavy",
        faction = "Empire",
      },
      ["MAJOR MARQUAND TEMPEST SCOUT 2"] = {
        name = "Major Marquand",
        title = "Tempest Scout 2",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384862876/6C4E872F77BD526E8B352B041ADE53ED5504AC2B/",
        size = "huge",
        type = "Ground Vehicle",
        points = 180,
        speed = 2,
        upgrades = {
        
        },
        silhouette = {
          height = 8.84,
          offset = 0,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/999141806429351360/24C098E7B3D1708CDCFB9AEA4B2C445EF2DBAEE0/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/1752434998239690716/C6578DAF9012605B1F44A907D1C28646E34A73CF/",
          },        
        },
        commands = {
          {
            name = "Gunner, Infantry!",
            image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384886041/1D8783572AB6844253E1B746C543511E9B721587/",
            pip = 1,
          },
          {
            name = "Squadron, on me",
            image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384887260/11CDA1204949826F29A70E5544BF0ED0C5E2A153/",
            pip = 2,
          },
          {
            name = "Armored Cavalry",
            image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384868355/7ED8143E1A691DCF1E37E84E4E19F9231B891DB5/",
            pip = 3,
          },        
        },
        rank = "Heavy",
        faction = "Empire",
      },
    },
    ["REPUBLIC"] = {
      ["AHSOKA TANO PADAWAN COMMANDER"] = {
        name = "Ahsoka Tano",
        title = "Padawan Commander",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59217531459831840/7BAA676E59D56B62D2E11FB77DD5B0E5BC387437/",
        size = "small",
        type = "Trooper",
        points = 110,
        speed = 3,
        upgrades = {
          Force = 1,
          Command = 1,
          Training = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/16433335599854666/7D5FBD7E60477189142C905E42679993F4CA9CAD/",
          },        
        },
        commands = {
          {
            name = "You Are Beaten",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59217531459831475/BAB718B98F827E294BA50680227A363E3256DC7A/",
            pip = 1,
          },
          {
            name = "Revenge Is Not the Jedi Way",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59217531459831631/87162AF3AA810544D40A745E1F98085A92ACA105/",
            pip = 2,
          },
          {
            name = "I Go Where I'm Needed",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59217531459831728/03A628654EBBA66A64E040E128BB03A2650A8E90/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Republic",
      },
      ["OBI-WAN KENOBI CIVILIZED WARRIOR"] = {
        name = "Obi-Wan Kenobi",
        title = "Civilized Warrior",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134023515/2C9320594DD79CF3D7FC98C13487A00A2AE28598/",
        size = "small",
        type = "Trooper",
        points = 150,
        speed = 2,
        upgrades = {
          Force = 2,
          Command = 1,
          Training = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785236717873394134/94407058FBA842AD0FDCC0BBB8AB613EA9A739C2/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717873394267/272C1C9A8C15C36DC5C10DD62D5EFCEF9BFF4496/",
          },        
        },
        commands = {
          {
            name = "Hello There!",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134023412/5FD1AF7B0198FBD887EA7A072F53A8EFE47BA5AD/",
            pip = 1,
          },
          {
            name = "Knowledge And Defense",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134023462/0B7E151462188D5E5706415F406F0B51892CE553/",
            pip = 2,
          },
          {
            name = "General Kenobi",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134023367/DBEE15E658282BE84E693970FF184CBF515C7DEA/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Republic",
      },
      ["CLONE CAPTAIN REX HONORABLE SOLDIER"] = {
        name = "Clone Captain Rex",
        title = "Honorable Soldier",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134020880/7C51F849FFBA45101F85ED56C60A39BC9DCFEA9E/",
        size = "small",
        type = "Clone Trooper",
        points = 95,
        speed = 2,
        upgrades = {
          Command = 1,
          Training = 1,
          Gear = 2,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/776232727456806720/869654FC3B0590BFFF2E1845C3CFA9169838EBF9/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/776232727456806858/52327997163A5113DF9E11B85F9DA8B6B970012C/",
          },        
        },
        commands = {
          {
            name = "Call Me Captain",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134020825/C9D873D723AFC9AFB05A20B57D3335CB5DACC0C1/",
            pip = 1,
          },
          {
            name = "Take That, Clankers!",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134020928/838D3C418B11344945B861E1E17B2259AB7DC9A3/",
            pip = 2,
          },
          {
            name = "We're Not Programmed",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134020977/7375B857CECD3EC04F3DDA22799E789FAF4ABC13/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Republic",
      },
      ["ANAKIN SKYWALKER THE CHOSEN ONE"] = {
        name = "Anakin Skywalker",
        title = "The Chosen One",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384861047/D0BF783091611724C1324B3847037C1C1237F461/",
        size = "small",
        type = "Trooper",
        points = 155,
        speed = 2,
        upgrades = {
          Force = 2,
          Training = 2,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/1647717402898546429/B304222EB644FD345A672FA36A7C4F5DF5152C49/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/1618472373243511338/BA0B615A051FBA00DEFBB555DB87B516E19AF8EA/",
          },        
        },
        commands = {
          {
            name = "This Is Where The Fun Begins",
            image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384887696/8B9FE3223AA89990AC33B6326946F049921EC4D7/",
            pip = 1,
          },
          {
            name = "You Underestimate My Power",
            image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384888230/CD4880CE0C47B29696AC5AE71F165D9FF6A38266/",
            pip = 2,
          },
          {
            name = "General Skywalker",
            image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384885900/A971093410E02605CF759557DEC0B5CBD3127D79/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Republic",
      },
      ["CLONE COMMANDER TRAINED FOR LEADERSHIP"] = {
        name = "Clone Commander",
        title = "Trained For Leadership",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134030932/097AEAB205D99962C4D1BF4136A36D73029A43B2/",
        size = "small",
        type = "Clone Trooper",
        points = 60,
        speed = 2,
        upgrades = {
          Command = 1,
          Training = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809186354/387C36C2BB545E6CC882A05C0D81F5BE164166B7/",
          },        
        },
        rank = "Commander",
        faction = "Republic",
      },
      ["YODA GRAND MASTER OF THE JEDI ORDER"] = {
        name = "Yoda",
        title = "Grand Master Of The Jedi Order",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134036684/529CFF85876C6F4710D6E97CBBB99E15323584D4/",
        size = "small",
        type = "Trooper",
        points = 180,
        speed = 1,
        upgrades = {
          Force = 3,
          Command = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1617345381346377755/75D0ACFDFFCA5A08D7CAB59DA941B226D1563D46/",
          },        
        },
        commands = {
          {
            name = "Size Matters Not",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134037394/0B7834ECF0331C805C27F603B00D6C743B854388/",
            pip = 1,
          },
          {
            name = "There Is No Try",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134037407/66DFAF805CB1864A8A71CD35B3DCA41F9B213ECA/",
            pip = 2,
          },
          {
            name = "Luminous Beings Are We",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134037376/DDC7E052702169D9E14A51F886535CF5BD2007C1/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Republic",
      },
      ["WOOKIEE CHIEFTAIN CLAN LEADER"] = {
        name = "Wookiee Chieftain",
        title = "Clan Leader",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134052113/10120AB84E10E0EBDFEF30603F2B1EE9FA8382A7/",
        size = "small",
        type = "Wookiee Trooper",
        points = 100,
        speed = 2,
        upgrades = {
          Command = 1,
          Training = 2,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1619598523372467360/2810096383D51B0939DC3FFCBC83155C6D08CB53/",
          },        
        },
        rank = "Commander",
        faction = "Republic",
      },
      ["CHEWBACCA HERO OF KASHYYYK"] = {
        name = "Chewbacca",
        title = "Hero Of Kashyyyk",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134028001/43E55FD3A97B6A7800A94B65EA47507F7033CA65/",
        size = "small",
        type = "Wookiee Trooper",
        points = 90,
        speed = 2,
        upgrades = {
          Training = 2,
          Gear = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540540669973/90DD9EA44756CCF9B2473302DC644F3AEEED07B4/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670117/5AA04499FC8CC467864F9F335601E6335C03326D/",
          },        
        },
        commands = {
          {
            name = "Size Matters Sometimes",
            image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384887168/E234AAEC15D5B30E804CCD761723D30DAD4AC337/",
            pip = 2,
          },        
        },
        rank = "Commander",
        faction = "Republic",
      },
      ["PYKE SYNDICATE CAPO"] = {
        name = "Pyke Syndicate Capo",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718883/40D17DA044960A4A34979FBDEAE9296EB1E50346/",
        size = "small",
        type = "Trooper",
        points = 48,
        speed = 2,
        upgrades = {
          Command = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420351237/706DEA645FEE2EC9787F05F4FF2926632E2C4894/",
          },        
        },
        rank = "Commander",
        faction = "Republic",
      },
      ["CLONE COMMANDER CODY LEADER OF THE 212TH"] = {
        name = "Clone Commander Cody",
        title = "Leader of the 212th",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134025861/02F5F0A5209FE1F7F3315632CBDA187666A0258A/",
        size = "small",
        type = "Clone Trooper",
        points = 105,
        speed = 2,
        upgrades = {
          Command = 1,
          Training = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446813135529/6A6C874DBCA77E800A77C20FD36C2F223661CD10/",
          },        
        },
        commands = {
          {
            name = "Bring it Down!",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134025758/112F3DFC81DC78543EDFE2947CF3F3F007471510/",
            pip = 1,
          },
          {
            name = "Have I Ever Let you Down?",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134026057/C02C788C4E22D659C4C1FC71FA93C5CED64C4B87/",
            pip = 2,
          },
          {
            name = "Combined Arms",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134025951/456F450F410FB505809E7069B4E5ED4E9CAD8FD9/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Republic",
      },
      ["R2-D2 INDEPENDENT ASTROMECH"] = {
        name = "R2-D2",
        title = "Independent Astromech",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134141698/FAE960D0D49F0061E6FA7755E67185322CF307F0/",
        size = "small",
        type = "Droid Trooper",
        points = 55,
        speed = 1,
        upgrades = {
          Counterpart = 1,
          Comms = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/776232727456806966/EFBA4A71BFE748A2868C14B82DA3A7B0D559874A/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/777357228032306302/F5CA6FC54A8625E261F123D73792DE36D74E1686/",
          },        
        },
        commands = {
          {
            name = "Blast Off!",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134141577/8D591F13DCEA99113D64D58B6E2D68ED52A08EE7/",
            pip = 1,
          },
          {
            name = "Impromptu Immolation",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134141630/9373A105353B80AC756D358EBF8F21D63295D45C/",
            pip = 2,
          },
          {
            name = "Smoke Screen",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134141746/0599A5682160DFB2D79CCA9577530E15478AAEBD/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Republic",
      },
      ["PADME AMIDALA SPIRITED SENATOR"] = {
        name = "Padme Amidala",
        title = "Spirited Senator",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134139534/3D7B05D39495FB34AE0D4985A9B7E7771F738CAF/",
        size = "small",
        type = "Trooper",
        points = 60,
        speed = 2,
        upgrades = {
          Command = 1,
          Training = 1,
          Gear = 1,
          Armament = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/1003681674396399543/F485B2E6C10CBC01661E393966F014E5A5DE8BF9/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/1618472373243511387/F761552349A2CA2AE8210CEE254BCE08D439B687/",
          },        
        },
        commands = {
          {
            name = "Our Fate Is In Your Hands",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134139479/047DB4C4D70DEF7A41C639D90C4931DD04C9BD5C/",
            pip = 1,
          },
          {
            name = "Aggressive Negotiations",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134139326/7A72415F3906D4A9182818FE7BB25C3F3151E3FB/",
            pip = 2,
          },
          {
            name = "Diplomatic Cover",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134139409/0EBF63FE95FD6CCA1E652F1FCF25C048BCB39148/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Republic",
      },
      ["THE BAD BATCH CLONE FORCE 99"] = {
        name = "The Bad Batch",
        title = "Clone Force 99",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134145076/BAE80029E18C81D609CE49C8F8DAE0BE2D1FCF4D/",
        size = "small",
        type = "Trooper",
        points = 160,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 5,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2475370743175243916/EFBD0137414E802232F64B02C78A9D9275C9C1CB/",
          },        
        },
        commands = {
          {
            name = "We Do What We Do",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134148285/8246937579A18E5BE5A53451E49E65028CFC1EA1/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Republic",
      },
      ["CLONE TROOPER INFANTRY"] = {
        name = "Clone Trooper Infantry",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384861815/5F00E6C2F6F1B235D9D3B4E8A11E3D9B74EFEED0/",
        size = "small",
        type = "Clone Trooper",
        points = 56,
        speed = 2,
        upgrades = {
          ["Squad Leader"] = 1,
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Training = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393043/33A6FEA07374DAC8EBB6CDD463B6C761DC765D03/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393180/6359B491483DCD9B2641BA134DC4B92DE10E9D92/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393589/6AF627688F36D2049C1307BCB67A755FB27D51C5/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393180/6359B491483DCD9B2641BA134DC4B92DE10E9D92/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393727/8C4030EF9FEEB32E048567DC2EC38A1985E7C8C0/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393180/6359B491483DCD9B2641BA134DC4B92DE10E9D92/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785236717873457225/6382F0EA6E2DB0BC65921C3F4E5C97A84B422187/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393180/6359B491483DCD9B2641BA134DC4B92DE10E9D92/",
          },        
        },
        rank = "Corps",
        faction = "Republic",
      },
      ["PYKE SYNDICATE FOOT SOLDIERS"] = {
        name = "Pyke Syndicate Foot Soldiers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718821/EBC76B7A94A5F3C03B036C17E3C26E0319F1C6EB/",
        size = "small",
        type = "Trooper",
        points = 44,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845548/FD104F41509A53EA1C888862A3C5F0B98F609F1F/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845646/BE0DEED782F96BD44C389DEDEA41EBEA0C7A6D04/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845697/15B6DCCA8D8D76E1CB78219C58790E40DDD7CE8A/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845389/0D7DFE0C5BF5CDD527A619B75A25A2177D417BD0/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },        
        },
        rank = "Corps",
        faction = "Republic",
      },
      ["ARC TROOPERS"] = {
        name = "Arc Troopers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384861176/4AB3CC68BD898A328A2FB935E6F120934123D54E/",
        size = "small",
        type = "Clone Trooper",
        points = 58,
        speed = 2,
        upgrades = {
          ["Squad Leader"] = 1,
          ["Heavy Weapon"] = 1,
          Training = 1,
          Comms = 1,
          Gear = 2,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1009315641457802621/01F605D855048F823A0ECA6C46D2A62B56C04124/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/773995200348530664/5E248091F8CC37B1023257338D4947E4ADFE48AB/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1009315641457799750/AE83DC038BA8AAF48678D07E1F9734D4A9944C1D/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/773995200348530664/5E248091F8CC37B1023257338D4947E4ADFE48AB/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1009315641457800134/88E2FEC812AD5E7B7570836120992252AC758BF8/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/773995200348530664/5E248091F8CC37B1023257338D4947E4ADFE48AB/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1009315641457800538/06BBAAAAC7FB68DAA9351F12008475068A96BFFB/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/773995200348530664/5E248091F8CC37B1023257338D4947E4ADFE48AB/",
          },        
        },
        rank = "Special Forces",
        faction = "Republic",
      },
      ["ARC TROOPERS STRIKE TEAM"] = {
        name = "Arc Troopers",
        title = "Strike Team",
        displayName = "Arc Troopers (Strike Team)",
        heavyWeaponTeam = true,
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384861099/0BF691267928341734741CDF04AAE59A41E5E20B/",
        size = "small",
        type = "Clone Trooper",
        points = 24,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 1,
          Comms = 1,
          Gear = 2,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1009315641457802621/01F605D855048F823A0ECA6C46D2A62B56C04124/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/773995200348530664/5E248091F8CC37B1023257338D4947E4ADFE48AB/",
          },        
        },
        rank = "Special Forces",
        faction = "Republic",
      },
      ["WOOKIEE WARRIORS NOBLE FIGHTERS"] = {
        name = "Wookiee Warriors",
        title = "Noble Fighters",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135341447/B0773809842EFD82EFA442C9E918729C2DE3AA1F/",
        size = "small",
        type = "Wookiee Trooper",
        points = 69,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 2,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541173937/5179F4315AD6B0839454E1934E794A7F006C7813/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541174467/18352D89A219B89F6C869D89B9EDE22822F7F950/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541174158/677BF72C323CFF2314C174393AFA361C398C5519/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541174034/90C4A124BB82CCE0B5E38E13860ED49BB9A4973B/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541174304/9053CDD2798CEA905F8486498D0104B6ACA2F078/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541174467/18352D89A219B89F6C869D89B9EDE22822F7F950/",
          },        
        },
        rank = "Special Forces",
        faction = "Republic",
      },
      ["WOOKIEE WARRIORS KASHYYYK DEFENDERS"] = {
        name = "Wookiee Warriors",
        title = "Kashyyyk Defenders",
        displayName = "Wookiee Warriors (Defenders)",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135341419/3EC4467936F4470CD7F7E5BA2E4BE0CD069869AF/",
        size = "small",
        type = "Wookiee Trooper",
        points = 72,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1619598366708043779/0D96CE1619F4B27F583257A366431E3BAD428F19/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1619598366708043883/1EA1B3C21A50C20D4D168AB91ECFE1C01A4F7DF5/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1619598366708043883/1EA1B3C21A50C20D4D168AB91ECFE1C01A4F7DF5/",
          },        
        },
        rank = "Special Forces",
        faction = "Republic",
      },
      ["ARF TROOPERS"] = {
        name = "ARF Troopers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/12272409584211361084/EF41D3B9F89F86EC4E803863C17D1549052C8B55/",
        size = "small",
        type = "Clone Trooper",
        points = 58,
        speed = 2,
        upgrades = {
          ["Squad Leader"] = 1,
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Training = 1,
          Comms = 1,
          Gear = 2,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/16428815149933614/80D6829DB63FAE3328D00AC36F00E5FD71251E69/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/16428815149933714/D3FE0C2DEFBE1E78A71A55516DF87199D66DE2AC/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/16428815149643329/8D273B40809BF89188238DE6FC5C207756AA22EF/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/16428815149643405/9A3D0A513A31513523E59855980DFCE0A8F0F6E0/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/16428815149932871/EE8DF333D45ED841E9C31625FB4A9385C16B2F49/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/16428815149933386/736E0CCF2ADE31D6A9F6BE172B20AEB5420B815E/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/16428815149649053/B24484CFED06020454EE95B663DB3ECE17871D26/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/16428815149646949/50B6AA8C2CC5283537DBA2291F9801E7CD5FE77C/",
          },        
        },
        rank = "Special Forces",
        faction = "Republic",
      },
      ["BARC SPEEDER"] = {
        name = "BARC Speeder",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135357592/ED3AA636CBB456AA395C1694D27B84A296DD406B/",
        size = "large",
        type = "Repulsor Vehicle",
        points = 55,
        speed = 3,
        upgrades = {
          Crew = 1,
          Comms = 1,        
        },
        silhouette = {
          height = 1.584,
          offset = 0,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785236717873394399/018F8CC63E0D90F58AADA6328DF1709D4D1DF796/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717873394534/3E2F0490BA5D1024741F5806A4921D0E0E79EA9F/",
          },        
        },
        rank = "Support",
        faction = "Republic",
      },
      ["AT-RT"] = {
        name = "AT-RT",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384861217/5A25D4C32DFA78CC0FA0D45A19350BB8F971A467/",
        size = "large",
        type = "Ground Vehicle",
        points = 60,
        speed = 2,
        upgrades = {
          Hardpoint = 1,
          Comms = 1,        
        },
        silhouette = {
          height = 2.576,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2202884666993392985/D48A26F5F9D3498814911131BA08B0BAF92F8B65/",
          },        
        },
        rank = "Support",
        faction = "Republic",
      },
      ["RADDAUGH GNASP FLUTTERCRAFT"] = {
        name = "Raddaugh Gnasp Fluttercraft",
        displayName = "Fluttercraft",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135343126/F85A20B8CBAFDED99A98E49A5606034C27863FE8/",
        size = "huge",
        type = "Repulsor Vehicle",
        points = 55,
        speed = 2,
        upgrades = {
          Crew = 1,
          Comms = 1,        
        },
        silhouette = {
          height = 6.5,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1619598523372505515/1191E8089B37C0CC4BBE8283EF6B7F9C5A74A13C/",
          },        
        },
        rank = "Support",
        faction = "Republic",
      },
      ["SWOOP BIKE RIDERS"] = {
        name = "Swoop Bike Riders",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139721420/2BD490189FBB2AF2C7D6AA12EFA6EAA643EA2002/",
        size = "medium",
        type = "Repulsor Vehicle",
        points = 65,
        speed = 3,
        upgrades = {
          Comms = 1,        
        },
        silhouette = {
          height = 1.891,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1924743543116067434/0A068914BDD35AE6F63D7E29EBC7E0B5F712DA1F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1924743543116067490/87719312BE33C493B97B0915DB8C89FDC57D3F38/",
          },        
        },
        rank = "Support",
        faction = "Republic",
      },
      ["RADDAUGH GNASP FLUTTERCRAFT ATTACK CRAFT"] = {
        name = "Raddaugh Gnasp Fluttercraft",
        title = "Attack Craft",
        displayName = "Attack Craft",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384863253/19EFFAD3DCCEF1FA1CCBE08AE62F90E4EF63F414/",
        size = "huge",
        type = "Repulsor Vehicle",
        points = 57,
        speed = 2,
        upgrades = {
          Crew = 1,
          Comms = 1,        
        },
        silhouette = {
          height = 6.5,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1619598523372505515/1191E8089B37C0CC4BBE8283EF6B7F9C5A74A13C/",
          },        
        },
        rank = "Support",
        faction = "Republic",
      },
      ["CLONE COMMANDOS"] = {
        name = "Clone Commandos",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135343637/2D368BCB50598F733E54128E5B1BF53CB49F853F/",
        size = "small",
        type = "Clone Trooper",
        points = 75,
        speed = 2,
        upgrades = {
          Training = 1,
          Gear = 1,
          Comms = 1,
          Armament = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682669631/743A3F4EE203D22A0C7A8324994F8DD6D15337C0/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682582714/3AFE8876506FE4B261417033A0E804BA9146FECE/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682669442/778C5CDC3ED0EF8036784484685D9C1E283AE229/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682582714/3AFE8876506FE4B261417033A0E804BA9146FECE/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682669514/964CC0732F05CF777C4F226E4A66B82C9B8F17F1/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682582714/3AFE8876506FE4B261417033A0E804BA9146FECE/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682669589/FE6E365D8DFE4186F7AE93CBEF854B84881DFA18/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682582714/3AFE8876506FE4B261417033A0E804BA9146FECE/",
          },        
        },
        additionalObjects = {
          "Complete the Mission Token",        
        },
        rank = "Support",
        faction = "Republic",
      },
      ["CLONE COMMANDOS DELTA SQUAD"] = {
        name = "Clone Commandos Delta Squad",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135343678/F395BC8F8B88F888355FCFAFA870875613499CD1/",
        size = "small",
        type = "Clone Trooper",
        points = 100,
        speed = 2,
        upgrades = {
          Training = 2,
          Gear = 1,
          Comms = 1,
          Armament = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2474241114696859651/A77E973493F46183AC97F68C1A191EC0E74F6A65/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2474241114696882381/265198067C41DF8333A609EDCE831A547A68F28F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2474241114696859554/12CFFC76B71288B5426C2E57CC8A91F515B075F2/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2474241114696882580/BE0E56B70A5D6B576BA4AAB83FDB1DB2BD835887/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2474241114696859485/0340EC3130B99413F05F2CB2544E9FDE79A3871D/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2474241114696882497/A846281F67580B208A2BBBDADE7C601230486E20/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2474241114696859319/2846289D99E3CA2DC68F2BB8FC69ECF1ABE2072E/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2474241114696882664/1B6168DA14AFA3A40CC823399CC4072FD1B7E958/",
          },        
        },
        additionalObjects = {
          "Complete the Mission Token",        
        },
        rank = "Support",
        faction = "Republic",
      },
      ["SABER-CLASS TANK"] = {
        name = "Saber-Class Tank",
        displayName = "Saber Tank",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384863579/ABC4E8CCA9A2C837A86FF23215B5AE4885E2A9DF/",
        size = "epic",
        type = "Repulsor Vehicle",
        points = 155,
        speed = 2,
        upgrades = {
          Pilot = 1,
          Hardpoint = 1,
          Ordnance = 2,
          Comms = 1,        
        },
        silhouette = {
          height = 2.596,
          offset = 0,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785236717873392482/BC01571E47E96306C31FABABE3EA971814E00C96/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717873392638/CE1C3404249840D5F7F9499D1427E83530ACEB19/",
          },        
        },
        rank = "Heavy",
        faction = "Republic",
      },
      ["LAAT/LE PATROL TRANSPORT"] = {
        name = "LAAT/LE Patrol Transport",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384862727/5EB0BB290C80AE07B16848984044B13E3C405E05/",
        size = "laat",
        type = "Repulsor Vehicle",
        points = 100,
        speed = 2,
        height = 7,
        upgrades = {
          Pilot = 1,
          Ordnance = 1,
          Comms = 1,        
        },
        silhouette = {
          height = 6.46,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1747939379132611640/1EEBEB993635A56525283FAFA0D62D347FB3121C/",
          },        
        },
        rank = "Heavy",
        faction = "Republic",
      },
      ["INFANTRY SUPPORT PLATFORM"] = {
        name = "Infantry Support Platform",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135344629/540E23C816C00B4B7E086B626329F13633403C9E/",
        size = "huge",
        type = "Repulsor Vehicle",
        points = 65,
        speed = 3,
        upgrades = {
          Pilot = 1,
          Hardpoint = 1,
          Comms = 1,        
        },
        silhouette = {
          height = 1.55,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1619598523372574861/CCF68AF1C35F52A714AB0344FCB170F5BAA1672A/",
          },        
        },
        rank = "Heavy",
        faction = "Republic",
      },
    },
    ["SEPARATIST"] = {
      ["GENERAL GRIEVOUS SINISTER CYBORG"] = {
        name = "General Grievous",
        title = "Sinister Cyborg",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131432388/26B30B4276062FA8693A0D3E566671DAD9DF5DD2/",
        size = "small",
        type = "Trooper",
        points = 130,
        speed = 2,
        upgrades = {
          Command = 2,
          Training = 1,
          Gear = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780869167436/AAA2C61A17BB43F2673AF16D30BD0478B9AAAD2A/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780869167571/EF86CBDA5F361282AD077D61FA81ABF0FEE061A0/",
          },        
        },
        commands = {
          {
            name = "Trained In Your Jedi Arts",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131526384/C4406A3487D2E58D1AF4962B9A306EC5882596CC/",
            pip = 1,
          },
          {
            name = "Supreme Commander",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131525863/124C8C8CAA960D6680FD429BD85DA760AFD9040A/",
            pip = 2,
          },
          {
            name = "Crush Them!",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131524786/7D9A98904E7D5F80F9590AAA5EDF107F2B95623A/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Separatist",
      },
      ["COUNT DOOKU DARTH TYRANUS"] = {
        name = "Count Dooku",
        title = "Darth Tyranus",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131432037/24F46472FEFFC678779BC1CA2FF6B4460E2E039D/",
        size = "small",
        type = "Trooper",
        points = 165,
        speed = 2,
        upgrades = {
          Force = 3,
          Command = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/775105953849586543/25BD09F275C593DB6C794359A9C50F3188F4D804/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/775105953849586640/B0512CC73C982F94EB5FEAE1661CF4438DAD8879/",
          },        
        },
        commands = {
          {
            name = "Fear, Surprise, Intimidation",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131525203/8AE25439B2A4589B48502B5BECE8652BC37CF941/",
            pip = 1,
          },
          {
            name = "Double The Fall",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131525177/CD39DEA23EB51B132F1263FEF158FBED10C5C32A/",
            pip = 2,
          },
          {
            name = "You Disappoint Me",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131527845/7429252D8F4A59BFD43846F93CBA904ADEC133E3/",
            pip = 3,
          },
          {
            name = "The Sith Will Rule",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131526321/AD7E17FC8BC3387075D2EDAEB5506F4AAEF2084F/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Separatist",
      },
      ["T-SERIES TACTICAL DROID PROGRAMMED FOR STRATEGY"] = {
        name = "T-Series Tactical Droid",
        title = "Programmed For Strategy",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131433848/B4160FE013FB7B00BA8A6DE876F507A667602F6A/",
        size = "small",
        type = "Droid Trooper",
        points = 60,
        speed = 2,
        upgrades = {
          Command = 1,
          Comms = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809185719/FF120BC2FA5DC8258021E2849C2B81591CCA36B9/",
          },        
        },
        rank = "Commander",
        faction = "Separatist",
      },
      ["SUPER TACTICAL DROID"] = {
        name = "Super Tactical Droid",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384864140/4D45D9C35BD4227637CADD23C1E750583320D68F/",
        size = "small",
        type = "Droid Trooper",
        points = 75,
        speed = 2,
        upgrades = {
          Command = 2,
          Comms = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1619598366706441730/D50A1B8823BE590384D2A2D904A321B3337276AD/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1619598366706441991/04B29BB48A98AF8D79FC1414548496BAD49CCB28/",
          },        
        },
        commands = {
          {
            name = "They Too Will Suffer",
            image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865564036005/BCB6B4D75C375323E4CA020BB1AA01497BEE11ED/",
            pip = 1,
          },
          {
            name = "Preservation Protocols",
            image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865564034846/6DFE5FBF65026639A194D1A915193AD147736713/",
            pip = 2,
          },
          {
            name = "Do Not Underestimate Our Means",
            image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384885557/BB41754355D4B8C5C9E444C1F3A5D41096109F5E/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Separatist",
      },
      ["KALANI SUPER TACTICAL DROID"] = {
        name = "Kalani",
        title = "Super Tactical Droid",
        displayName = "Kalani",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131432463/7A808E698411F5F0692FAF805529083CDB7EFAF8/",
        size = "small",
        type = "Droid Trooper",
        points = 85,
        speed = 2,
        upgrades = {
          Command = 3,
          Comms = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1619598366706441824/97EB6FA096B824294EE48FE762380CCBE866F3E2/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1619598366706441991/04B29BB48A98AF8D79FC1414548496BAD49CCB28/",
          },        
        },
        commands = {
          {
            name = "They Too Will Suffer",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131526359/B72758B5C45391BA8FDD1C1E6023685EF3B64EBD/",
            pip = 1,
          },
          {
            name = "Preservation Protocols",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131525817/8473E63B725077F3D5EED0C66B103F218DA907BF/",
            pip = 2,
          },
          {
            name = "Do Not Underestimate Our Means",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131524814/1C9294E7627AEFC235A525FED15C4EF7B2341C9E/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Separatist",
      },
      ["KRAKEN SUPER TACTICAL DROID"] = {
        name = "Kraken",
        title = "Super Tactical Droid",
        displayName = "Kraken",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131433103/C2CD6A90911C879E745B1B79DFE9B810F02CA25D/",
        size = "small",
        type = "Droid Trooper",
        points = 80,
        speed = 2,
        upgrades = {
          Command = 2,
          Training = 1,
          Comms = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1619598366706113202/449F19DA94D42DAD0F0B4D0B77A8E9AD45C320E5/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1619598366706441991/04B29BB48A98AF8D79FC1414548496BAD49CCB28/",
          },        
        },
        commands = {
          {
            name = "They Too Will Suffer",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131526359/B72758B5C45391BA8FDD1C1E6023685EF3B64EBD/",
            pip = 1,
          },
          {
            name = "Preservation Protocols",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131525817/8473E63B725077F3D5EED0C66B103F218DA907BF/",
            pip = 2,
          },
          {
            name = "Do Not Underestimate Our Means",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131524814/1C9294E7627AEFC235A525FED15C4EF7B2341C9E/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Separatist",
      },
      ["PYKE SYNDICATE CAPO"] = {
        name = "Pyke Syndicate Capo",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718883/40D17DA044960A4A34979FBDEAE9296EB1E50346/",
        size = "small",
        type = "Trooper",
        points = 48,
        speed = 2,
        upgrades = {
          Command = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420351237/706DEA645FEE2EC9787F05F4FF2926632E2C4894/",
          },        
        },
        rank = "Commander",
        faction = "Separatist",
      },
      ["BLACK SUN VIGO"] = {
        name = "Black Sun Vigo",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718200/725F66281B4596ACF010C38A1E37D169B597D56C/",
        size = "small",
        type = "Trooper",
        points = 50,
        speed = 2,
        upgrades = {
          Command = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143763/E93BA6716A05CA95AE2EA3B7C0DFD8AF145D5C22/",
          },        
        },
        rank = "Commander",
        faction = "Separatist",
      },
      ["POGGLE THE LESSER PUBLIC LEADER OF THE GEONOSIANS"] = {
        name = "Poggle the Lesser",
        title = "Public Leader of the Geonosians",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131433181/C18229FCF2010EC9491505DEA6AECE1F4F21C147/",
        size = "small",
        type = "Trooper",
        points = 80,
        speed = 1,
        upgrades = {
          Command = 2,
          Comms = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177195973/1D70D4C8D0C6A06E14A7A875228E3CD49D5E0807/",
          },        
        },
        commands = {
          {
            name = "Let the Executions Begin!",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131525219/2DC3EA9357F54CB08F97B0B3449B2923DB7FB9A5/",
            pip = 1,
          },
          {
            name = "We Serve the Queen",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131527776/24A2E956D84B32FBED8B65F05B05BB32560F0E34/",
            pip = 2,
          },
          {
            name = "We Make Weapons",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131527739/6639117C739334B7AD7980050721AA7C8028B56B/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Separatist",
      },
      ["CAD BANE NEEDS NO INTRODUCTION"] = {
        name = "Cad Bane",
        title = "Needs No Introduction",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137007196/49655B5A32FFAB3CE31BFCCFEA9811CD4A51B748/",
        size = "small",
        type = "Trooper",
        points = 105,
        speed = 2,
        upgrades = {
          Training = 2,
          Comms = 1,
          Gear = 1,
          Armament = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/1003681674396400482/F8900CFC9EF2309C9F54AE33AE5444B2B09DB1CD/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/1003681674396400696/907F4310FEA7A7CD89EE64A1AF3A8CC77897CCAC/",
          },        
        },
        commands = {
          {
            name = "I'm Your Worst Nightmare",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137014543/33FE8591FAFD29F8BEAF13D64851772A7FD794FE/",
            pip = 1,
          },
          {
            name = "I'm In Control",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137014579/D2FC7AF724D1C7527CCDDABF18517E9CB99DF061/",
            pip = 2,
          },
          {
            name = "I Make The Rules Now",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137014560/4B6E8AF4CB10FFE7EC529D204390FC45291FC962/",
            pip = 3,
          },        
        },
        additionalObjects = {
          "Bane Token: Blank",
          "Bane Token: Bomb",
          "Bane Token: Bane",
          "Victory Token",        
        },
        rank = "Operative",
        faction = "Separatist",
      },
      ["BOSSK TRANDOSHAN TERROR"] = {
        name = "Bossk",
        title = "Trandoshan Terror",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137006564/2C7F90FF127392A78F71B82EF4E69C35973824AD/",
        size = "small",
        type = "Trooper",
        points = 105,
        speed = 2,
        upgrades = {
          Training = 2,
          Gear = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/948474323838791181/6B9D77B77DF8FD7AFA19342AD687F0E15A2E21B7/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/948474323838791276/ABFCDD8C71D484E6B6050080BB80B79D0DE93178/",
          },        
        },
        commands = {
          {
            name = "Merciless Munitions",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137013809/1D7FCC2F2A12F6B09B07345330F840800A846F7C/",
            pip = 1,
          },
          {
            name = "Reptilian Rampage",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137013972/29F197704D74AF20E8954F2BE8AC5C9203F9A2E6/",
            pip = 2,
          },
          {
            name = "Lying In Wait",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137013903/60F4AC014F68998F8A3587BA0A5389301A0BAA7C/",
            pip = 3,
          },        
        },
        additionalObjects = {
          "Proton Charge Token",
          "Victory Token",        
        },
        rank = "Operative",
        faction = "Separatist",
      },
      ["MAUL IMPATIENT APPRENTICE"] = {
        name = "Maul",
        title = "Impatient Apprentice",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131433136/F385AC355EF21CEED5446F6BB6DEB590B4341000/",
        size = "small",
        type = "Trooper",
        points = 130,
        speed = 2,
        upgrades = {
          Force = 2,
          Training = 2,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809185590/81774E94925CD5B15B7CE0DC52DEC465D9774024/",
          },        
        },
        commands = {
          {
            name = "Duel Of The Fates",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131525195/991D793228F9D99D199201EEF560C5A4F294C4C1/",
            pip = 1,
          },
          {
            name = "The Phantom Menace",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131526286/338C5FAB4F7AB7F57BA3C1D5791B2BB1F6B2DC09/",
            pip = 2,
          },
          {
            name = "At Last",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131524747/50D631657EE81A881136A50FBDA60E8B22DCD9ED/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Separatist",
      },
      ["ASAJJ VENTRESS SEPARATIST ASSASSIN"] = {
        name = "Asajj Ventress",
        title = "Separatist Assassin",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131430684/75EA0FFCF13BC00426CBFA0F3F8E390B0FCDF508/",
        size = "small",
        type = "Trooper",
        points = 130,
        speed = 2,
        upgrades = {
          Force = 2,
          Training = 2,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2022718494181455957/4BB3E42AA412A7ED2ED6F26BFDFA25414F127B71/",
          },        
        },
        commands = {
          {
            name = "The Jedi Shall Fall",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131526250/371EA639E96CFA36BE3A339BE26403B2923D5C1E/",
            pip = 1,
          },
          {
            name = "I am Fear",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131525215/8F52AEE8AA429791E8333BC3F3F8B89E6157246B/",
            pip = 2,
          },
          {
            name = "Yes, My Master",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131527806/5B8009C57EF4BF1EBAEF31CF6D5AC745D12B5730/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Separatist",
      },
      ["SUN FAC RUTHLESS LIEUTENANT"] = {
        name = "Sun Fac",
        title = "Ruthless Lieutenant",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131433813/69B81D6A1264FF5AAA8B683580A55D26BF104EAA/",
        size = "small",
        type = "Trooper",
        points = 80,
        speed = 2,
        upgrades = {
          Training = 1,
          Comms = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177195724/233E75C81DB511291B2B95015510DF1B48B2A8DB/",
          },        
        },
        commands = {
          {
            name = "Brutal Enforcer",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131524776/66DAC77F67654F866C0B521F0AFB46A4CD6FFC06/",
            pip = 1,
          },        
        },
        rank = "Operative",
        faction = "Separatist",
      },
      ["B1 BATTLE DROIDS"] = {
        name = "B1 Battle Droids",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131430739/5F4B6BDDB4CD6561E87D8203CEEA15B77A2B7149/",
        size = "small",
        type = "Droid Trooper",
        points = 38,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Comms = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166347/AA861F86A0B74CF335533E425A6CBACB99395A09/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166529/263C2AB95B1743539EC2CBDE40B0A14B1F5E5693/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780869167061/48F42C02EDD970E6DE8E59B8601EF3E7F11C1742/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166919/FE5AD3A71430C729735E3FF7023D9E546E12FEF1/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780869167061/48F42C02EDD970E6DE8E59B8601EF3E7F11C1742/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166919/FE5AD3A71430C729735E3FF7023D9E546E12FEF1/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780869167318/DBC7863706A08B96020D3BFBE7A0C2C5689B7B08/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166919/FE5AD3A71430C729735E3FF7023D9E546E12FEF1/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166660/36AF6887F11FC70FF6AB75D0434EA79952C9E882/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166919/FE5AD3A71430C729735E3FF7023D9E546E12FEF1/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780869167194/9ADFFD9AD608CBE3E9F6F61AB416E699A4156109/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166919/FE5AD3A71430C729735E3FF7023D9E546E12FEF1/",
          },        
        },
        rank = "Corps",
        faction = "Separatist",
      },
      ["B2 SUPER BATTLE DROIDS"] = {
        name = "B2 Super Battle Droids",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131430767/3830309294245496BAC8E0C74A0F2C7DD1253460/",
        size = "small",
        type = "Droid Trooper",
        points = 64,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Comms = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/775105953849586118/94F967F21EA7E390A200C4BDA5581D07DBB37AC2/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/775105953849585789/91A639AB9F57BE393683DA53212E395886307C52/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/775105953849586430/E5941CF7A3631E6D4A28832AE489A4340C96B0B9/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/775105953849585789/91A639AB9F57BE393683DA53212E395886307C52/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/775105953849586226/9326AD8D3EC80CC53F4BF2D156014978DCD715D9/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/775105953849585789/91A639AB9F57BE393683DA53212E395886307C52/",
          },        
        },
        rank = "Corps",
        faction = "Separatist",
      },
      ["PYKE SYNDICATE FOOT SOLDIERS"] = {
        name = "Pyke Syndicate Foot Soldiers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718821/EBC76B7A94A5F3C03B036C17E3C26E0319F1C6EB/",
        size = "small",
        type = "Trooper",
        points = 44,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845548/FD104F41509A53EA1C888862A3C5F0B98F609F1F/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845646/BE0DEED782F96BD44C389DEDEA41EBEA0C7A6D04/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845697/15B6DCCA8D8D76E1CB78219C58790E40DDD7CE8A/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845389/0D7DFE0C5BF5CDD527A619B75A25A2177D417BD0/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },        
        },
        rank = "Corps",
        faction = "Separatist",
      },
      ["BLACK SUN ENFORCERS"] = {
        name = "Black Sun Enforcers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718139/222491782E56EAECE8B93E78E946F308211DC049/",
        size = "small",
        type = "Trooper",
        points = 50,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845475/01738B0D52E2D9C2870D6E33A2D05ECD12201C85/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143724/48B5A35E10B4977E255D889A8FCAEA8C980A11A9/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143328/3D6F3C2E8DFB78B9B748FFC8F339B9C568D7408E/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143724/48B5A35E10B4977E255D889A8FCAEA8C980A11A9/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143328/3D6F3C2E8DFB78B9B748FFC8F339B9C568D7408E/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143724/48B5A35E10B4977E255D889A8FCAEA8C980A11A9/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143328/3D6F3C2E8DFB78B9B748FFC8F339B9C568D7408E/",
          },        
        },
        rank = "Corps",
        faction = "Separatist",
      },
      ["GEONOSIAN WARRIORS SOLDIERS OF THE HIVE"] = {
        name = "Geonosian Warriors",
        title = "Soldiers of the Hive",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131432412/D396E8DD6EEDD4AD239A43CCE45BBC28B720DD77/",
        size = "small",
        type = "Trooper",
        points = 45,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177202081/37F68E146C49B315AA46E15BE88DDB56AE97646C/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177195881/84020A8311904050DC9309FE9109D47BC41FE4AA/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177201554/7AEA5B0A98A298731F6BE51591401BBF095A5797/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177195881/84020A8311904050DC9309FE9109D47BC41FE4AA/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177201933/E0DBF0D812FFF4F7F3A77CF1E4EAB84F78B8C49E/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177195881/84020A8311904050DC9309FE9109D47BC41FE4AA/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177202012/76CB0371503304D5AAF562E5E2F04961CD206090/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177195881/84020A8311904050DC9309FE9109D47BC41FE4AA/",
          },        
        },
        rank = "Corps",
        faction = "Separatist",
      },
      ["BX-SERIES DROID COMMANDOS"] = {
        name = "BX-Series Droid Commandos",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131431998/46D37A7B1D195729C7E854687F0F287E5DD8DED2/",
        size = "small",
        type = "Droid Trooper",
        points = 64,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 1,
          Comms = 1,
          Armament = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1009315641457847081/F7D4E8D3EC85BAEEB5C1B5B913B7F484CC28FC10/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/773995528924546789/8774CBBDC3C4F18B11A444CC96EA5FE7F00DB48F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1009315641457845802/AE70766EAA85C875B023FB980A5A5CEEFB98B1D9/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/773995528924546789/8774CBBDC3C4F18B11A444CC96EA5FE7F00DB48F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1009315641457846188/D7F348E890430AA319DDDFA513D99DC2783ECF91/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/773995528924546789/8774CBBDC3C4F18B11A444CC96EA5FE7F00DB48F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1009315641457846574/F169D9E2E45B73D1E21B17E32D3B4B4D9AACB196/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/773995528924546789/8774CBBDC3C4F18B11A444CC96EA5FE7F00DB48F/",
          },        
        },
        rank = "Special Forces",
        faction = "Separatist",
      },
      ["BX-SERIES DROID COMMANDOS STRIKE TEAM"] = {
        name = "BX-Series Droid Commandos",
        title = "Strike Team",
        displayName = "BX-Series Commandos (Strike Team)",
        heavyWeaponTeam = true,
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131430807/F260EA4E79ACB29C3C635836A3EF7E7C632E4FB6/",
        size = "small",
        type = "Droid Trooper",
        points = 20,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 1,
          Comms = 1,
          Armament = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1009315641457847081/F7D4E8D3EC85BAEEB5C1B5B913B7F484CC28FC10/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/773995528924546789/8774CBBDC3C4F18B11A444CC96EA5FE7F00DB48F/",
          },        
        },
        rank = "Special Forces",
        faction = "Separatist",
      },
      ["DRK-1 SITH PROBE DROIDS"] = {
        name = "DRK-1 Sith Probe Droids",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131432071/495850F5BE28D1D1551D13D5B86F473D8EB154EC/",
        size = "small",
        type = "Droid Trooper",
        points = 35,
        speed = 2,
        upgrades = {
          Comms = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809185513/A794F69FD4F7FF6093A8E4564633AF49C95DE79D/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809185513/A794F69FD4F7FF6093A8E4564633AF49C95DE79D/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809185513/A794F69FD4F7FF6093A8E4564633AF49C95DE79D/",
          },        
        },
        rank = "Special Forces",
        faction = "Separatist",
      },
      ["IG-100 MAGNAGUARD"] = {
        name = "IG-100 MagnaGuard",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131432444/15103BB5D4C33479CCB11DE66465798D9F92AFAD/",
        size = "small",
        type = "Droid Trooper",
        points = 72,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 2,
          Comms = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1621849308236386731/FA50237A0BF717ED06EA3020D5F4089D452ADCD6/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1621849538641208262/A0E48F7D9C94617C81BAD4D649717BAC7A8B9B64/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1621849308236386470/4D5227051DEEED77303985CE6D34CDBFB27FD472/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1621849538641208262/A0E48F7D9C94617C81BAD4D649717BAC7A8B9B64/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1621849308236386513/AC53B9F503C0B353AE7AA797072F7EBA15A1214C/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1621849538641208262/A0E48F7D9C94617C81BAD4D649717BAC7A8B9B64/",
          },        
        },
        rank = "Special Forces",
        faction = "Separatist",
      },
      ["IG-100 MAGNAGUARD PROTOTYPE ASSASSIN DROIDS"] = {
        name = "IG-100 MagnaGuard",
        title = "Prototype Assassin Droids",
        displayName = "Prototype Assassin Droids",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131432434/A38C1603DC1173981D6AE179774F385B400DE073/",
        size = "small",
        type = "Droid Trooper",
        points = 56,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1621849308236386731/FA50237A0BF717ED06EA3020D5F4089D452ADCD6/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1621849538641208262/A0E48F7D9C94617C81BAD4D649717BAC7A8B9B64/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1621849308236386470/4D5227051DEEED77303985CE6D34CDBFB27FD472/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1621849538641208262/A0E48F7D9C94617C81BAD4D649717BAC7A8B9B64/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1621849308236386513/AC53B9F503C0B353AE7AA797072F7EBA15A1214C/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1621849538641208262/A0E48F7D9C94617C81BAD4D649717BAC7A8B9B64/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1621849308236386470/4D5227051DEEED77303985CE6D34CDBFB27FD472/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1621849538641208262/A0E48F7D9C94617C81BAD4D649717BAC7A8B9B64/",
          },        
        },
        rank = "Special Forces",
        faction = "Separatist",
      },
      ["DROIDEKAS"] = {
        name = "Droidekas",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131432109/A0B45534B85F46D38A4F372B04041A5193B31426/",
        size = "medium",
        type = "Ground Vehicle",
        points = 60,
        speed = 1,
        upgrades = {
          Comms = 1,        
        },
        silhouette = {
          height = 1.85,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1686023445067168845/FBADA8EDE2ED248CA7F50C1DB3BFF46215E0360B/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1686023445067146631/305531F34B6598A008F5925D828457DF1A8195F6/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1686023445067146269/A9189AC12193D3BD24624F7A5137C4E69FADDBBF/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1686023445067146631/305531F34B6598A008F5925D828457DF1A8195F6/",
          },        
        },
        rank = "Support",
        faction = "Separatist",
      },
      ["LM-432 CRAB DROID"] = {
        name = "LM-432 Crab Droid",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2491139050708063278/ED3246E4E67C5213E1DDDA3064AFAB7213BDD737/",
        size = "large",
        type = "Ground Vehicle",
        points = 70,
        speed = 2,
        upgrades = {
          Comms = 1,
          Programming = 1,
          Hardpoint = 1,        
        },
        silhouette = {
          height = 1.453,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/16432158164944196/4594ADE002844CEEB6FB9A75E17AA802FCAE89FF/",
          },        
        },
        rank = "Support",
        faction = "Separatist",
      },
      ["STAP RIDERS"] = {
        name = "STAP Riders",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131433789/32FE5B587A5DD8D208101FCE74CD2BE690483F37/",
        size = "medium",
        type = "Repulsor Vehicle",
        points = 80,
        speed = 3,
        upgrades = {
          Comms = 1,        
        },
        silhouette = {
          height = 2.246,
          offset = 0,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/16431529699543053/6B293027828F96F5A6DF95E8E0D4238F13FF2520/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/16431529699543124/C68D34EDD49D80DF4CCD801A50C085BFDE59E13D/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/16431529699543293/DE945637F2A703763288FF04C08FF27A52F1BB62/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/16431529699543380/AB5C8DBAC327E95B4938F575EBFB88A340519A53/",
          },        
        },
        rank = "Support",
        faction = "Separatist",
      },
      ["DSD1 DWARF SPIDER DROID"] = {
        name = "DSD1 Dwarf Spider Droid",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131432141/809B747B4008E7D3CF6EFB9EE1A4E3330A8D7C50/",
        size = "large",
        type = "Ground Vehicle",
        points = 50,
        speed = 2,
        upgrades = {
          Programming = 1,
          Hardpoint = 1,
          Comms = 1,        
        },
        silhouette = {
          height = 1.756,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1621849538645161033/A69093521055BB5CA008D3DDE5F6EBEB990D0AF2/",
          },        
        },
        rank = "Support",
        faction = "Separatist",
      },
      ["AAT BATTLE TANK"] = {
        name = "AAT Battle Tank",
        displayName = "AAT Battle Tank",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131430642/9FCE0FB0F62A9381DF3CE2F786DBC749CB2A8FFF/",
        size = "epic",
        type = "Repulsor Vehicle",
        points = 165,
        speed = 1,
        upgrades = {
          Pilot = 1,
          Ordnance = 2,
          Comms = 1,        
        },
        silhouette = {
          height = 4.022,
          offset = 0,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785235151813166538/2F32058DDD51C131547B66A3927041BDACDD9E72/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785235151813166725/2751E83472B0B6BD0559F5E77FAA3D62A0E17BB1/",
          },        
        },
        rank = "Heavy",
        faction = "Separatist",
      },
      ["PERSUADER-CLASS TANK DROID"] = {
        name = "Persuader-Class Tank Droid",
        displayName = "Persuader Tank",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131496505/E6D1491724153DE1BE82FA00B4630DC24E9877ED/",
        size = "snail",
        type = "Ground Vehicle",
        points = 130,
        speed = 1,
        upgrades = {
          Programming = 1,
          Ordnance = 2,
          Comms = 1,        
        },
        silhouette = {
          height = 3.323,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1924743543116068132/37BCE99DCF06BEFA1119FEA911188695F9C48079/",
          },        
        },
        rank = "Heavy",
        faction = "Separatist",
      },
      ["PERSUADER-CLASS TANK DROID PROTOTYPE TANK DROID"] = {
        name = "Persuader-Class Tank Droid",
        title = "Prototype Tank Droid",
        displayName = "Prototype Tank Droid",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131496505/E6D1491724153DE1BE82FA00B4630DC24E9877ED/",
        size = "snail",
        type = "Ground Vehicle",
        points = 130,
        speed = 1,
        upgrades = {
          Programming = 1,
          Ordnance = 2,
          Comms = 1,        
        },
        silhouette = {
          height = 3.323,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1924743543116068132/37BCE99DCF06BEFA1119FEA911188695F9C48079/",
          },        
        },
        rank = "Heavy",
        faction = "Separatist",
      },
      ["AQUA DROIDS"] = {
        name = "Aqua Droids",
        image = "https://steamusercontent-a.akamaihd.net/ugc/1794100632571587/D3308B09BB6167322BFFB83C1A7E420C431D2396/",
        size = "medium",
        type = "Ground Vehicle",
        points = 65,
        speed = 1,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Comms = 1,        
        },
        silhouette = {
          height = 1.85,
          offset = 0,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/16428277771257521/99A8ACEC9864DE29C7CE97006E86248BB2A89554/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/16428277771257705/0333921D3F7C247633D1ACF1E5D02817AD5033C5/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/16428277771264084/F6A007092091B31717175CB063F1E48538CF1AB5/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/16428277771264195/557F35AB163FBF0C51672567101157A8750C1DAD/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/16428277771241462/FFE8D6B9DE310FE7BC3B01C8128264DB9A8B1DFE/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/16428277771241663/4DEF50D36EB484BB1BBD9FD6092708DEF89A28EA/",
          },        
        },
        rank = "Heavy",
        faction = "Separatist",
      },
    },
    ["SHADOWCOLLECTIVE"] = {
      ["GAR SAXON MILITANT COMMANDO"] = {
        name = "Gar Saxon",
        title = "Militant Commando",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139719525/A5642D0B10D7426AD751D9428A0C249D5F4BAF2F/",
        size = "small",
        type = "Trooper",
        points = 100,
        speed = 3,
        upgrades = {
          Training = 2,
          Comms = 1,
          Gear = 2,
          Armament = 2,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143862/CF491C11176E40BD786A89E1D0C20D3316448188/",
          },        
        },
        commands = {
          {
            name = "Marked for Elimination",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139734189/BFD230D0FDCC337658C60B4254D6718684F4EF21/",
            pip = 1,
          },
          {
            name = "Fight Another Day",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139727495/1DCDC03996549F05C8D84E79CCAAC22F9F22CA17/",
            pip = 2,
          },
          {
            name = "Victory or Death!",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139734267/BE465B62B232B7E2F2992497221C565D00B19CCF/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "ShadowCollective",
      },
      ["BLACK SUN VIGO"] = {
        name = "Black Sun Vigo",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718200/725F66281B4596ACF010C38A1E37D169B597D56C/",
        size = "small",
        type = "Trooper",
        points = 50,
        speed = 2,
        upgrades = {
          Command = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143763/E93BA6716A05CA95AE2EA3B7C0DFD8AF145D5C22/",
          },        
        },
        rank = "Commander",
        faction = "ShadowCollective",
      },
      ["PYKE SYNDICATE CAPO"] = {
        name = "Pyke Syndicate Capo",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718883/40D17DA044960A4A34979FBDEAE9296EB1E50346/",
        size = "small",
        type = "Trooper",
        points = 48,
        speed = 2,
        upgrades = {
          Command = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420351237/706DEA645FEE2EC9787F05F4FF2926632E2C4894/",
          },        
        },
        rank = "Commander",
        faction = "ShadowCollective",
      },
      ["MAUL A RIVAL"] = {
        name = "Maul",
        title = "A Rival",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718510/46475D968DFF923C51695A46BB5A652D2194E600/",
        size = "small",
        type = "Trooper",
        points = 170,
        speed = 2,
        upgrades = {
          Force = 2,
          Command = 1,
          Training = 1,
          Armament = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1789640371719014130/7A59CCE5B8A8C87DD3952C15819FAA8921708A75/",
          },        
        },
        commands = {
          {
            name = "Witch Magick",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139732571/7409767511212BC5F60C749EED79FBE45BED8DF2/",
            pip = 1,
          },
          {
            name = "His Eminence",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139727459/C8F9934D8CB1396F2F88743AE2F39A8EFADA20F8/",
            pip = 2,
          },
          {
            name = "Seize What Power We Can",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139729567/6F123B5506E6F0DC1F04907A2C5285AF180DFD97/",
            pip = 3,
          },
          {
            name = "Duel of the Fates",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139727558/BA0C0A83F63DD13EC3A4CC073071CA2DB1BEA27E/",
            pip = 1,
          },
          {
            name = "The Phantom Menace",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139729626/683EBFF15A3FBAC43A1DE8EF508DE05ACFEBE1D1/",
            pip = 2,
          },
          {
            name = "At Last",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139727404/5C2C80FCCF13A12AB56614E633960DAC3648BCC3/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "ShadowCollective",
      },
      ["CAD BANE NEEDS NO INTRODUCTION"] = {
        name = "Cad Bane",
        title = "Needs No Introduction",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137007196/49655B5A32FFAB3CE31BFCCFEA9811CD4A51B748/",
        size = "small",
        type = "Trooper",
        points = 105,
        speed = 2,
        upgrades = {
          Training = 2,
          Comms = 1,
          Gear = 1,
          Armament = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/1003681674396400482/F8900CFC9EF2309C9F54AE33AE5444B2B09DB1CD/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/1003681674396400696/907F4310FEA7A7CD89EE64A1AF3A8CC77897CCAC/",
          },        
        },
        commands = {
          {
            name = "I'm Your Worst Nightmare",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137014543/33FE8591FAFD29F8BEAF13D64851772A7FD794FE/",
            pip = 1,
          },
          {
            name = "I'm In Control",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137014579/D2FC7AF724D1C7527CCDDABF18517E9CB99DF061/",
            pip = 2,
          },
          {
            name = "I Make The Rules Now",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137014560/4B6E8AF4CB10FFE7EC529D204390FC45291FC962/",
            pip = 3,
          },        
        },
        additionalObjects = {
          "Bane Token: Blank",
          "Bane Token: Bomb",
          "Bane Token: Bane",
          "Victory Token",        
        },
        rank = "Operative",
        faction = "ShadowCollective",
      },
      ["BOSSK TRANDOSHAN TERROR"] = {
        name = "Bossk",
        title = "Trandoshan Terror",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137006564/2C7F90FF127392A78F71B82EF4E69C35973824AD/",
        size = "small",
        type = "Trooper",
        points = 105,
        speed = 2,
        upgrades = {
          Training = 2,
          Gear = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/948474323838791181/6B9D77B77DF8FD7AFA19342AD687F0E15A2E21B7/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/948474323838791276/ABFCDD8C71D484E6B6050080BB80B79D0DE93178/",
          },        
        },
        commands = {
          {
            name = "Merciless Munitions",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137013809/1D7FCC2F2A12F6B09B07345330F840800A846F7C/",
            pip = 1,
          },
          {
            name = "Reptilian Rampage",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137013972/29F197704D74AF20E8954F2BE8AC5C9203F9A2E6/",
            pip = 2,
          },
          {
            name = "Lying In Wait",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137013903/60F4AC014F68998F8A3587BA0A5389301A0BAA7C/",
            pip = 3,
          },        
        },
        additionalObjects = {
          "Proton Charge Token",
          "Victory Token",        
        },
        rank = "Operative",
        faction = "ShadowCollective",
      },
      ["PYKE SYNDICATE FOOT SOLDIERS"] = {
        name = "Pyke Syndicate Foot Soldiers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718821/EBC76B7A94A5F3C03B036C17E3C26E0319F1C6EB/",
        size = "small",
        type = "Trooper",
        points = 44,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845548/FD104F41509A53EA1C888862A3C5F0B98F609F1F/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845646/BE0DEED782F96BD44C389DEDEA41EBEA0C7A6D04/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845697/15B6DCCA8D8D76E1CB78219C58790E40DDD7CE8A/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845389/0D7DFE0C5BF5CDD527A619B75A25A2177D417BD0/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },        
        },
        rank = "Corps",
        faction = "ShadowCollective",
      },
      ["BLACK SUN ENFORCERS"] = {
        name = "Black Sun Enforcers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718139/222491782E56EAECE8B93E78E946F308211DC049/",
        size = "small",
        type = "Trooper",
        points = 50,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845475/01738B0D52E2D9C2870D6E33A2D05ECD12201C85/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143724/48B5A35E10B4977E255D889A8FCAEA8C980A11A9/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143328/3D6F3C2E8DFB78B9B748FFC8F339B9C568D7408E/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143724/48B5A35E10B4977E255D889A8FCAEA8C980A11A9/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143328/3D6F3C2E8DFB78B9B748FFC8F339B9C568D7408E/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143724/48B5A35E10B4977E255D889A8FCAEA8C980A11A9/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143328/3D6F3C2E8DFB78B9B748FFC8F339B9C568D7408E/",
          },        
        },
        rank = "Corps",
        faction = "ShadowCollective",
      },
      ["MANDALORIAN SUPER COMMANDOS"] = {
        name = "Mandalorian Super Commandos",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139720568/C0F87A2E12C8AE493654F7F4E9F71E16D3FA8BEB/",
        size = "small",
        type = "Trooper",
        points = 70,
        speed = 3,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 1,
          Comms = 1,
          Gear = 1,
          Armament = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143408/F4A88228E11334545EACA86B36E6B2008E76B0D3/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1789640371717200769/60353F40BAE6D92D6F6ED24E2883EB9CC2EA74C4/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143500/4BDEA7F5B523FC06641B3D71D1E112DC14BD7F81/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1789640371717200823/B886D3157AA2F2528F4E5F76F26DF44A41496615/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143285/F206D67AFF9379B68AD0795767DA378CE80D44AE/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1789640371717200823/B886D3157AA2F2528F4E5F76F26DF44A41496615/",
          },        
        },
        rank = "Special Forces",
        faction = "ShadowCollective",
      },
      ["SWOOP BIKE RIDERS"] = {
        name = "Swoop Bike Riders",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139721420/2BD490189FBB2AF2C7D6AA12EFA6EAA643EA2002/",
        size = "medium",
        type = "Repulsor Vehicle",
        points = 65,
        speed = 3,
        upgrades = {
          Comms = 1,        
        },
        silhouette = {
          height = 1.891,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1924743543116067434/0A068914BDD35AE6F63D7E29EBC7E0B5F712DA1F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1924743543116067490/87719312BE33C493B97B0915DB8C89FDC57D3F38/",
          },        
        },
        rank = "Support",
        faction = "ShadowCollective",
      },
      ["A-A5 SPEEDER TRUCK"] = {
        name = "A-A5 Speeder Truck",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139723206/223C60DDB2052576AE1CF777BE23675AA0FF8F2E/",
        size = "long",
        type = "Repulsor Vehicle",
        points = 65,
        speed = 1,
        upgrades = {
          Crew = 2,
          Pilot = 1,
          Hardpoint = 1,
          Comms = 1,        
        },
        silhouette = {
          height = 3.591,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1802024425338475527/29D3660FA84E5B9F804B840C18E68F5631EE6462/",
          },        
        },
        rank = "Heavy",
        faction = "ShadowCollective",
      },
    },
  },
  upgrades = {
    ["\"BOUNTY\" PROGRAMMING"] = {
      name = "\"Bounty\" Programming",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148639304/9F41559BA60B2818CC2EEF4A560273B136B987D0/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "IG-11",          
          },        
        },      
      },
      type = "Programming",
    },
    ["\"BUNKER BUSTER\" SHELLS"] = {
      name = "\"Bunker Buster\" Shells",
      image = "https://steamusercontent-a.akamaihd.net/ugc/9396219603588818774/E619EEF276816268108D1338C25AD01D6B6B7D5D/",
      points = 12,
      type = "Ordnance",
    },
    ["\"NANNY\" PROGRAMMING"] = {
      name = "\"Nanny\" Programming",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638679/4804577A9E8C3C865E84CEECED87D0E1E113316E/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "IG-11",          
          },
          faction = {
            "Rebel",          
          },        
        },      
      },
      type = "Programming",
    },
    ["2-1B MEDICAL DROID"] = {
      name = "2-1B Medical Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140081057/7B8C4C39468574A77EFF23E38A393B7E65D48867/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/949599512594268997/6248E4CAF3E978154106E7095E6984DCE6677CCA/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/949599512594282950/7A9A3E5518394273A507A64CCF7425A2E7EFC29B/",      
      },
      points = 18,
      restrictions = {
        include = {
          faction = {
            "Rebel",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["327TH STAR CORPS ELITE ARMOR PILOTS"] = {
      name = "327th Star Corps Elite Armor Pilots",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384854716/A1F69A11B6BDCD7BA7991C9A7BE8773855CFA20C/",
      points = 8,
      restrictions = {
        include = {
          unit = {
            "Infantry Support Platform",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["88I TWIN LIGHT BLASTER"] = {
      name = "88i Twin Light Blaster",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148691925/3E5BD15301BBACDB13D110B2284E17980F052601/",
      points = 10,
      restrictions = {
        include = {
          unit = {
            "AT-ST",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["A-180 PISTOL CONFIG"] = {
      name = "A-180 Pistol Config",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568137779/795B34FF0E53DA5355EA7952A034C6A4CFD003D0/",
      type = "Armament",
      points = 0,
      restrictions = {
        include = {
          unit = {
            "Jyn Erso",          
          },        
        },      
      },
      mini = undefined,
      flip = {
        name = "A-180 Rifle Config",
        image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568137807/208481F3DC8BE18ED10D2A17F12F35869213235C/",      
      },
    },
    ["A-180 RIFLE CONFIG"] = {
      name = "A-180 Rifle Config",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568137807/208481F3DC8BE18ED10D2A17F12F35869213235C/",
      flip = {
        name = "A-180 Pistol Config",
        image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568137779/795B34FF0E53DA5355EA7952A034C6A4CFD003D0/",      
      },
      points = 0,
      restrictions = {
        include = {
          unit = {
            "Jyn Erso",          
          },        
        },      
      },
      type = "Armament",
    },
    ["A-300 LONG RANGE CONFIG"] = {
      name = "A-300 Long Range Config",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568137867/156C35C00A49AC23AE84E5ACCF35ADD6D7CBD820/",
      flip = {
        name = "A-300 Short Range Config",
        image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568137938/8B2FA2C71505CA93AB086154658132C221BEBE1D/",      
      },
      points = 0,
      restrictions = {
        include = {
          unit = {
            "Rebel Pathfinders",          
          },        
        },      
      },
      type = "Armament",
    },
    ["A-300 RIFLE GUNNER"] = {
      name = "A-300 Rifle Gunner",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140081194/2DC1EEA962453DA3D345451038A56B1A9E6219E7/",
      points = 1,
      restrictions = {
        include = {
          unit = {
            "X-34 Landspeeder",          
          },        
        },      
      },
      type = "Crew",
    },
    ["A-300 SHORT RANGE CONFIG"] = {
      name = "A-300 Short Range Config",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568137938/8B2FA2C71505CA93AB086154658132C221BEBE1D/",
      type = "Armament",
      points = 0,
      restrictions = {
        include = {
          unit = {
            "Rebel Pathfinders",          
          },        
        },      
      },
      mini = undefined,
      flip = {
        name = "A-300 Long Range Config",
        image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568137867/156C35C00A49AC23AE84E5ACCF35ADD6D7CBD820/",      
      },
    },
    ["A280, PISTOL CONFIG"] = {
      name = "A280, Pistol Config",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140081077/A5B040BCD34352C6E5375640DE539E526067DBFE/",
      type = "Armament",
      points = 0,
      restrictions = {
        include = {
          unit = {
            "Cassian Andor",          
          },        
        },      
      },
      mini = undefined,
      flip = {
        name = "A280, Rifle Config",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140081159/19C93D73F4F86E9D7531E2CD784F5492772ED28F/",      
      },
    },
    ["A280, RIFLE CONFIG"] = {
      name = "A280, Rifle Config",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140081159/19C93D73F4F86E9D7531E2CD784F5492772ED28F/",
      flip = {
        name = "A280, Pistol Config",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140081077/A5B040BCD34352C6E5375640DE539E526067DBFE/",      
      },
      points = 0,
      restrictions = {
        include = {
          unit = {
            "Cassian Andor",          
          },        
        },      
      },
      type = "Armament",
    },
    ["AG-2G QUAD LASER"] = {
      name = "AG-2G Quad Laser",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148639560/6A39AE6CE8A42E8B04D4C5F128F5386A7DBF6CA8/",
      points = 28,
      restrictions = {
        include = {
          unit = {
            "A-A5 Speeder Truck",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["ARF TROOPER DUO"] = {
      name = "ARF Trooper Duo",
      image = "https://steamusercontent-a.akamaihd.net/ugc/16167615007606416168/E2F191BF04EE9A6AD8B59DFCC57739F95C3A5A12/",
      minis = {
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/16428815149932608/94AB8C15D97E81FF8040E81BC91F79A7105FF4B4/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/16428815149932637/F5D29AC3162A9D47B5440E5A3E3399FC12A594BE/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/16428815149932871/EE8DF333D45ED841E9C31625FB4A9385C16B2F49/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/16428815149933386/736E0CCF2ADE31D6A9F6BE172B20AEB5420B815E/",
        },      
      },
      points = 26,
      restrictions = {
        include = {
          unit = {
            "ARF Troopers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["AT-RT FLAMETHROWER"] = {
      name = "AT-RT Flamethrower",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140081769/07D4C1667BDEE090F39484775AEE7210086485B3/",
      points = 15,
      restrictions = {
        include = {
          unit = {
            "AT-RT",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["AT-RT LASER CANNON"] = {
      name = "AT-RT Laser Cannon",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140081788/A032FAAFF3DB96A0423D0691209C65FFCC272D32/",
      points = 10,
      restrictions = {
        include = {
          unit = {
            "AT-RT",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["AT-RT ROTARY BLASTER"] = {
      name = "AT-RT Rotary Blaster",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140081805/40CE85B06069C7ABA4D93C271976B49CD2ED57C1/",
      points = 20,
      restrictions = {
        include = {
          unit = {
            "AT-RT",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["AT-ST MORTAR LAUNCHER"] = {
      name = "AT-ST Mortar Launcher",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148692069/D79A2F7BF496B1EFCF593CB54F929F68B047A8F9/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "AT-ST",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["AX-108 \"GROUND BUZZER\""] = {
      name = "AX-108 \"Ground Buzzer\"",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140081842/2473F73E42DEF62BE49EA8789193A8AEDEECB097/",
      points = 10,
      restrictions = {
        include = {
          unit = {
            "T-47 Airspeeder",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["AAYLA SECURA"] = {
      name = "Aayla Secura",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13270315361837467006/57E535080404547F3055847340DF881544FE2E62/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "Saber-Class Tank",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["AGGRESSIVE TACTICS"] = {
      name = "Aggressive Tactics",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568138085/A9EF32E5D1F5E222B484A821ACDC6FED6EE5EDC3/",
      points = 15,
      type = "Command",
    },
    ["AHSOKA TANO, JEDI PADAWAN"] = {
      name = "Ahsoka Tano, Jedi Padawan",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59217531459831255/8A122988056B15729D1EBAB3F459B8AF5AA13113/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/16432616714054298/93B766A9FA311E199C2FCAF5BA29137B4FA12A9F/",      
      },
      points = 35,
      leader = true,
      restrictions = {
        include = {
          faction = {
            "Republic",          
          },        
        },      
      },
      type = "Squad Leader",
    },
    ["ANGER"] = {
      name = "Anger",
      image = "https://steamusercontent-a.akamaihd.net/ugc/15480929961350237792/459C25A6310A790CCD57B24B19BCEF4AC8A0F4AB/",
      points = 3,
      restrictions = {
        include = {
          alignment = {
            "Dark",          
          },        
        },      
      },
      type = "Force",
    },
    ["ARMOR-PIERCING SHELLS"] = {
      name = "Armor-Piercing Shells",
      image = "https://steamusercontent-a.akamaihd.net/ugc/9408502186349462134/5D735A7FAB7ECC984A0D591167B24FF02CE4133E/",
      points = 10,
      type = "Ordnance",
    },
    ["ASCENSION CABLES"] = {
      name = "Ascension Cables",
      image = "https://steamusercontent-a.akamaihd.net/ugc/17457507251375076663/CDA2350510DE5988DF0E4A5BF8929A2E75E3A498/",
      points = 4,
      type = "Gear",
    },
    ["ASTROMECH"] = {
      name = "Astromech",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140081721/9FBE2EBFF8A54C66DAC860A08E68AF4D108A09A2/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/2508033889680571476/57CF310CEE5CCDFE2F0769BE7BAF97A6A4104035/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/2508033889680571745/E93CBD4D8EBD90588639BCA658F36E208A58E465/",      
      },
      points = 9,
      restrictions = {
        include = {
          unit = {
            "Rebel Sleeper Cell",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["ASTROMECH DROID"] = {
      name = "Astromech Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140081288/0419F2D2F5D687DC9B927FE7C39AF89D52FD4ABD/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/949599512594428341/4AC5A309D701979A4B3E94725BC1E8745C598BCE/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/949599512594267684/F84F03E4A52F50EF5255A464FF85083CF4FB3D26/",      
      },
      points = 8,
      restrictions = {
        include = {
          faction = {
            "Rebel",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["ATTACK PROTOCOLS"] = {
      name = "Attack Protocols",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10231463032862954270/5569EEFD92CA844450DCFDF7BC652B4DDC055DD5/",
      points = 8,
      restrictions = {
        include = {
          type = {
            "Vehicle",          
          },        
        },      
      },
      type = "Programming",
    },
    ["AXE EWOK"] = {
      name = "Axe Ewok",
      image = "https://steamusercontent-a.akamaihd.net/ugc/9885217524913261667/1618CC576AAF98E0DA209802203DD03717CED738/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128895/152E8A0BE0A0FB98FAD48338552C6282DD8954B7/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",      
      },
      points = 15,
      restrictions = {
        include = {
          unit = {
            "Ewok Skirmishers",
            "Ewok Slingers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["B1 BATTLE DROID"] = {
      name = "B1 Battle Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139926619/12E85E2D56E590D6D718B15BDE100799D6F9D077/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780869167318/DBC7863706A08B96020D3BFBE7A0C2C5689B7B08/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166919/FE5AD3A71430C729735E3FF7023D9E546E12FEF1/",      
      },
      points = 4,
      restrictions = {
        include = {
          unit = {
            "B1 Battle Droids",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["B1 BATTLE DROID SQUAD"] = {
      name = "B1 Battle Droid Squad",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139926468/DB7AB15E9634E1EE003C27E65E33A67D9F2876CC/",
      minis = {
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780869167061/48F42C02EDD970E6DE8E59B8601EF3E7F11C1742/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166919/FE5AD3A71430C729735E3FF7023D9E546E12FEF1/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780869167318/DBC7863706A08B96020D3BFBE7A0C2C5689B7B08/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166919/FE5AD3A71430C729735E3FF7023D9E546E12FEF1/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166660/36AF6887F11FC70FF6AB75D0434EA79952C9E882/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166919/FE5AD3A71430C729735E3FF7023D9E546E12FEF1/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780869167194/9ADFFD9AD608CBE3E9F6F61AB416E699A4156109/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166919/FE5AD3A71430C729735E3FF7023D9E546E12FEF1/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780869167318/DBC7863706A08B96020D3BFBE7A0C2C5689B7B08/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166919/FE5AD3A71430C729735E3FF7023D9E546E12FEF1/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166660/36AF6887F11FC70FF6AB75D0434EA79952C9E882/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166919/FE5AD3A71430C729735E3FF7023D9E546E12FEF1/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780869167194/9ADFFD9AD608CBE3E9F6F61AB416E699A4156109/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166919/FE5AD3A71430C729735E3FF7023D9E546E12FEF1/",
        },      
      },
      points = 38,
      restrictions = {
        include = {
          unit = {
            "B1 Battle Droids",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["B1 SECURITY DROID"] = {
      name = "B1 Security Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139926745/A596D5C24CC8AFBA36C85A7307BFF2985BFCA2F5/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/766102173467517125/1BEF7A7795DF3F6DB91B84C1C82D8FBB24BF574B/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/766102173467517405/DC3A7F38CF3839B7C5F2FCCE85745041094ADA81/",      
      },
      points = 6,
      restrictions = {
        include = {
          unit = {
            "B1 Battle Droids",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["B2 SUPER BATTLE DROID"] = {
      name = "B2 Super Battle Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139926862/55D56B7AA8FC3FDC335499AC5DA66CD5A8DE3620/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/775105953849586324/B5D59E535AFA2BF99FCA3C584E28FA500ADB89BD/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/775105953849585789/91A639AB9F57BE393683DA53212E395886307C52/",      
      },
      points = 13,
      restrictions = {
        include = {
          unit = {
            "B2 Super Battle Droids",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["B2 SUPER BATTLE DROID SQUAD"] = {
      name = "B2 Super Battle Droid Squad",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139926806/AE2E14125DB171D14F95D09EB4D7530A1A22E2BA/",
      minis = {
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/775105953849586430/E5941CF7A3631E6D4A28832AE489A4340C96B0B9/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/775105953849585789/91A639AB9F57BE393683DA53212E395886307C52/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/775105953849586226/9326AD8D3EC80CC53F4BF2D156014978DCD715D9/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/775105953849585789/91A639AB9F57BE393683DA53212E395886307C52/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/775105953849586430/E5941CF7A3631E6D4A28832AE489A4340C96B0B9/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/775105953849585789/91A639AB9F57BE393683DA53212E395886307C52/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/775105953849586226/9326AD8D3EC80CC53F4BF2D156014978DCD715D9/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/775105953849585789/91A639AB9F57BE393683DA53212E395886307C52/",
        },      
      },
      points = 77,
      restrictions = {
        include = {
          unit = {
            "B2 Super Battle Droids",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["B2-ACM BATTLE DROID"] = {
      name = "B2-ACM Battle Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139926955/7598527939653076FB60A126D883BC9FCEFDD38C/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/775105953849585917/4D4047069796D1E0567BE9ABD836984FDF12E80E/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/775105953849585789/91A639AB9F57BE393683DA53212E395886307C52/",      
      },
      points = 24,
      restrictions = {
        include = {
          unit = {
            "B2 Super Battle Droids",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["B2-HA BATTLE DROID"] = {
      name = "B2-HA Battle Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139927358/329BE3BD01363997AED00F270306F36F9DD1C8C9/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/775105953849585631/7FF051E2079AB28A4FB77CCC739BCEB42F4CCFAA/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/775105953849585789/91A639AB9F57BE393683DA53212E395886307C52/",      
      },
      points = 32,
      restrictions = {
        include = {
          unit = {
            "B2 Super Battle Droids",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["BARC ION GUNNER"] = {
      name = "BARC Ion Gunner",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384855148/0ECDF8377C56E992005C396741BAA9CE7986222B/",
      points = 24,
      restrictions = {
        include = {
          unit = {
            "BARC Speeder",          
          },        
        },      
      },
      type = "Crew",
    },
    ["BARC RPS-6 GUNNER"] = {
      name = "BARC RPS-6 Gunner",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140038100/7C11EBB315EC571301B50C93DFD2004930FB5A91/",
      points = 21,
      restrictions = {
        include = {
          unit = {
            "BARC Speeder",          
          },        
        },      
      },
      type = "Crew",
    },
    ["BARC TWIN LASER GUNNER"] = {
      name = "BARC Twin Laser Gunner",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140038185/13E6A7A923E183A77BFC9704B86D6A36BD5921AD/",
      points = 18,
      restrictions = {
        include = {
          unit = {
            "BARC Speeder",          
          },        
        },      
      },
      type = "Crew",
    },
    ["BX DEFLECTOR SHIELDS"] = {
      name = "BX Deflector Shields",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139927385/CD3E586656B39D35246C84BAFD6ADB12B665E5E5/",
      points = 18,
      restrictions = {
        include = {
          unit = {
            "BX-Series Droid Commandos",          
          },        
        },      
      },
      type = "Armament",
    },
    ["BX VIBROSWORDS"] = {
      name = "BX Vibroswords",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139927392/0B4491CA615FAA34F7EFEDCE08BAD5A06571BE90/",
      points = 6,
      restrictions = {
        include = {
          unit = {
            "BX-Series Droid Commandos",          
          },        
        },      
      },
      type = "Armament",
    },
    ["BX-SERIES DROID SNIPER"] = {
      name = "BX-Series Droid Sniper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139927410/552314F29830D4A8A63F5B8238699336F17ECD92/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1009315641457847963/0EA6BE014DA494689FF32F9570C6A73CD88F1894/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/773995528924546789/8774CBBDC3C4F18B11A444CC96EA5FE7F00DB48F/",      
      },
      points = 40,
      restrictions = {
        include = {
          unit = {
            "BX-Series Droid Commandos",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["BACKWORLD MEDIC"] = {
      name = "Backworld Medic",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148639527/67E63647F6AA6084064CE8960AE4DD49094F213E/",
      points = 12,
      restrictions = {
        include = {
          unit = {
            "A-A5 Speeder Truck",          
          },        
        },      
      },
      type = "Crew",
    },
    ["BARON RUDOR"] = {
      name = "Baron Rudor",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148690870/A59A9EC3A2ED826D0BBE1CC6B2573483C238EB2E/",
      points = 8,
      restrictions = {
        include = {
          faction = {
            "Empire",          
          },
          type = {
            "Repulsor Vehicle",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["BARRAGE GENERATOR"] = {
      name = "Barrage Generator",
      image = "https://steamusercontent-a.akamaihd.net/ugc/12495820504141574252/66E55B65B1BC1B339B432F04AD0D130DFBC8D1BE/",
      points = 3,
      type = "Generator",
    },
    ["BATTLE MEDITATION"] = {
      name = "Battle Meditation",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568138926/6CA76E020914829864896AC19CB9532DDED05558/",
      points = 5,
      type = "Force",
    },
    ["BATTLE SHIELD WOOKIEE (DEFENSIVE)"] = {
      name = "Battle Shield Wookiee (Defensive)",
      displayName = "Shield Wookiee (Defensive)",
      image = "https://steamusercontent-a.akamaihd.net/ugc/12854197019477585426/9DCA829B612203A963C6A0C1B9B4CF1896D7CD1C/",
      type = "Heavy Weapon",
      points = 26,
      restrictions = {
        include = {
          unit = {
            "Wookiee Warriors",          
          },        
        },      
      },
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1621849308236386933/DCD62751F06157E85CE575C8BB1CCF86379BB7DE/",      
      },
      flip = {
        name = "Battle Shield Wookiee (Offensive)",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140084858/2608BF39F19557F71C8FF8D04314A0387DB7586C/",      
      },
    },
    ["BATTLE SHIELD WOOKIEE (OFFENSIVE)"] = {
      name = "Battle Shield Wookiee (Offensive)",
      displayName = "Shield Wookiee (Offensive)",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140084858/2608BF39F19557F71C8FF8D04314A0387DB7586C/",
      flip = {
        name = "Battle Shield Wookiee (Defensive)",
        displayName = "Shield Wookiee (Defensive)",
        image = "https://steamusercontent-a.akamaihd.net/ugc/12854197019477585426/9DCA829B612203A963C6A0C1B9B4CF1896D7CD1C/",      
      },
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1621849308236386933/DCD62751F06157E85CE575C8BB1CCF86379BB7DE/",      
      },
      points = 26,
      restrictions = {
        include = {
          unit = {
            "Wookiee Warriors",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["BEAM TURRET"] = {
      name = "Beam Turret",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135344116/6FA72AE219A115A5BA50033ECAF85464EE12FCA8/",
      points = 15,
      restrictions = {
        include = {
          unit = {
            "Saber-Class Tank",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["BESKAD DUELIST"] = {
      name = "Beskad Duelist",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140084887/6AE6E148D79D03A2A4C1B9B8D22DC0B9816222E0/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809252570/7F009B812ED06B7E45CFCE48142293A4B9C77991/",      
      },
      points = 24,
      restrictions = {
        include = {
          unit = {
            "Mandalorian Resistance",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["BESKAR SPEAR"] = {
      name = "Beskar Spear",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148639488/EDE8AA68D0589BFB956D68E2A08B31715C5F9D61/",
      points = 15,
      restrictions = {
        include = {
          unit = {
            "Din Djarin",          
          },        
        },      
      },
      type = "Armament",
    },
    ["BISTAN"] = {
      name = "Bistan",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384855202/3D20A35C96C91700E37106B18E3090FBE6C8E460/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/993513208355174951/467D917BF6BCABCC9F6DD17F5DEDB43A11DEA9A7/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/993513208355175183/AD143EC79EC2BA3E7B93B114CC8AFEAAD322D806/",      
      },
      points = 33,
      restrictions = {
        include = {
          unit = {
            "Rebel Pathfinders",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["BLACK SUN ENFORCER"] = {
      name = "Black Sun Enforcer",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148639440/31A3527F3D9D8579BDBD433D5F30F1EF973A47C8/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143724/48B5A35E10B4977E255D889A8FCAEA8C980A11A9/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143328/3D6F3C2E8DFB78B9B748FFC8F339B9C568D7408E/",      
      },
      points = 11,
      restrictions = {
        include = {
          unit = {
            "Black Sun Enforcers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["BLACK SUN VIGO"] = {
      name = "Black Sun Vigo",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148639389/E73718337CFAD8FD65CD341B6CF649BA181707AD/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143763/E93BA6716A05CA95AE2EA3B7C0DFD8AF145D5C22/",      
      },
      leader = true,
      points = 20,
      restrictions = {
        include = {
          unit = {
            "Black Sun Enforcers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["BOBA'S FLAME PROJECTOR"] = {
      name = "Boba's Flame Projector",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148639345/522E39430567071F6AB7C73BCC5C8270B3652384/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "Boba Fett",          
          },        
        },      
      },
      type = "Gear",
    },
    ["BOIL"] = {
      name = "Boil",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384855244/C0B4D4133262EB7AAA1DD3133545D5D4257ACE29/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446813135454/32F343B3295B563DF3041AF5F433E151F88C66B6/",      
      },
      leader = true,
      points = 15,
      restrictions = {
        include = {
          type = {
            "Clone Trooper",          
          },
          rank = {
            "Corps",          
          },        
        },      
      },
      type = "Squad Leader",
    },
    ["BOWCASTER WOOKIEE"] = {
      name = "Bowcaster Wookiee",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140084912/2AFB89610DC5DFDB593DC830F48E76682A5B78FA/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541174665/9E1AA98159F76E271185345E9D347D7453C05D4B/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541174034/90C4A124BB82CCE0B5E38E13860ED49BB9A4973B/",      
      },
      points = 31,
      restrictions = {
        include = {
          unit = {
            "Wookiee Warriors",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["BURST OF SPEED"] = {
      name = "Burst Of Speed",
      image = "https://steamusercontent-a.akamaihd.net/ugc/14427447140841744055/38C9A267DCB2BBD3F385EB1FBDA2A4D12687CC66/",
      points = 10,
      type = "Force",
    },
    ["C-3PO"] = {
      name = "C-3PO",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134141499/36DA30FD99788C7127DCADE11325FDBC09B16747/",
      points = 15,
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/776232727456807069/DE7E32B39455DB5111769436FD0C5BFDA3841268/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/777357228032306506/D60CB8A1159723917EF1831D4042318A67458A7A/",      
      },
      restrictions = {
        include = {
          unit = {
            "R2-D2",          
          },        
        },      
      },
      type = "Counterpart",
    },
    ["C-3PO HUMAN CYBORG RELATIONS"] = {
      name = "C-3PO Human Cyborg Relations",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134141499/36DA30FD99788C7127DCADE11325FDBC09B16747/",
      points = 15,
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/776232727456807069/DE7E32B39455DB5111769436FD0C5BFDA3841268/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/777357228032306506/D60CB8A1159723917EF1831D4042318A67458A7A/",      
      },
      restrictions = {
        include = {
          unit = {
            "R2-D2",          
          },        
        },      
      },
      type = "Counterpart",
    },
    ["C-3PO HUMAN CYBORG RELATIONS (GAR)"] = {
      name = "C-3PO Human Cyborg Relations (GAR)",
      image = "https://steamusercontent-a.akamaihd.net/ugc/11238494832346367985/1AAEB9F5359ADB9FA1C75D43A7F7FA087D5CD961/",
      points = 15,
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/776232727456807069/DE7E32B39455DB5111769436FD0C5BFDA3841268/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/777357228032306506/D60CB8A1159723917EF1831D4042318A67458A7A/",      
      },
      restrictions = {
        include = {
          unit = {
            "R2-D2",          
          },        
        },      
      },
      type = "Counterpart",
    },
    ["CM-0/93 TROOPER"] = {
      name = "CM-0/93 Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140084937/CFB33EA9EA5EECBC2AC894C172C560BEB13B6EAA/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687947/DCC60167A78C152DDAE932E699D7C70C5629008B/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192135/526538CE10AC6856578996BE6B8AB7263D32D5C7/",      
      },
      points = 26,
      restrictions = {
        include = {
          unit = {
            "Rebel Veterans",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["CR-24 FLAME RIFLE"] = {
      name = "CR-24 Flame Rifle",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140106922/DC1ED64816ECD4A7AB128F05D70EF97408305AAF/",
      points = 10,
      restrictions = {
        include = {
          unit = {
            "Dewback Rider",          
          },        
        },      
      },
      type = "Armament",
    },
    ["CALL TO ARMS"] = {
      name = "Call to Arms",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140099258/36B8495C43AD6C6CA175204A01096A05D647F70C/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "Ewok Slingers",
            "Ewok Skirmishers",          
          },        
        },      
      },
      type = "Training",
    },
    ["CLAIRVOYANCE"] = {
      name = "Clairvoyance",
      image = "https://steamusercontent-a.akamaihd.net/ugc/17229509976995559718/02821314DBA25F4938A6E51ED6F1BF2F79993A49/",
      points = 10,
      type = "Force",
    },
    ["CLONE CAPTAIN"] = {
      name = "Clone Captain",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384855290/1D4BC397E7FC6FD99DFE4A8B2B3799AB2CDDBC3D/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/767228764785646423/F890985F1B31042E0BC10996930089A3A22BE5C5/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/767228764785647603/8F9ADBD1429C1AF247858C877548E15E5996F4A9/",      
      },
      leader = true,
      points = 22,
      restrictions = {
        include = {
          unit = {
            "Clone Trooper Infantry",          
          },        
        },      
      },
      type = "Squad Leader",
    },
    ["CLONE COMMANDER"] = {
      name = "Clone Commander",
      image = "https://steamusercontent-a.akamaihd.net/ugc/16325670012605150200/01E77403F827CE48BBD0262024C39AEF2465B64A/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809186354/387C36C2BB545E6CC882A05C0D81F5BE164166B7/",      
      },
      leader = true,
      points = 18,
      restrictions = {
        include = {
          type = {
            "Clone Trooper",          
          },        
        },      
      },
      type = "Squad Leader",
    },
    ["CLONE COMMANDER FOX"] = {
      name = "Clone Commander Fox",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384855342/35C7734C8DE780B2B4691B2A3CEF5B54BAF1A3E5/",
      points = 10,
      restrictions = {
        include = {
          faction = {
            "Republic",          
          },
          unit = {
            "LAAT/LE Patrol Transport",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["CLONE COMMS TECHNICIAN"] = {
      name = "Clone Comms Technician",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384855468/B256FB44C0E0DF5D2B60342F59729EA6EEBB6083/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809184812/3A020CF4B5983E1AF55F65A3F8F7BDCBAAEAAACC/",      
      },
      points = 11,
      restrictions = {
        include = {
          type = {
            "Clone Trooper",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["CLONE ENGINEER"] = {
      name = "Clone Engineer",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384855564/E53C360CCC3830546485BC14F01E69A310BB0C52/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809184624/F2826DD52329584D1C3B3795B0E55948EA96B467/",      
      },
      points = 14,
      restrictions = {
        include = {
          type = {
            "Clone Trooper",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["CLONE MEDIC"] = {
      name = "Clone Medic",
      image = "https://steamusercontent-a.akamaihd.net/ugc/9547979006347114303/D43781CC9968425F51916493FAA615ACDE207B6B/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809184711/BC2EE95F62E043F83A352F825B6A041AC6D59959/",      
      },
      points = 20,
      restrictions = {
        include = {
          type = {
            "Clone Trooper",          
          },        
        },      
      },
      type = "Squad Leader",
    },
    ["CLONE SHOCK TROOPER PILOT"] = {
      name = "Clone Shock Trooper Pilot",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10111085862146477057/252EF202515CC108E593111B56718C2CD813870E/",
      points = 4,
      restrictions = {
        include = {
          faction = {
            "Republic",          
          },
          rank = {
            "Heavy",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["CLONE SPECIALIST"] = {
      name = "Clone Specialist",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384855831/107356D4CB0FDB6846C160FABB30EA9F11555849/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/767228764785643001/070425BBB2F0D33E71693679EEB72FEF790FE2F6/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393180/6359B491483DCD9B2641BA134DC4B92DE10E9D92/",      
      },
      points = 17,
      restrictions = {
        include = {
          unit = {
            "Clone Trooper Infantry",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["CLONE TROOPER INFANTRY"] = {
      name = "Clone Trooper Infantry",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384855969/DA00EC34480B2F8CB09BA1DC4DEF82042BEFC378/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785236717873394019/F7EDA9D80C35FADA3C000A88C8105823172123B8/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393180/6359B491483DCD9B2641BA134DC4B92DE10E9D92/",      
      },
      points = 13,
      restrictions = {
        include = {
          unit = {
            "Clone Trooper Infantry",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["CLONE TROOPER INFANTRY SQUAD"] = {
      name = "Clone Trooper Infantry Squad",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384855888/62C735B9B10A0BFC907D21AB6B29EF4F484F2DD3/",
      minis = {
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393589/6AF627688F36D2049C1307BCB67A755FB27D51C5/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393180/6359B491483DCD9B2641BA134DC4B92DE10E9D92/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393727/8C4030EF9FEEB32E048567DC2EC38A1985E7C8C0/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393180/6359B491483DCD9B2641BA134DC4B92DE10E9D92/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785236717873457225/6382F0EA6E2DB0BC65921C3F4E5C97A84B422187/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393180/6359B491483DCD9B2641BA134DC4B92DE10E9D92/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393727/8C4030EF9FEEB32E048567DC2EC38A1985E7C8C0/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393180/6359B491483DCD9B2641BA134DC4B92DE10E9D92/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393589/6AF627688F36D2049C1307BCB67A755FB27D51C5/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393180/6359B491483DCD9B2641BA134DC4B92DE10E9D92/",
        },      
      },
      points = 56,
      restrictions = {
        include = {
          unit = {
            "Clone Trooper Infantry",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["COMMAND CONTROL ARRAY"] = {
      name = "Command Control Array",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13152173042783439846/9068A2E707EA6AD6B201273F43B7A275E41ED1C0/",
      points = 2,
      restrictions = {
        include = {
          unit = {
            "Vehicle",          
          },        
        },      
      },
      type = "Comms",
    },
    ["COMMANDING PRESENCE"] = {
      name = "Commanding Presence",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568139512/84EE686E19B56453386F3929C01D0B71687488E4/",
      points = 5,
      type = "Command",
    },
    ["COMMS JAMMER"] = {
      name = "Comms Jammer",
      image = "https://steamusercontent-a.akamaihd.net/ugc/12840451931503255129/4E1CDC738ACDB452A4AE50E7358EDAA2C95E191F/",
      points = 5,
      type = "Comms",
    },
    ["COMMS RELAY"] = {
      name = "Comms Relay",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568139607/B139A1D9FCCEDFCF0751B6E96A6FE774C312AB26/",
      points = 5,
      restrictions = {
        exclude = {
          type = {
            "Emplacement Trooper",          
          },        
        },      
      },
      type = "Comms",
    },
    ["CONCUSSION GRENADES"] = {
      name = "Concussion Grenades",
      image = "https://steamusercontent-a.akamaihd.net/ugc/14360371654209496022/CE2625348FFF9EF0BB5DC55F43ADBBD742F3073B/",
      points = 3,
      type = "Grenades",
    },
    ["CROSSHAIR"] = {
      name = "Crosshair",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134145124/0F6E5EBD2C22692BF7E757F46293934D4552CA6A/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2475370743175244300/863B36B154CA2A32E4C36B9CFBC47984846ECE3C/",      
      },
      points = 0,
      restrictions = {
        include = {
          faction = {
            "Republic",          
          },
          unit = {
            "The Bad Batch",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["DC-15 CLONE TROOPER"] = {
      name = "DC-15 Clone Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568139741/18705CF14C8BD2D88CF1827FE171F64D919E03C6/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393393/915E79CA7D72B0DA950656C69F104A7BB586C0E0/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393180/6359B491483DCD9B2641BA134DC4B92DE10E9D92/",      
      },
      points = 24,
      restrictions = {
        include = {
          unit = {
            "Clone Trooper Infantry",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["DC-15X ARC TROOPER"] = {
      name = "DC-15X ARC Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/9724672671096889082/B22903B590FA5B6D2AAEC2988AA0F9826C9D1EB2/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1009315641457800878/34EC84D7ECD99E073417866A9BEC4288E00F5359/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/773995200348530664/5E248091F8CC37B1023257338D4947E4ADFE48AB/",      
      },
      points = 37,
      restrictions = {
        include = {
          unit = {
            "ARC Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["DC-17M ICWS CONFIG"] = {
      name = "DC-17m ICWS Config",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135386003/EB0729A53546B70CB9054BAF5306E3F5368FC9DF/",
      type = "Armament",
      points = 0,
      restrictions = {
        include = {
          unit = {
            "Clone Commandos",
            "Clone Commandos Delta Squad",          
          },        
        },      
      },
      mini = undefined,
      flip = {
        name = "DC-17m ICWS Config",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135385953/007D0426E485963714BCBE0B74B2B8AE5B7F1869/",      
      },
    },
    ["DC-17M ICWS CONFIG"] = {
      name = "DC-17m ICWS Config",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135385953/007D0426E485963714BCBE0B74B2B8AE5B7F1869/",
      flip = {
        name = "DC-17m ICWS Config",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135386003/EB0729A53546B70CB9054BAF5306E3F5368FC9DF/",      
      },
      points = 0,
      restrictions = {
        include = {
          unit = {
            "Clone Commandos",
            "Clone Commandos Delta Squad",          
          },        
        },      
      },
      type = "Armament",
    },
    ["DH-447 SNIPER"] = {
      name = "DH-447 Sniper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140084953/59EB5B5BADDFEACF7BA997C247F16A54080A6E31/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780862776611/B8222AA4A3B680E969DC106C8A281D11845994EB/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780862776974/21649563BC0CB84E12C0B249C720919F528596D3/",      
      },
      points = 38,
      restrictions = {
        include = {
          unit = {
            "Rebel Commandos",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["DLT-19 STORMTROOPER"] = {
      name = "DLT-19 Stormtrooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140097118/D6AB525C9958181EA70DE91A813AEB1CC758D896/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141001/FF62545FC3DEF499BA8A0C04F07917C6CAA9E30D/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141746/A8FD77EB51C50C64CD924BDAEEDB70D8839E0EF3/",      
      },
      points = 20,
      restrictions = {
        include = {
          unit = {
            "Stormtroopers",
            "Stormtroopers Heavy Response Unit",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["DLT-19D TROOPER"] = {
      name = "DLT-19D Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140102975/2A200DF9EF1BF00105CC7BA834090DB6E0C4EA12/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/770610077943650040/CDB9EFD9CB36DE0EB5AB78B22F2B334BDB1E6DFE/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/770610077942938053/6187B2D6848EC35010DE6C3EEBB5DF6125D02D45/",      
      },
      points = 30,
      restrictions = {
        include = {
          unit = {
            "Imperial Death Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["DLT-19X SNIPER"] = {
      name = "DLT-19X Sniper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140103101/607C9BEDEB2C3780F1AE58D72DEE649F941A7CAD/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/770610077943667377/92306C3BFB675310563691C3C582BF5B9FC9ACD4/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/770610077943667167/66F3188269E49FE5DAD649E771D799F2593263FF/",      
      },
      points = 28,
      restrictions = {
        include = {
          unit = {
            "Scout Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["DLT-20A RANGE TROOPER"] = {
      name = "DLT-20A Range Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148698292/C6A146809D4BE1EBF289B7217AA7995C4828A731/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682669844/3306C99E1B2A23502CA35EEB63FC842EA7FB4E3A/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682582649/F03C73249983DDC1178314FD61C7D53DA27840EE/",      
      },
      points = 25,
      restrictions = {
        include = {
          unit = {
            "Range Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["DLT-20A TROOPER"] = {
      name = "DLT-20A Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140084961/0EDA0871D597B44A55DBF3A3147E3A13D20691B2/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/766102173464888456/63604C016242E6F545F139BC46515E0A894EC6B2/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/766102173464889098/17A7BE90F158B80F88518F92EA4D211F16E14003/",      
      },
      points = 26,
      restrictions = {
        include = {
          unit = {
            "Rebel Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["DP-23 CLONE TROOPER"] = {
      name = "DP-23 Clone Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384856148/B3CE3E857FAEC52F4048EB9D1BA8935682D6B9D1/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/767228764785625549/5461468E09D086E4CF7E835AE69D6F4226690518/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/767228764785620873/E3B1226B0836CF579F16C490896D5E2DE95C31F5/",      
      },
      points = 22,
      restrictions = {
        include = {
          unit = {
            "Clone Trooper Infantry",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["DT-F16"] = {
      name = "DT-F16",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140103189/0A3AA902AA4ADB644B1D83840A96AB041EDE5849/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/993513208355174615/DD0DA9DFDBCA621CF297C9A9EB2356279A733158/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/951848302305474695/F076E77D0278B10EAE330BC9073B05BC9A3BCD57/",      
      },
      leader = true,
      points = 15,
      restrictions = {
        include = {
          unit = {
            "Imperial Death Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["DW-3 GRENADE LAUNCHER"] = {
      name = "DW-3 Grenade Launcher",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148690988/9E08D059DB9C6A383AFD15329511C04A96215DA1/",
      points = 8,
      restrictions = {
        include = {
          unit = {
            "AT-ST",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["DEFENSE PROTOCOLS"] = {
      name = "Defense Protocols",
      image = "https://steamusercontent-a.akamaihd.net/ugc/16109346406166037874/376653EF5683F1DBF5DCDFF7742530E1C357FBAA/",
      points = 8,
      restrictions = {
        include = {
          type = {
            "Vehicle",          
          },        
        },      
      },
      type = "Programming",
    },
    ["DEFENSIVE STANCE"] = {
      name = "Defensive Stance",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10394379497446642242/A484E8DE817DC612497E99A36F6D33FBA8E423C9/",
      flip = {
        name = "Offensive Stance",
        image = "https://steamusercontent-a.akamaihd.net/ugc/16537339389726247952/720B5E7A361CEEC36F674F1CF36298A5997DE2F5/",      
      },
      points = 5,
      restrictions = {
        include = {
          slot = {
            "Force",          
          },        
        },      
      },
      type = "Training",
    },
    ["DEL MEEKO"] = {
      name = "Del Meeko",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140102888/C41E1C0AEAE95F66AE9D450E0EA233B169E5C9EC/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1618437692581074585/1C74BEB92DC42D3585BFC1185A77DE14EC3249CA/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/1618438238123043414/B7E9660E470DC070545782406C29F1E1356A5685/",      
      },
      points = 25,
      restrictions = {
        include = {
          faction = {
            "Empire",          
          },
          unit = {
            "Imperial Special Forces",          
          },
          rank = {
            "Corps",          
          },        
        },
        exclude = {
          unit = {
            "Stormtroopers Heavy Response Unit",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["DEVELOPING SYMPATHIES"] = {
      name = "Developing Sympathies",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1616219505080628668/E7A23D34D591C5EF876B320534798142C0A460EE/",
      points = 0,
      type = "Flaw",
    },
    ["DIN'S AMBAN RIFLE"] = {
      name = "Din's Amban Rifle",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148639183/C2D75F184A5F66EA154C4DF44AADA7A9443A9468/",
      points = 10,
      restrictions = {
        include = {
          unit = {
            "Din Djarin",          
          },        
        },      
      },
      type = "Armament",
    },
    ["DIN'S FLAME PROJECTOR"] = {
      name = "Din's Flame Projector",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13750229648005754282/BBA7B66BB64E77DD6485518A99475DE0DC684BE8/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "Din Djarin",          
          },        
        },      
      },
      type = "Gear",
    },
    ["DIN'S JETPACK"] = {
      name = "Din's Jetpack",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148639132/7B4DCC45594881429C69D3D0AB70CEDF61F543B4/",
      points = 15,
      restrictions = {
        include = {
          unit = {
            "Din Djarin",          
          },        
        },      
      },
      type = "Gear",
    },
    ["DIOXIS MINE SABOTEUR"] = {
      name = "Dioxis Mine Saboteur",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139927460/BE9022FA696C172E68110895A9DDCDDD635E2AB3/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1009315641457847567/079157D001A1520085C6A30620750817C6C01BFF/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/773995528924546789/8774CBBDC3C4F18B11A444CC96EA5FE7F00DB48F/",      
      },
      points = 28,
      restrictions = {
        include = {
          unit = {
            "BX-Series Droid Commandos",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["DOOR GUNNERS"] = {
      name = "Door Gunners",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10380945357802391916/5D21C9620D0382828965E9FA8E1534BF067A4E7A/",
      points = 12,
      type = "Crew",
    },
    ["DUCK AND COVER"] = {
      name = "Duck And Cover",
      image = "https://steamusercontent-a.akamaihd.net/ugc/15529355718365557412/FFC51C64FA7773BCC25038D8D5D818D2AE5241BC/",
      points = 2,
      type = "Training",
    },
    ["DUG IN"] = {
      name = "Dug In",
      image = "https://steamusercontent-a.akamaihd.net/ugc/18249790041400631546/5B8E5A40CBC42DE4BE8A26F1576E8F8AD4690C12/",
      points = 6,
      type = "Training",
    },
    ["E-11D FOCUSED FIRE CONFIG"] = {
      name = "E-11D Focused Fire Config",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140103278/AC9A32D518E9E70AF6ABBA41F7E10DF58DADFF20/",
      flip = {
        name = "E-11D Grenade Launcher Config",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140103366/FB39C5636706702276566978A5EDD34907C1D8DB/",      
      },
      points = 0,
      restrictions = {
        include = {
          unit = {
            "Imperial Death Troopers",          
          },        
        },      
      },
      type = "Armament",
    },
    ["E-11D GRENADE LAUNCHER CONFIG"] = {
      name = "E-11D Grenade Launcher Config",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140103366/FB39C5636706702276566978A5EDD34907C1D8DB/",
      type = "Armament",
      points = 0,
      restrictions = {
        include = {
          unit = {
            "Imperial Death Troopers",          
          },        
        },      
      },
      mini = undefined,
      flip = {
        name = "E-11D Focused Fire Config",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140103278/AC9A32D518E9E70AF6ABBA41F7E10DF58DADFF20/",      
      },
    },
    ["E-5C B1 BATTLE DROID"] = {
      name = "E-5C B1 Battle Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139927471/01EFFA28B26ABFA90DE16CEEF694EBB083EB1F20/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780871782781/4DCE4780DE1CCDFB2996C28200A26C3B0696DD5A/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780871782881/ADC1DBC3987C84AF486F9CD0E19A0455F4C33291/",      
      },
      points = 16,
      restrictions = {
        include = {
          unit = {
            "B1 Battle Droids",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["E-5S B1 BATTLE DROID"] = {
      name = "E-5S B1 Battle Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139931066/BDF09AC95FA4C63AC25459B1636B8F0E6F0D7AFC/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/766102422959434489/60F05B7FC8544DFC640CB33DA55F19EB5F2CB55A/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/766102422959428835/10D3F8862BDECE8C0D7A874CC000F25CD6232168/",      
      },
      points = 18,
      restrictions = {
        include = {
          unit = {
            "B1 Battle Droids",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["E-60R B1 BATTLE DROID"] = {
      name = "E-60R B1 Battle Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139931091/2EF91BFA17C138987CC997C6A359AC948DB2D3BA/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780871782500/34D317CFE0BE32E4FFFB84567822CDF7AC4D4C98/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780871782620/9A9EA2B54691F42EA6D34762D33D523A836201B2/",      
      },
      points = 18,
      restrictions = {
        include = {
          unit = {
            "B1 Battle Droids",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["EMP \"DROID POPPERS\""] = {
      name = "EMP \"Droid Poppers\"",
      image = "https://steamusercontent-a.akamaihd.net/ugc/16979329673403509645/1A03673B650864D15B2500B83248522FFBABB2FB/",
      points = 3,
      type = "Grenades",
    },
    ["EV-SERIES MEDICAL DROID"] = {
      name = "EV-Series Medical Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139931203/4E82B1CC654C69E194324C5EF25525BD01BBA09A/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/1683750364035000354/6248E4CAF3E978154106E7095E6984DCE6677CCA/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/1683750364035001447/E6B6EC2DDAE8CEA46A1384161E789D76F8F296BA/",      
      },
      points = 14,
      restrictions = {
        include = {
          type = {
            "Droid Trooper",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["ECHO, ARC MARKSMAN"] = {
      name = "Echo, ARC Marksman",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139963016/7EFE284DE80081B2F8F535F53CB84469E2E2B1EF/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1009315641457801321/CED1CD80F307683E79B9A4ED87CECAED7C070EBF/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/773995200348530664/5E248091F8CC37B1023257338D4947E4ADFE48AB/",      
      },
      leader = true,
      points = 52,
      restrictions = {
        include = {
          faction = {
            "Republic",          
          },
          type = {
            "Clone Trooper",          
          },
          rank = {
            "Corps",
            "Special Forces",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["ECHO, CLONE FORCE 99"] = {
      name = "Echo, Clone Force 99",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139963062/CC0A09363EDC2A36A670D71ABCFA34048B44B32F/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2475370743175243825/0B07462AB1D02ACB64262C1E875E9DC5E3719850/",      
      },
      points = 0,
      restrictions = {
        include = {
          unit = {
            "The Bad Batch",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["ELECTRO GAUNTLETS"] = {
      name = "Electro Gauntlets",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148639059/89380FD599DD6819950BB21C5F940A9074C34A51/",
      points = 10,
      restrictions = {
        include = {
          unit = {
            "Cad Bane",          
          },        
        },      
      },
      type = "Armament",
    },
    ["ELECTRO GRAPPLING LINE"] = {
      name = "Electro Grappling Line",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140085250/238DDAD4ECD0F3A7307D08D40ABBA0A0529375F3/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "Sabine Wren",          
          },        
        },      
      },
      type = "Gear",
    },
    ["ELECTRO-WHIP MAGNAGUARD"] = {
      name = "Electro-Whip MagnaGuard",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139931140/87A4E668E6141DCF96DD8090761177033DDDD43C/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1621849308236386662/7ABB72B5A8A301611033E4A424FD61271024FB4C/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/1621849538641208262/A0E48F7D9C94617C81BAD4D649717BAC7A8B9B64/",      
      },
      points = 28,
      restrictions = {
        include = {
          unit = {
            "IG-100 MagnaGuard",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["ELECTRO-WHIP SOLDIER"] = {
      name = "Electro-Whip Soldier",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148639043/A6DFE4AD6FFFB452A302B6731A9F7667F7A0667E/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845513/BB3CD9624D6F43250D0406D099819E497A1A70BE/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",      
      },
      points = 10,
      restrictions = {
        include = {
          unit = {
            "Pyke Syndicate Foot Soldiers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["ELECTROBINOCULARS"] = {
      name = "Electrobinoculars",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10199441544306107703/133B792AACF4901AEA9F35EC0F8C2D7B17DA7866/",
      points = 8,
      restrictions = {
        override = {
          unit = {
            "B1 Battle Droids",          
          },        
        },      
      },
      type = "Gear",
    },
    ["ELECTROSTAFF GUARD"] = {
      name = "Electrostaff Guard",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568140779/14B23EE6749131636CF1A9D1507192F6870A32A1/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541912278/DC9D78CD5742236F9F272AC1F8AA1D59D07CF5A9/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541912060/182C0DD6D66EC8DEF075135B872DE26364010E27/",      
      },
      points = 21,
      restrictions = {
        include = {
          unit = {
            "Imperial Royal Guards",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["EMERGENCY STIMS"] = {
      name = "Emergency Stims",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13446832343829634893/9CF7AF6D397F06FB0D1A7205ED6139829D6F6E92/",
      points = 8,
      type = "Gear",
    },
    ["EMERGENCY TRANSPONDER"] = {
      name = "Emergency Transponder",
      image = "https://steamusercontent-a.akamaihd.net/ugc/9908400255536413440/38A6CDC80C3D7D0A2F9A9903EC1E0651380D8526/",
      points = 4,
      type = "Comms",
    },
    ["ENDURANCE"] = {
      name = "Endurance",
      image = "https://steamusercontent-a.akamaihd.net/ugc/9415595468930295182/7ACC3ED6894ECD1FDED41AC058BF318868605636/",
      points = 6,
      type = "Training",
    },
    ["ENGAGEMENT PROTOCOLS"] = {
      name = "Engagement Protocols",
      image = "https://steamusercontent-a.akamaihd.net/ugc/12618446894076894989/F2992658DAEDCD5F593270F3CF14EABFCD95019F/",
      points = 3,
      restrictions = {
        include = {
          type = {
            "Vehicle",          
          },        
        },      
      },
      type = "Programming",
    },
    ["ENVIRONMENTAL GEAR"] = {
      name = "Environmental Gear",
      image = "https://steamusercontent-a.akamaihd.net/ugc/16652798721637422056/91F7C8F27389BFDA9D9136B527122F23530B8501/",
      points = 2,
      type = "Gear",
    },
    ["ESTEEMED LEADER"] = {
      name = "Esteemed Leader",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568140964/439066821E561B2D148F432E1382CCE7E89C4195/",
      points = 5,
      type = "Command",
    },
    ["EWOK SKIRMISHER SQUAD"] = {
      name = "Ewok Skirmisher Squad",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384856338/3857B7DC883DF754409E8F4262459CC574DE5630/",
      minis = {
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129196/6EED0C8AAF8F50751EE4206471D1273B6C0F4B5A/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
        },
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129252/FC0A6247B6AB21A99919659C1F9069186C6D82ED/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
        },
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128356/9E8C70962F9D5BF853BD9310F2BB1E1A3F80DB5D/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
        },
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128445/EBB56734DB6527B3566C317F6F4F0E84471D6776/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
        },      
      },
      points = 28,
      restrictions = {
        include = {
          unit = {
            "Ewok Skirmishers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["EWOK SLINGER SQUAD"] = {
      name = "Ewok Slinger Squad",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384856396/086DF1555A9EC9B78C10A72F1154F9954670E9FA/",
      minis = {
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128565/24D88975D67E46B5FA9294EB6DCC146912D61F2F/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
        },
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128627/19AC5B05F3A355226EE783B9F239B3B285EA077A/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
        },
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128715/CB52DA6C0FC1DF3511C2A2D62CB2B3A13A9D4F8F/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
        },
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128778/1D5BCB551375F1A7988C434F0B52E18434BB4747/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
        },      
      },
      points = 23,
      restrictions = {
        include = {
          unit = {
            "Ewok Slingers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["EWOK TRAPPER"] = {
      name = "Ewok Trapper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140103150/0A2C3B844131196AFD07DAEF9FE79F2CA1563234/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128844/558E1277513B0AF48911A68B5FAAB981BC0A56A1/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",      
      },
      points = 10,
      restrictions = {
        include = {
          unit = {
            "Ewok Skirmishers",
            "Ewok Slingers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["EXTRA SUPPLIES"] = {
      name = "Extra Supplies",
      image = "https://steamusercontent-a.akamaihd.net/ugc/15887924979159088662/7496D40446701B499092859A5230230BD24B51C4/",
      points = 5,
      type = "Gear",
    },
    ["FX-9 MEDICAL DROID"] = {
      name = "FX-9 Medical Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140097235/1B7C3623EF5EA7A2F7AB4123AF617CA73B851E05/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/949599512594268065/7B4874981CECB7BB80D5BC54F60F1939B9A9DAB1/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/949599512594268174/00246DE6DCE285206330C43B8049B19FFDF5BB41/",      
      },
      points = 19,
      restrictions = {
        include = {
          faction = {
            "Empire",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["FEAR"] = {
      name = "Fear",
      image = "https://steamusercontent-a.akamaihd.net/ugc/9673306764281530635/A29BF04A277C5491400B32B97D8FEA512722A7B3/",
      points = 3,
      restrictions = {
        include = {
          alignment = {
            "Dark",          
          },        
        },      
      },
      type = "Force",
    },
    ["FIRST SERGEANT ARBMAB"] = {
      name = "First Sergeant Arbmab",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148691104/395E3C391D3513EC8CCD4D6220372B8793EAA936/",
      points = 5,
      restrictions = {
        include = {
          faction = {
            "Empire",          
          },
          type = {
            "Ground Vehicle",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["FIVES"] = {
      name = "Fives",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384856467/9C8FFFD42DF5BCF0EE31E9CA9DABFE1B68235EE6/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1009315641457802221/506D704E232C1BFD85F063A24EBF24C5914C2C40/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/773995200348530664/5E248091F8CC37B1023257338D4947E4ADFE48AB/",      
      },
      leader = true,
      points = 40,
      restrictions = {
        include = {
          type = {
            "Clone Trooper",          
          },        
        },      
      },
      type = "Squad Leader",
    },
    ["FLAMETROOPER"] = {
      name = "Flametrooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140097285/FCD736B27C338F603E13D0B1FA8FA3E10D1CE1FA/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801931/BDE907EBE0BFC0DC4180C76AFEA3F8667013FF3B/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541802054/044AD0961CD1485A61AC3B6CB3669FD8AA5A0FEB/",      
      },
      points = 20,
      restrictions = {
        include = {
          unit = {
            "Snowtroopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["FLEET TROOPER"] = {
      name = "Fleet Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568141213/9844C89F6EFB3043914F0E7CA54F6089F46F7C5A/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670863/20FE73C6E9F8468BD468C820C88EAB9F697EC33E/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670760/47DF3E87B3F71E8EA42A89ECFE96E4FB3990D7ED/",      
      },
      points = 7,
      restrictions = {
        include = {
          unit = {
            "Fleet Troopers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["FLEET TROOPER SQUAD"] = {
      name = "Fleet Trooper Squad",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384856618/9DED8502636167A62F6D2AEEE5AE8B004D61F3CF/",
      minis = {
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670667/CB316B23D59F28C5EF22E94A43280D49DFFDD6AC/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670760/47DF3E87B3F71E8EA42A89ECFE96E4FB3990D7ED/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540540671182/A605D9D0DB356DC71473F5C9DF27DE1CADB4F320/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540540671278/9B94D359A61113F72EEB0435D70A1291431D737A/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670978/0642E99CB4E8CABA1AA10389F2387A1C70D9322D/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670760/47DF3E87B3F71E8EA42A89ECFE96E4FB3990D7ED/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540540671182/A605D9D0DB356DC71473F5C9DF27DE1CADB4F320/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540540671278/9B94D359A61113F72EEB0435D70A1291431D737A/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670978/0642E99CB4E8CABA1AA10389F2387A1C70D9322D/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670760/47DF3E87B3F71E8EA42A89ECFE96E4FB3990D7ED/",
        },      
      },
      points = 45,
      restrictions = {
        include = {
          unit = {
            "Fleet Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["FORCE BARRIER"] = {
      name = "Force Barrier",
      image = "https://steamusercontent-a.akamaihd.net/ugc/15143817809089088858/42064C6532794B58C1E96FF46E84ACE559FEC283/",
      points = 10,
      type = "Force",
    },
    ["FORCE CHOKE"] = {
      name = "Force Choke",
      image = "https://steamusercontent-a.akamaihd.net/ugc/14947659096167109315/5A48D7B33D304D35557DCC61D91BC6685583C78A/",
      points = 10,
      restrictions = {
        include = {
          alignment = {
            "Dark",          
          },        
        },      
      },
      type = "Force",
    },
    ["FORCE GUIDANCE"] = {
      name = "Force Guidance",
      image = "https://steamusercontent-a.akamaihd.net/ugc/17502599399888225537/5BCB94ABA69828E206589A9494A69496CD9BE1D9/",
      points = 5,
      type = "Force",
    },
    ["FORCE LIFT"] = {
      name = "Force Lift",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568226237/8E8024D98127B2963C56671A8BE0DCE41E487350/",
      points = 5,
      additionalObjects = {
        "Barricade",      
      },
      type = "Force",
    },
    ["FORCE PIKE WARRIOR"] = {
      name = "Force Pike Warrior",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139931290/4D91F65FD4C56E472083227DF40A98D978735E4B/",
      type = "Heavy Weapon",
      points = 15,
      restrictions = {
        include = {
          unit = {
            "Geonosian Warriors",          
          },        
        },      
      },
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177195807/C1E3DCF8DC0772F56B22E42E89DECC9F30110E8D/",      
      },
      flip = {
        name = "Force Pike Warrior",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139984742/4CBAEA0926D770481377C8C3556D0F4F55D403F4/",      
      },
    },
    ["FORCE PIKE WARRIOR"] = {
      name = "Force Pike Warrior",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139984742/4CBAEA0926D770481377C8C3556D0F4F55D403F4/",
      flip = {
        name = "Force Pike Warrior",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139931290/4D91F65FD4C56E472083227DF40A98D978735E4B/",      
      },
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177195807/C1E3DCF8DC0772F56B22E42E89DECC9F30110E8D/",      
      },
      points = 15,
      restrictions = {
        include = {
          unit = {
            "Geonosian Warriors",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["FORCE PUSH"] = {
      name = "Force Push",
      image = "https://steamusercontent-a.akamaihd.net/ugc/15906597476264837051/ED34165894E2D37CF5194D7FDD51ADA7B3ED0596/",
      points = 10,
      type = "Force",
    },
    ["FORCE REFLEXES"] = {
      name = "Force Reflexes",
      image = "https://steamusercontent-a.akamaihd.net/ugc/16096715596179885171/664DA23B337498B297143163C2B92A87EF60F515/",
      points = 5,
      type = "Force",
    },
    ["FOREST DWELLERS"] = {
      name = "Forest Dwellers",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140100329/4F2A45ECABD3B325A456366332FF93683D6AA296/",
      points = 3,
      restrictions = {
        include = {
          unit = {
            "Ewok Slingers",
            "Ewok Skirmishers",
            "Wicket",
            "Logray",          
          },        
        },      
      },
      type = "Training",
    },
    ["FRAGMENTATION GRENADES"] = {
      name = "Fragmentation Grenades",
      image = "https://steamusercontent-a.akamaihd.net/ugc/17481227970231967061/040B13006EEBC5098CD852141C001CCE30B9A7F8/",
      points = 5,
      type = "Grenades",
    },
    ["FRENZIED GUNNER"] = {
      name = "Frenzied Gunner",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638994/BB7B0FF17AF90112CFE43A75F5762598858400DB/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "A-A5 Speeder Truck",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["GENERAL WEISS"] = {
      name = "General Weiss",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148691201/0F949459DDCA1EAFC03EC7145C7402A636C9C4BE/",
      points = 5,
      restrictions = {
        include = {
          faction = {
            "Empire",          
          },
          type = {
            "Ground Vehicle",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["GEONOSIAN WARRIOR"] = {
      name = "Geonosian Warrior",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139931935/2F3CADBA40F493D24A6AB5146FFF64A612C2398B/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177201933/E0DBF0D812FFF4F7F3A77CF1E4EAB84F78B8C49E/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177195881/84020A8311904050DC9309FE9109D47BC41FE4AA/",      
      },
      points = 11,
      restrictions = {
        include = {
          unit = {
            "Geonosian Warriors",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["GEONOSIAN WARRIOR SQUAD"] = {
      name = "Geonosian Warrior Squad",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139931345/26339BC464EC1009F100CC1BACFDC3F726B3CD27/",
      minis = {
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177201554/7AEA5B0A98A298731F6BE51591401BBF095A5797/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177195881/84020A8311904050DC9309FE9109D47BC41FE4AA/",
        },
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177201933/E0DBF0D812FFF4F7F3A77CF1E4EAB84F78B8C49E/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177195881/84020A8311904050DC9309FE9109D47BC41FE4AA/",
        },
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177202012/76CB0371503304D5AAF562E5E2F04961CD206090/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177195881/84020A8311904050DC9309FE9109D47BC41FE4AA/",
        },
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177201933/E0DBF0D812FFF4F7F3A77CF1E4EAB84F78B8C49E/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177195881/84020A8311904050DC9309FE9109D47BC41FE4AA/",
        },
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177202012/76CB0371503304D5AAF562E5E2F04961CD206090/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177195881/84020A8311904050DC9309FE9109D47BC41FE4AA/",
        },      
      },
      points = 51,
      restrictions = {
        include = {
          unit = {
            "Geonosian Warriors",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["GIDEON HASK"] = {
      name = "Gideon Hask",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140103438/D7D66F0CFEFC2658BF2FDB33899D5888448353F0/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1618437692581075349/6265F81E1BAA090FFA813270A8E3126CF8AD6CC5/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/1618438238123043414/B7E9660E470DC070545782406C29F1E1356A5685/",      
      },
      leader = true,
      points = 29,
      restrictions = {
        include = {
          faction = {
            "Empire",          
          },
          unit = {
            "Imperial Special Forces",          
          },
          rank = {
            "Corps",          
          },        
        },
        exclude = {
          unit = {
            "Stormtroopers Heavy Response Unit",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["GNASP BOMBARDIER"] = {
      name = "Gnasp Bombardier",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135343165/A3E8D964A08B453B9E015137A07E33D8387D1A64/",
      points = 20,
      restrictions = {
        include = {
          unit = {
            "Raddaugh Gnasp Fluttercraft",          
          },        
        },      
      },
      type = "Crew",
    },
    ["GNASP GUNNER"] = {
      name = "Gnasp Gunner",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135343200/DEFBD83A9EBBA99252AC71556D2B37557BF9B36B/",
      points = 15,
      restrictions = {
        include = {
          unit = {
            "Raddaugh Gnasp Fluttercraft",          
          },        
        },      
      },
      type = "Crew",
    },
    ["GOVERNOR PRYCE"] = {
      name = "Governor Pryce",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148691269/0E980DEE7A89F49805E303D9A4BD5D4CF4CC2CA5/",
      points = 5,
      restrictions = {
        include = {
          faction = {
            "Empire",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["GRAPPLING HOOKS"] = {
      name = "Grappling Hooks",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13745066816000738957/3B66D6274F0A9783C51378EF3C318D3DF82A2514/",
      points = 2,
      type = "Gear",
    },
    ["GROGU"] = {
      name = "Grogu",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10193011638909819730/8D53047BE6DF276528CA0FD2BB8283DF4AAD1377/",
      points = 17,
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1785135165610974498/47B1C8B92A0E945388F7773EAB2F73B0A81E761E/",      
      },
      restrictions = {
        include = {
          unit = {
            "Din Djarin",          
          },        
        },      
      },
      type = "Counterpart",
    },
    ["HH-12 STORMTROOPER"] = {
      name = "HH-12 Stormtrooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140097369/5299C4869B939C8673F1B0BD1A28398C4287BFF9/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141088/7342269A721DF49D0C38F1469E8463093734EF66/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141746/A8FD77EB51C50C64CD924BDAEEDB70D8839E0EF3/",      
      },
      points = 22,
      restrictions = {
        include = {
          unit = {
            "Stormtroopers",
            "Stormtroopers Heavy Response Unit",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["HQ UPLINK"] = {
      name = "HQ Uplink",
      image = "https://steamusercontent-a.akamaihd.net/ugc/12685640959616769169/065354E9812F61C36C60B9EFD08829CD70C51487/",
      points = 10,
      type = "Comms",
    },
    ["HACKED COMMS UNIT"] = {
      name = "Hacked Comms Unit",
      image = "https://steamusercontent-a.akamaihd.net/ugc/16875746628328702203/66EFD3995E6C5DDB8B687B86323884DFA50E767D/",
      points = 5,
      type = "Comms",
    },
    ["HEAVY AQUA DROID"] = {
      name = "Heavy Aqua Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1794100632571533/28837AF9D4578A64FDDBF1A1FBCF01B1B500C263/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/16428277771267782/F0A018E16296CA10D0E02E7F41DE82CE5E989B23/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/16428277771267882/F4CCED2C7C26C390BC2CA20D1BA1DAA27340FE57/",      
      },
      points = 28,
      restrictions = {
        include = {
          unit = {
            "Aqua Droids",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["HEAVY LASER CANNON"] = {
      name = "Heavy Laser Cannon",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2491139050708063813/02A958048D55355C0A3FECAADB08B690785AE4FF/",
      points = 10,
      restrictions = {
        include = {
          unit = {
            "LM-432 Crab Droid",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["HEAVY LASER RETROFIT"] = {
      name = "Heavy Laser Retrofit",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140085434/9779C6885402FF554F2CB4DEEDADEE725DE3C1A7/",
      points = 12,
      restrictions = {
        include = {
          unit = {
            "A-A5 Speeder Truck",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["HERBAL MEDICINE"] = {
      name = "Herbal Medicine",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140105386/419AA1B3264BA3ACD8243358E80630E91B11DBC9/",
      points = 10,
      restrictions = {
        include = {
          unit = {
            "Logray",          
          },        
        },      
      },
      type = "Training",
    },
    ["HIGH-ENERGY SHELLS"] = {
      name = "High-Energy Shells",
      image = "https://steamusercontent-a.akamaihd.net/ugc/17302862727198256496/5D94931ED170BE02B13FBA03D1F5894CF5FEF237/",
      points = 8,
      type = "Ordnance",
    },
    ["HOPE"] = {
      name = "Hope",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10760287538524062730/28C02EF23C693E082481D9AC02407542CDD79CC6/",
      points = 3,
      restrictions = {
        include = {
          alignment = {
            "Light",          
          },        
        },      
      },
      type = "Force",
    },
    ["HOTSHOT PILOT"] = {
      name = "Hotshot Pilot",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140085473/EFDD0076A93ED598B0D58CD718A765B2A56AE228/",
      points = 8,
      restrictions = {
        include = {
          faction = {
            "Rebel",          
          },
          type = {
            "Repulsor Vehicle",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["HOUND & GRIZZER"] = {
      name = "Hound & Grizzer",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13575491821704896451/EDE4AFDD9E9AEC222C4B8F7C91F124B3F32B8A73/",
      points = 8,
      restrictions = {
        include = {
          faction = {
            "Republic",          
          },
          unit = {
            "LAAT/LE Patrol Transport",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["HUNTER"] = {
      name = "Hunter",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134145162/59CF94272440AA250AFA7883ADC169BA9F1EDBEF/",
      leader = true,
      points = 0,
      restrictions = {
        include = {
          unit = {
            "The Bad Batch",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["I'VE ALTERED THE DEAL"] = {
      name = "I've Altered The Deal",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1616219505080628591/9F5E8A23795A68A3AA5FE82B933F4BDA78084207/",
      points = 0,
      type = "Flaw",
    },
    ["IG-100 MAGNAGUARD"] = {
      name = "IG-100 MagnaGuard",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139931971/525A56FA820F4B27F1C1E46AAA5ED5FA8AA86EB5/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1621849308236386555/F47418A458CF12C80756A80B842817EA1CCC62CF/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/1621849538641208262/A0E48F7D9C94617C81BAD4D649717BAC7A8B9B64/",      
      },
      points = 22,
      restrictions = {
        include = {
          unit = {
            "IG-100 MagnaGuard",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["IDEN'S DLT-20A RIFLE"] = {
      name = "Iden's DLT-20A Rifle",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568142679/5583B4B2E96BA55F3A4D2DE46EBF31B130AAA757/",
      points = 15,
      restrictions = {
        include = {
          unit = {
            "Iden Versio",          
          },        
        },      
      },
      type = "Armament",
    },
    ["IDEN'S ID10 SEEKER DROID"] = {
      name = "Iden's ID10 Seeker Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135447894/8F1310249DB7B03175CFEEE485B966D2E228C623/",
      points = 15,
      mini = {
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/770611889399999868/37F150131345FF1F47592A96239395A583AAE5EA/",
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/773996263557020821/1E2319EBFD85D7748450F40689A1315696052EFC/",      
      },
      restrictions = {
        include = {
          unit = {
            "Iden Versio",          
          },        
        },      
      },
      type = "Counterpart",
    },
    ["IDEN'S TL-50 REPEATER"] = {
      name = "Iden's TL-50 Repeater",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568142734/E13169C3DF9153C7196A29DB82578DE1FD659F6D/",
      points = 15,
      restrictions = {
        include = {
          unit = {
            "Iden Versio",          
          },        
        },      
      },
      type = "Armament",
    },
    ["IMPACT GRENADES"] = {
      name = "Impact Grenades",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13262048397259590169/3F4068C180970A83C3676C515AADEDC561B243CA/",
      points = 3,
      type = "Grenades",
    },
    ["IMPERIAL COMMS TECHNICIAN"] = {
      name = "Imperial Comms Technician",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140097427/A759E82138BD75F9641E42316D314BCA9D70CF33/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/949599512594268417/62CC1D5BCBD1EE294C72781B03AB972B3ED5AD12/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/949599512594268526/CA2596C0B2D7DF68D794B2A7880F34B5459F1206/",      
      },
      points = 10,
      restrictions = {
        include = {
          faction = {
            "Empire",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["IMPERIAL DARK TROOPER"] = {
      name = "Imperial Dark Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148691379/518F04086F72215062FDD24016FE412B7F0F9106/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1785135125810942938/E77EC5970DA310A2E1D96F796E98D82813AE0891/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2004698291313176203/E77892ADB668EA0CB548F6ED71BE44CA3FB730E7/",      
      },
      points = 32,
      restrictions = {
        include = {
          unit = {
            "Imperial Dark Troopers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["IMPERIAL HAMMERS ELITE ARMOR PILOT"] = {
      name = "Imperial Hammers Elite Armor Pilot",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148691474/7EFEFFFDE5EF5899C5E3F3F06C855D794B67E7F7/",
      points = 10,
      restrictions = {
        include = {
          faction = {
            "Empire",          
          },
          type = {
            "Ground Vehicle",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["IMPERIAL MARCH"] = {
      name = "Imperial March",
      image = "https://steamusercontent-a.akamaihd.net/ugc/14337942722120063044/BA09967A3C8A7F4E5A38815E4C7812EB00DA3B3D/",
      points = 6,
      restrictions = {
        include = {
          rank = {
            "Corps",          
          },
          faction = {
            "Empire",          
          },        
        },      
      },
      type = "Training",
    },
    ["IMPERIAL OFFICER"] = {
      name = "Imperial Officer",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140097483/145E74D65EDF1283F5CD01FA06655B2974624922/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541565898/F06AB6731446249164D34ACA208E4FAE70C6FE00/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541566011/A7A84EBF79DA5E1D5BCE71E863FC16EC40937F6F/",      
      },
      leader = true,
      points = 17,
      restrictions = {
        include = {
          faction = {
            "Empire",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["IMPERIAL TIE PILOT"] = {
      name = "Imperial TIE Pilot",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148691580/FB3F0FA888AD2792554DBEBC95A8509790A299BD/",
      points = 8,
      restrictions = {
        include = {
          faction = {
            "Empire",          
          },
          type = {
            "Repulsor Vehicle",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["IMPROVISED ORDERS"] = {
      name = "Improvised Orders",
      image = "https://steamusercontent-a.akamaihd.net/ugc/9869682046426627943/152512DE2EE5592159A7D5A4E9BB7111A0C729B5/",
      points = 5,
      type = "Command",
    },
    ["INQUISITORIUS TRAINING"] = {
      name = "Inquisitorius Training",
      image = "https://steamusercontent-a.akamaihd.net/ugc/16029402244249243117/D61B7E9D4163D96847488E7EA80B3C6A60672238/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "Fifth Brother",
            "Seventh Sister",          
          },        
        },      
      },
      type = "Training",
    },
    ["INSATIABLE CURIOSITY"] = {
      name = "Insatiable Curiosity",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140100414/E3E6C5563CD533DC0560C50590B8A989E382E7BC/",
      points = 8,
      restrictions = {
        include = {
          unit = {
            "Ewok Skirmishers",
            "Ewok Slingers",          
          },        
        },      
      },
      type = "Training",
    },
    ["INSPIRING PRESENCE"] = {
      name = "Inspiring Presence",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13424493991629241458/67E4A2FA7A3C475FC2936C5029591460B190FC1F/",
      points = 5,
      type = "Command",
    },
    ["INTEGRATED COMMS ANTENNA"] = {
      name = "Integrated Comms Antenna",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568143206/40A5FABD690D6741D18996F7896AF1AC8931EA56/",
      points = 3,
      restrictions = {
        include = {
          type = {
            "Droid Trooper",          
          },        
        },      
      },
      type = "Comms",
    },
    ["INTO THE FRAY"] = {
      name = "Into The Fray",
      image = "https://steamusercontent-a.akamaihd.net/ugc/14109187506581343144/00287D0E98E6349774A91B470804179CCBFE529E/",
      points = 4,
      type = "Training",
    },
    ["J-19 BO-RIFLE BLASTER"] = {
      name = "J-19 Bo-Rifle Blaster",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568143236/93E8E40BBA0157ACB1CC8492BFB7BCB58913BF28/",
      flip = {
        name = "J-19 Bo-Rifle Staff",
        image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568143309/544D8E7915CDDF661A0F75AD56BD3C4AF023108F/",      
      },
      points = 5,
      restrictions = {
        include = {
          unit = {
            "Agent Kallus",          
          },        
        },      
      },
      type = "Armament",
    },
    ["J-19 BO-RIFLE STAFF"] = {
      name = "J-19 Bo-Rifle Staff",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568143309/544D8E7915CDDF661A0F75AD56BD3C4AF023108F/",
      type = "Armament",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "Agent Kallus",          
          },        
        },      
      },
      mini = undefined,
      flip = {
        name = "J-19 Bo-Rifle Blaster",
        image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568143236/93E8E40BBA0157ACB1CC8492BFB7BCB58913BF28/",      
      },
    },
    ["JEDI GUARDIAN"] = {
      name = "Jedi Guardian",
      image = "https://steamusercontent-a.akamaihd.net/ugc/11522429422550427771/2AE47A46390BAC96C6EAE879130F4F01D738E37D/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/16426912929621400/CC4D94EDC24D933D7333F5A35308606846A9B550/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/16426912929621469/4B200440B54994D37A5B3667E04769CD92DE4F32/",      
      },
      points = 22,
      leader = true,
      restrictions = {
        include = {
          faction = {
            "Republic",          
          },        
        },      
      },
      type = "Squad Leader",
    },
    ["JEDI MIND TRICK"] = {
      name = "Jedi Mind Trick",
      image = "https://steamusercontent-a.akamaihd.net/ugc/16576180526883700218/91A8C17FBF0B3D84BC8ED5CB727BABB1AB69790A/",
      points = 5,
      restrictions = {
        include = {
          alignment = {
            "Light",          
          },        
        },      
      },
      type = "Force",
    },
    ["JETPACK ROCKETS"] = {
      name = "Jetpack Rockets",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140085567/31DBF8DD50EC6DAC02522908B9E8D0D3B2A37925/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "Mandalorian Resistance",          
          },        
        },      
      },
      type = "Armament",
    },
    ["JYN'S SE-14 BLASTER"] = {
      name = "Jyn's SE-14 Blaster",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140086376/D2D709BDACCC6415CBC5786450D1BFDFBDF34ED9/",
      points = 10,
      restrictions = {
        include = {
          unit = {
            "Jyn Erso",
            "K-2SO",          
          },        
        },      
      },
      type = "Armament",
    },
    ["KX-SERIES SECURITY DROIDS"] = {
      name = "KX-Series Security Droids",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140176950/CCE38141C12BFD65899FE18BF929C8BF0E2E1C57/",
      minis = {
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/773996263557000439/C9EA2A27264C73E42C016FE26E665CBB75F8E7DE/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/770611701143471855/26BE70BB475D8B61122C8954CCA2EC79C1ED4C25/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/773996263557000439/C9EA2A27264C73E42C016FE26E665CBB75F8E7DE/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/770611701143471855/26BE70BB475D8B61122C8954CCA2EC79C1ED4C25/",
        },      
      },
      points = 30,
      restrictions = {
        include = {
          unit = {
            "Stormtrooper Riot Squad",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["KATARN PATTERN ARMOR"] = {
      name = "Katarn Pattern Armor",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135343697/9294A833C65D6D3721327C68A057F71D8D920AD7/",
      points = 0,
      type = "Gear",
    },
    ["LEAD BY EXAMPLE"] = {
      name = "Lead by Example",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13953261892853714692/D7C43A7643D1580E6B7859A468734D1784D046EA/",
      points = 8,
      type = "Command",
    },
    ["LINKED TARGETING ARRAY"] = {
      name = "Linked Targeting Array",
      image = "https://steamusercontent-a.akamaihd.net/ugc/14619952568753696955/4661936FB9F23F26D08151D8D8F82CC3140F9B5A/",
      points = 5,
      restrictions = {
        include = {
          type = {
            "Emplacement Trooper",
            "Vehicle",          
          },        
        },      
      },
      type = "Comms",
    },
    ["LOK DURD"] = {
      name = "Lok Durd",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139932011/B3D3CF2244185894532A6D27D795AAA947DBD2C0/",
      points = 9,
      restrictions = {
        include = {
          unit = {
            "AAT Battle Tank",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["LONG GUN WOOKIEE"] = {
      name = "Long Gun Wookiee",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140086434/5583DF53D29E565AFACC0B9535B7B5798B4183F6/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1619598366708042667/2DABB5788E51006EDB3FCB03400ACD4CE07755F3/",      
      },
      points = 26,
      restrictions = {
        include = {
          unit = {
            "Wookiee Warriors",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["LONG-RANGE COMLINK"] = {
      name = "Long-Range Comlink",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568143528/99CEF391C6D9986657DE1CFF42306EAC06958A0B/",
      points = 5,
      type = "Comms",
    },
    ["LOOTED E-5 BLASTER"] = {
      name = "Looted E-5 Blaster",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568143554/AAE0C21ACF5E130BCCD15B21BDC1027613DC26BA/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "Padme Amidala",          
          },        
        },      
      },
      type = "Armament",
    },
    ["M-45 ION BLASTER"] = {
      name = "M-45 Ion Blaster",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140086470/7B7DF79267F695621DFF1C1D68859F71CBE521C5/",
      points = 28,
      restrictions = {
        include = {
          unit = {
            "X-34 Landspeeder",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["MO/DK POWER HARPOON"] = {
      name = "MO/DK Power Harpoon",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140086620/85D8AFAE73115CB7E7F35C5167E442B97CD1B01E/",
      points = 0,
      restrictions = {
        include = {
          unit = {
            "T-47 Airspeeder",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["MPL-57 BARRAGE TROOPER"] = {
      name = "MPL-57 Barrage Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384857286/60AC7BEDA003F95429F6312717EBAB9488C51852/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670338/28625FDF1F56EF08F0DB236C4ECFF67A54083B2B/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780862750426/2563904D7561144EE85EBCD3E07D68F48D8DD034/",      
      },
      points = 22,
      restrictions = {
        include = {
          unit = {
            "Fleet Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["MPL-57 ION TROOPER"] = {
      name = "MPL-57 Ion Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140087234/0D66FAAED4DDC12FFC8A8473BAF114066354BCFB/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670338/28625FDF1F56EF08F0DB236C4ECFF67A54083B2B/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780862750426/2563904D7561144EE85EBCD3E07D68F48D8DD034/",      
      },
      points = 27,
      restrictions = {
        include = {
          unit = {
            "Rebel Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["MAG-DET ENFORCER"] = {
      name = "Mag-Det Enforcer",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638823/D41C1DD1A9B63A173D667167C2CA1E79D0BA2F1E/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143649/BBBA0D26FB46EAD96421C4B77FE779B5F0F848AA/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143328/3D6F3C2E8DFB78B9B748FFC8F339B9C568D7408E/",      
      },
      points = 16,
      restrictions = {
        include = {
          unit = {
            "Black Sun Enforcers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["MANDALORIAN COMBAT SHIELDS"] = {
      name = "Mandalorian Combat Shields",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140086515/C2224F26DF942CEFA38BE94C5BF16355539139DA/",
      points = 10,
      restrictions = {
        include = {
          unit = {
            "Mandalorian Resistance",          
          },        
        },      
      },
      type = "Gear",
    },
    ["MANDALORIAN SUPER COMMANDO"] = {
      name = "Mandalorian Super Commando",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638743/16D7B984EB6DA1BE6AF202D902459EE20DD03050/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143500/4BDEA7F5B523FC06641B3D71D1E112DC14BD7F81/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/1789640371717200823/B886D3157AA2F2528F4E5F76F26DF44A41496615/",      
      },
      points = 24,
      restrictions = {
        include = {
          unit = {
            "Mandalorian Super Commandos",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["MARK II MEDIUM BLASTER"] = {
      name = "Mark II Medium Blaster",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140086552/D1D6D09E2363DE1AD638A6516E6272CACB2B7A23/",
      points = 21,
      restrictions = {
        include = {
          unit = {
            "X-34 Landspeeder",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["MERTALIZER"] = {
      name = "Mertalizer",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148691701/24C8FA07250A2FF8E6E94EC79E6B3F87145E7D5A/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2004698291313161066/7BD340C7AAB594CDA1644D900F606FEC8A0165A1/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2004698291313176203/E77892ADB668EA0CB548F6ED71BE44CA3FB730E7/",      
      },
      points = 36,
      restrictions = {
        include = {
          unit = {
            "Imperial Dark Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["MISSION OBJECTIVE"] = {
      name = "Mission Objective",
      image = "https://steamusercontent-a.akamaihd.net/ugc/17334019965207943741/029ACD82FDA36426721B25B435731D78D4470689/",
      points = 6,
      type = "Training",
    },
    ["MORTAR CLONE TROOPER"] = {
      name = "Mortar Clone Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384857192/CF4DF5C1BB0C410B79E2F7EE0B658D2C9F4B8DE3/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809185328/4A6DA42CDB70EF979D5B8B675CEFA5459FA60D4E/",      
      },
      points = 20,
      restrictions = {
        include = {
          unit = {
            "Clone Trooper Infantry",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["NOSE-MOUNTED FLAMETHROWER"] = {
      name = "Nose-Mounted Flamethrower",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139932109/2E0AB29034B53D4523B5370D1EF77159460BB222/",
      points = 15,
      restrictions = {
        include = {
          unit = {
            "DSD1 Dwarf Spider Droid",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["NOSE-MOUNTED ION BLASTER"] = {
      name = "Nose-Mounted Ion Blaster",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139932171/BC04BFC46285EB872E4B7A65DF2E6A2C8DC5EBA9/",
      points = 30,
      restrictions = {
        include = {
          unit = {
            "DSD1 Dwarf Spider Droid",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["NOSE-MOUNTED LASER CANNON"] = {
      name = "Nose-Mounted Laser Cannon",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139932245/3F68293534A56C2DAF62AC227A3F271F1C201610/",
      points = 15,
      restrictions = {
        include = {
          unit = {
            "DSD1 Dwarf Spider Droid",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["NOT A STORY THE JEDI WOULD TELL"] = {
      name = "Not A Story The Jedi Would Tell",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1616219505080628743/9BF0AAE54D0CF62B22871F7E99B1DCD5617E05DA/",
      points = 0,
      type = "Flaw",
    },
    ["OOM-SERIES BATTLE DROID"] = {
      name = "OOM-Series Battle Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139933383/26696A10589DBF5D8D9FC3E389F9C9F74CE2AE27/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/767228764785018348/F0B0C50757F4043A6C9B8746A73F8EC4342CA7DA/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/767228764785012711/4DF65424F7D5400F0DC8A4DE7A028B373143CE6E/",      
      },
      points = 8,
      restrictions = {
        include = {
          unit = {
            "B1 Battle Droids",          
          },        
        },      
      },
      leader = true,
      type = "Personnel",
    },
    ["OOM-SERIES DROID PILOT"] = {
      name = "OOM-Series Droid Pilot",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140015474/EBD6D1C9D3C7DBCB66C1C5976D7F6B2A7303655D/",
      points = 7,
      restrictions = {
        include = {
          unit = {
            "AAT Battle Tank",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["OFFENSIVE PUSH"] = {
      name = "Offensive Push",
      image = "https://steamusercontent-a.akamaihd.net/ugc/16907375567208427027/88097E66EB0822A2A2956F6BDCC92A37E9E3E464/",
      points = 6,
      type = "Training",
    },
    ["OFFENSIVE STANCE"] = {
      name = "Offensive Stance",
      image = "https://steamusercontent-a.akamaihd.net/ugc/16537339389726247952/720B5E7A361CEEC36F674F1CF36298A5997DE2F5/",
      type = "Training",
      points = 5,
      restrictions = {
        include = {
          slot = {
            "Force",          
          },        
        },      
      },
      mini = undefined,
      flip = {
        name = "Defensive Stance",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10394379497446642242/A484E8DE817DC612497E99A36F6D33FBA8E423C9/",      
      },
    },
    ["OMEGA MASCOT OF THE 99TH"] = {
      name = "Omega Mascot of the 99th",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13052279450458785925/C7B345E1DDA2DA424D48B784B9211314F16BA062/",
      points = 10,
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2475370743175243961/93E8549BC0F1F88228D651FAE226459945DC6651/",      
      },
      restrictions = {
        include = {
          faction = {
            "Rebel",          
          },
          unit = {
            "The Bad Batch",          
          },        
        },      
      },
      type = "Counterpart",
    },
    ["ON THE HUNT"] = {
      name = "On the Hunt",
      image = "https://steamusercontent-a.akamaihd.net/ugc/11536628804561707799/CE3417E31989D043648719A766916DF1A91B9228/",
      points = 6,
      type = "Training",
    },
    ["ONBOARD COMMS CHANNEL"] = {
      name = "Onboard Comms Channel",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13942732418073164981/DF52655D5DBDA266A9A0F3609B151FEC449ACE22/",
      points = 10,
      restrictions = {
        include = {
          type = {
            "Vehicle",          
          },        
        },      
      },
      type = "Comms",
    },
    ["ONWARD TO VICTORY"] = {
      name = "Onward to Victory",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140105386/419AA1B3264BA3ACD8243358E80630E91B11DBC9/",
      points = 10,
      restrictions = {
        include = {
          unit = {
            "Logray",          
          },        
        },      
      },
      type = "Training",
    },
    ["OUTER RIM SPEEDER JOCKEY"] = {
      name = "Outer Rim Speeder Jockey",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140087292/9D5546C2AC5D1B59952078E53AF7E83003DFB912/",
      points = 10,
      restrictions = {
        include = {
          faction = {
            "Rebel",          
          },
          type = {
            "Repulsor Vehicle",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["OVERCHARGED GENERATOR"] = {
      name = "Overcharged Generator",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10994758540793540020/A06F99541DB44F59DCDE885471D4F9E77A37DA08/",
      points = 3,
      type = "Generator",
    },
    ["OVERWATCH"] = {
      name = "Overwatch",
      image = "https://steamusercontent-a.akamaihd.net/ugc/15085498882065075341/D3305FB0E1D762750532A11CDCB3195A3587F987/",
      points = 4,
      type = "Training",
    },
    ["P13-M DISRUPTOR SOLDIER"] = {
      name = "P13-M Disruptor Soldier",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638629/3C20733912FB63D65394756509211C5CF6C39CDA/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845607/4B1530CF96F9DB8F172B02676F1D8B347CFD862A/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",      
      },
      points = 24,
      restrictions = {
        include = {
          unit = {
            "Pyke Syndicate Foot Soldiers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["PK-SERIES WORKER DROID"] = {
      name = "PK-Series Worker Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139933460/B95170257A3FA060A1A39CB5927F72FA40D8F821/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809185654/E58BE2AB7BC859E1A896FF9B9909B6976E69CF4B/",      
      },
      points = 12,
      restrictions = {
        include = {
          type = {
            "Droid Trooper",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["PAO"] = {
      name = "Pao",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568144174/A692F2A518931AA6E08AAF8C4641D8972ECDB267/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/993513208355174746/6F5A50CE6D4E23C6278AE868FD359A49E1C80179/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/993513208355174858/CCC2B3862F1FEB611B03317594F6F0E761750C70/",      
      },
      leader = true,
      points = 20,
      restrictions = {
        include = {
          unit = {
            "Rebel Pathfinders",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["PINTLE-MOUNTED DLT-19"] = {
      name = "Pintle-Mounted DLT-19",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148691806/1D3A6A70D19D4C84286B171457623AA3119A2C03/",
      points = 18,
      restrictions = {
        include = {
          unit = {
            "TX-225 GAVw Occupier Tank",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["PINTLE-MOUNTED RT-97C"] = {
      name = "Pintle-Mounted RT-97C",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148692381/4CDBE4E62F256CAFC40FEBE392F64789B73B5BC1/",
      points = 14,
      restrictions = {
        include = {
          unit = {
            "TX-225 GAVw Occupier Tank",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["PLO KOON"] = {
      name = "Plo Koon",
      image = "https://steamusercontent-a.akamaihd.net/ugc/12076372952085384369/7AAAC90F9DEA02181CD279217BEE86A4F4846ACF/",
      points = 9,
      restrictions = {
        include = {
          unit = {
            "Saber-Class Tank",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["PORTABLE SCANNER"] = {
      name = "Portable Scanner",
      image = "https://steamusercontent-a.akamaihd.net/ugc/9364238650847600159/DC2666F9D8630D77DF25B6ACD52083D350CD926D/",
      points = 6,
      restrictions = {
        override = {
          unit = {
            "B1 Battle Droids",          
          },        
        },      
      },
      type = "Gear",
    },
    ["PREPARED SUPPLIES"] = {
      name = "Prepared Supplies",
      image = "https://steamusercontent-a.akamaihd.net/ugc/15123875138493055282/186AF8D3483E44991F4BF5405DE6A84C4BF9664B/",
      points = 5,
      type = "Gear",
    },
    ["PROGRAMMED LOYALTY"] = {
      name = "Programmed Loyalty",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148692470/2BD6DDB57A0387833FB43044131859D281EBD909/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "Imperial Dark Troopers",          
          },        
        },      
      },
      type = "Programming",
    },
    ["PROTECTOR"] = {
      name = "Protector",
      image = "https://steamusercontent-a.akamaihd.net/ugc/16502499181280123877/013B5483D56B59EC250FE6A45B2DED594E1BF45F/",
      points = 5,
      type = "Training",
    },
    ["PROTON CHARGE SABOTEUR"] = {
      name = "Proton Charge Saboteur",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384857685/BBFA286A722F4FD50AB0DADDBF343A6CBC9EB79F/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541173465/8193FD1F0862270CD23BA9243679840BE6324DC6/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541173570/3C100E92F0DEDEF117D3A0392D3271951BC90DD0/",      
      },
      points = 20,
      restrictions = {
        include = {
          unit = {
            "Rebel Commandos",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["PYKE SYNDICATE CAPO"] = {
      name = "Pyke Syndicate Capo",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638580/65166B7E91103AD7B1F26E197338FD01B98E7591/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420351237/706DEA645FEE2EC9787F05F4FF2926632E2C4894/",      
      },
      leader = true,
      points = 18,
      restrictions = {
        include = {
          unit = {
            "Pyke Syndicate Foot Soldiers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["PYKE SYNDICATE FOOT SOLDIER"] = {
      name = "Pyke Syndicate Foot Soldier",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638523/E0BF45AC2918D78E53F39A4EB61372E0FBD24AF5/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845389/0D7DFE0C5BF5CDD527A619B75A25A2177D417BD0/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",      
      },
      points = 9,
      restrictions = {
        include = {
          unit = {
            "Pyke Syndicate Foot Soldiers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["R4 ASTROMECH"] = {
      name = "R4 Astromech",
      image = "https://steamusercontent-a.akamaihd.net/ugc/14559987992750624971/2375A1517931DC8EED5B089C148489744B81A868/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/949599512594492173/DDA1CC3AEEC3D5ADB3B04F35125EE8A6FB7EB93A/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/949599512594267919/F44B2C3C810757626C7A4A61DAA7F2BC2BEECFC6/",      
      },
      points = 9,
      restrictions = {
        include = {
          faction = {
            "Empire",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["RPS-6 ARF TROOPER"] = {
      name = "RPS-6 ARF Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/12717002306739299639/3A8542FCC457C05E120FB9E59AD8BA4D1551DFE6/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/16428815149645590/1B9C028584B5A7DCD488AE1E9C57D33A1B93C92E/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/16428815149646251/ADB16A6BF3CADD49D0237A4AB51FB4D7AF0AB521/",      
      },
      points = 24,
      restrictions = {
        include = {
          unit = {
            "ARF Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["RPS-6 CLONE TROOPER"] = {
      name = "RPS-6 Clone Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384857930/2CEB66226D92B8B803D3654A7F59977A0D0B6BA2/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/767228764785603568/BB31C6873BD81E6B5B6F6D41B907DA95421063F0/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/767228764785565294/2AA6ABC62F52DCD30C56D5DED210C35E7B4FD526/",      
      },
      points = 21,
      restrictions = {
        include = {
          unit = {
            "Clone Trooper Infantry",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["RPS-6 MAGNAGUARD"] = {
      name = "RPS-6 MagnaGuard",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139933591/76EA9AB16AFB8FD6B3DA57A31F40EEF7150F38E1/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1621849308236386787/E93D6E65A61C9262B5934C5A419736B45B50D75B/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/1621849538641208262/A0E48F7D9C94617C81BAD4D649717BAC7A8B9B64/",      
      },
      points = 40,
      restrictions = {
        include = {
          unit = {
            "IG-100 MagnaGuard",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["RPS-6 ROCKET GUNNER"] = {
      name = "RPS-6 Rocket Gunner",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140089557/0F4A5F58A50BD239C6C28FD362B36112B2E3BA40/",
      points = 21,
      restrictions = {
        include = {
          unit = {
            "X-34 Landspeeder",          
          },        
        },      
      },
      type = "Crew",
    },
    ["RT-97C BLASTER RIFLE"] = {
      name = "RT-97C Blaster Rifle",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140107008/1524B081B7155F22B18F85E7789813478AE6EA3C/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "Dewback Rider",          
          },        
        },      
      },
      type = "Armament",
    },
    ["RT-97C STORMTROOPER"] = {
      name = "RT-97C Stormtrooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140097529/6BD2F13FA6AB3A56E258254420005E9EB38C7C0B/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141221/5D4DAEED517F52EE2ECBC631301C97422F519AB9/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141746/A8FD77EB51C50C64CD924BDAEEDB70D8839E0EF3/",      
      },
      points = 24,
      restrictions = {
        include = {
          unit = {
            "Stormtroopers",
            "Stormtroopers Heavy Response Unit",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["RADIATION CANNON B1 BATTLE DROID"] = {
      name = "Radiation Cannon B1 Battle Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139933524/FFF766FA4F641B413DF8E7BC37DB6088B7F31358/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/767228764785008444/482C29486FD00312B2C7848D26A82793BCDF7D7F/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/767228764784997566/39300970854603B1F1539C46D70CC21280E278FF/",      
      },
      points = 16,
      restrictions = {
        include = {
          unit = {
            "B1 Battle Droids",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["RAIDING PARTY LEADER"] = {
      name = "Raiding Party Leader",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638497/FA19544838EC45188131DAA0750684C57267D3B9/",
      points = 10,
      restrictions = {
        include = {
          unit = {
            "A-A5 Speeder Truck",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["RANGE TROOPER"] = {
      name = "Range Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140107049/41E44A7B3EEAA1EAC25BB17B1565C80E1C84C1D9/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682669758/7E6C79BDA776AD0618FF66FCD961C59DD6B0F4F1/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682582649/F03C73249983DDC1178314FD61C7D53DA27840EE/",      
      },
      points = 15,
      restrictions = {
        include = {
          unit = {
            "Range Troopers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["REBEL COMMS TECHNICIAN"] = {
      name = "Rebel Comms Technician",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140087441/1E88F5C5944887DA1471BA18283D3373A1CFD68A/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/949599512594474909/F8F049D7F88171ADBA83AF3EAF819495053C2873/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/949599512594268734/CF3C536F7B068020A99C5E3EE11CA9C54438E250/",      
      },
      points = 9,
      restrictions = {
        include = {
          faction = {
            "Rebel",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["REBEL MARKSMAN"] = {
      name = "Rebel Marksman",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140087495/6457AE581E595160FCFCADFED8B8B6F19F25A68E/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/2508033889680570051/845658287FF6EADD0F2B31B94ABC4899A09475EE/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/2508033889680570231/D122EECC159E02264D024421EB7767BEA8E70F21/",      
      },
      points = 28,
      restrictions = {
        include = {
          unit = {
            "Rebel Sleeper Cell",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["REBEL OFFICER"] = {
      name = "Rebel Officer",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140088186/0366C06A9E09B953E9B8557F671300731E83A209/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780862726770/62FECAB3FED284E098751CC3BBC70C4CFF828A58/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780862727097/DE589901F66E4079D82BA2C819672F622A5D7240/",      
      },
      leader = true,
      points = 16,
      restrictions = {
        include = {
          faction = {
            "Rebel",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["REBEL TROOPER"] = {
      name = "Rebel Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140088390/D15BD2F8088BB8162C050F2D1DB26CCEBA5E9CBB/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780862761532/2FB3D83FC2BD077F4ADE619382382B9A59CD0ABE/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780862750426/2563904D7561144EE85EBCD3E07D68F48D8DD034/",      
      },
      points = 7,
      restrictions = {
        include = {
          unit = {
            "Rebel Troopers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["REBEL TROOPER CAPTAIN"] = {
      name = "Rebel Trooper Captain",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140088271/76AF8576BFC2E7EED7B065DB76A83688C13BD43A/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/766102173464670173/ECC18FB91315A55181F38A6899122E005460C688/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/766102173464683373/FE0A29CF1A46E7F97FEAE0C9FD665AB192A8D9A8/",      
      },
      leader = true,
      points = 9,
      restrictions = {
        include = {
          unit = {
            "Rebel Troopers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["REBEL TROOPER SPECIALIST"] = {
      name = "Rebel Trooper Specialist",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140088307/7C272AB0828A4D728C3D1C0E487F686817D5B542/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/766102173464719285/839B79B3594F31585EB38763EDF43AD32E46F37F/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/766102173464692456/FD09533718942CE5B08526B2CD1A00D5D38CB734/",      
      },
      points = 8,
      restrictions = {
        include = {
          unit = {
            "Rebel Troopers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["REBEL TROOPER SQUAD"] = {
      name = "Rebel Trooper Squad",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140088345/8469135908290D4083FD268CA0E02EEB5B69A81F/",
      minis = {
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780862752262/41BD6AB8B17AB7449226A3D80EF186EB8ABA3952/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780862750426/2563904D7561144EE85EBCD3E07D68F48D8DD034/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780862764799/98CBD8B4DD0C08CFA01A8E6C8B5A70A137804EAB/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780862750426/2563904D7561144EE85EBCD3E07D68F48D8DD034/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780862755846/CD522BCA5D6E918E13A3FF593D7212FF4B0E79CA/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780862750426/2563904D7561144EE85EBCD3E07D68F48D8DD034/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780862764799/98CBD8B4DD0C08CFA01A8E6C8B5A70A137804EAB/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780862750426/2563904D7561144EE85EBCD3E07D68F48D8DD034/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780862755846/CD522BCA5D6E918E13A3FF593D7212FF4B0E79CA/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780862750426/2563904D7561144EE85EBCD3E07D68F48D8DD034/",
        },      
      },
      points = 45,
      restrictions = {
        include = {
          unit = {
            "Rebel Troopers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["REBEL VETERAN"] = {
      name = "Rebel Veteran",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140089489/88E830A8F6CC5CC3F6589C7F5D6680AF2006DC5F/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192589/466305BFF474DBAB11F58FA13B3F4ACC9BB7127C/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192135/526538CE10AC6856578996BE6B8AB7263D32D5C7/",      
      },
      points = 9,
      restrictions = {
        include = {
          unit = {
            "Rebel Veterans",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["REBEL VETERAN SQUAD"] = {
      name = "Rebel Veteran Squad",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140088439/DAD81738594065C60010622C47AC9FC71021F2E9/",
      minis = {
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192232/D15615AF2A0F4F4887E9BD3DFFA141C8ACCCEC78/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192135/526538CE10AC6856578996BE6B8AB7263D32D5C7/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192402/4D1858AA566FEEE91774E40B10C233AAD8C381D5/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192135/526538CE10AC6856578996BE6B8AB7263D32D5C7/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192498/BF583EA43B457E816CDE323C172B2F4558B7A8BD/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192135/526538CE10AC6856578996BE6B8AB7263D32D5C7/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192402/4D1858AA566FEEE91774E40B10C233AAD8C381D5/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192135/526538CE10AC6856578996BE6B8AB7263D32D5C7/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192498/BF583EA43B457E816CDE323C172B2F4558B7A8BD/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192135/526538CE10AC6856578996BE6B8AB7263D32D5C7/",
        },      
      },
      points = 63,
      restrictions = {
        include = {
          unit = {
            "Rebel Veterans",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["RECKLESS DRIVER"] = {
      name = "Reckless Driver",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568144930/910352F2AA646B8E97628B4DF56C364805ABD906/",
      points = 12,
      restrictions = {
        include = {
          unit = {
            "A-A5 Speeder Truck",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["RECON INTEL"] = {
      name = "Recon Intel",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13884509065011813667/94DC6344FD7E9D9860530CA21D7F80375C9D19C7/",
      points = 2,
      type = "Gear",
    },
    ["REFURBISHED \"GONK\" DROID"] = {
      name = "Refurbished \"Gonk\" Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568144996/C187B41FE3AE53493F4A9AA23B0F74B795F9B2C3/",
      points = 14,
      restrictions = {
        include = {
          unit = {
            "A-A5 Speeder Truck",
            "X-34 Landspeeder",          
          },        
        },      
      },
      type = "Crew",
    },
    ["ROOK KAST"] = {
      name = "Rook Kast",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638438/ECEE74FD265762CEC44438C9D0C5FF263009C3F2/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1789640371719006177/3A456EB29012BFBE4322E020CBC08CF6F915BBF3/",      
      },
      leader = true,
      points = 35,
      restrictions = {
        include = {
          unit = {
            "Mandalorian Super Commandos",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["RYDER AZADI"] = {
      name = "Ryder Azadi",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140089640/792212C26B25488AA9E9CED4F8772D8549162630/",
      points = 5,
      restrictions = {
        include = {
          faction = {
            "Rebel",          
          },
          type = {
            "Repulsor Vehicle",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["SM-9 FRAG LAUNCHER"] = {
      name = "SM-9 Frag Launcher",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148692274/A56AA57889F61A9BDE9C1C7338B023C30BF7108B/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2004698291313161010/1873BCD554A553BC2FF25A2BE16116EDEBFDCEF4/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2004698291313176203/E77892ADB668EA0CB548F6ED71BE44CA3FB730E7/",      
      },
      points = 45,
      restrictions = {
        include = {
          unit = {
            "Imperial Dark Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["SX-21 TROOPER"] = {
      name = "SX-21 Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140090364/742815B4FE24A223EC893A9697A6CA8C284A7377/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/766102173464725382/9DADA91B7A5BE8DEEC1BDE838B3140A350D661A4/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/766102173464726852/2ABBCC6938695708489FB87C27C6B7481A1D294A/",      
      },
      points = 15,
      restrictions = {
        include = {
          unit = {
            "Rebel Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["SABER THROW"] = {
      name = "Saber Throw",
      image = "https://steamusercontent-a.akamaihd.net/ugc/14367574201845804889/D5DB44897C38C9633AC5168A038FFEA4F7119A0E/",
      points = 5,
      type = "Force",
    },
    ["SABINE'S COMBAT SHIELD"] = {
      name = "Sabine's Combat Shield",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140089761/CCEBC0B6763DAA8C50AFA2DDA8E17AACD0A0F147/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "Sabine Wren",          
          },        
        },      
      },
      type = "Gear",
    },
    ["SAXON'S COMBAT SHIELD"] = {
      name = "Saxon's Combat Shield",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638398/E7F27B6FC186179E16B72827C7E7C6B67C53E233/",
      points = 10,
      restrictions = {
        include = {
          unit = {
            "Gar Saxon",          
          },        
        },      
      },
      type = "Gear",
    },
    ["SAXON'S GALAR-90 RIFLE"] = {
      name = "Saxon's Galar-90 Rifle",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638360/9640DCEEFC8C952C5828F120F9527886B6AD1AEB/",
      points = 15,
      restrictions = {
        include = {
          unit = {
            "Gar Saxon",          
          },        
        },      
      },
      type = "Armament",
    },
    ["SAXON'S JETPACK ROCKETS"] = {
      name = "Saxon's Jetpack Rockets",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638324/2B2554057A17324B946ADF61B44CFB94081A770D/",
      points = 10,
      restrictions = {
        include = {
          unit = {
            "Gar Saxon",          
          },        
        },      
      },
      type = "Armament",
    },
    ["SAXON'S ZX FLAME PROJECTOR"] = {
      name = "Saxon's ZX Flame Projector",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638292/3120A41DA39C3D76C2B2584CB20390E4D8FE90D4/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "Gar Saxon",          
          },        
        },      
      },
      type = "Armament",
    },
    ["SCATTER GUN ENFORCER"] = {
      name = "Scatter Gun Enforcer",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638229/542B7031B727D74585CE7FA38EEA086252152001/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143685/C75388115AFCF42ACC79E2C16FEF36755C975AA0/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143328/3D6F3C2E8DFB78B9B748FFC8F339B9C568D7408E/",      
      },
      points = 28,
      restrictions = {
        include = {
          unit = {
            "Black Sun Enforcers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["SCATTER GUN TROOPER"] = {
      name = "Scatter Gun Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140089843/7386BFA25F833C0D475BDF1DC2C4089A9E533457/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540540671094/4A4BCE6286ACB413B661F827BB00B920617F3E91/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670760/47DF3E87B3F71E8EA42A89ECFE96E4FB3990D7ED/",      
      },
      points = 22,
      restrictions = {
        include = {
          unit = {
            "Fleet Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["SECRET INGREDIENTS"] = {
      name = "Secret Ingredients",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140104858/F33E3DEECEB2996128560B29C8E41C38B84EB371/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "Logray",          
          },        
        },      
      },
      type = "Training",
    },
    ["SEIZE THE INITIATIVE"] = {
      name = "Seize The Initiative",
      image = "https://steamusercontent-a.akamaihd.net/ugc/15625749152448275367/CF9CACC1FA903168B23F5EACE6E091603EF4D0BA/",
      points = 5,
      restrictions = {
        include = {
          rank = {
            "Commander",
            "Operative",          
          },        
        },      
      },
      type = "Training",
    },
    ["SHORETROOPER"] = {
      name = "Shoretrooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13031343564930773334/77BF73703B9A90783AF7E3EDFF92D9E4D0BEC1B4/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359682702688256/B266465186713632AE14D6B4B473AB4E94814685/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687694/C12AAE8B7F487BE4C1545E253AB3C026E0426AA1/",      
      },
      points = 10,
      restrictions = {
        include = {
          unit = {
            "Shoretroopers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["SHORETROOPER SQUAD"] = {
      name = "Shoretrooper Squad",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384858102/00DDE771662593B3F43BC45184C018F11A5966BF/",
      minis = {
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687570/0D2A602282BAACDCE665EF9D1D65CEA413944083/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687694/C12AAE8B7F487BE4C1545E253AB3C026E0426AA1/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359682702688133/C8D721D29D711045A27EEC3868D4B7A111C86F20/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687694/C12AAE8B7F487BE4C1545E253AB3C026E0426AA1/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687282/B02342FDEEE7DDE82DF96EB434B1D033B0A4C899/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687694/C12AAE8B7F487BE4C1545E253AB3C026E0426AA1/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359682702688133/C8D721D29D711045A27EEC3868D4B7A111C86F20/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687694/C12AAE8B7F487BE4C1545E253AB3C026E0426AA1/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687282/B02342FDEEE7DDE82DF96EB434B1D033B0A4C899/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687694/C12AAE8B7F487BE4C1545E253AB3C026E0426AA1/",
        },      
      },
      points = 70,
      restrictions = {
        include = {
          unit = {
            "Shoretroopers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["SHRIV SUURGAV"] = {
      name = "Shriv Suurgav",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140089939/0B2428B8D00A6B3DED4916E7AA55D7940CB1DFA9/",
      points = 10,
      restrictions = {
        include = {
          faction = {
            "Rebel",          
          },
          rank = {
            "Heavy",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["SITUATIONAL AWARENESS"] = {
      name = "Situational Awareness",
      image = "https://steamusercontent-a.akamaihd.net/ugc/17536138674603170323/AE86A4AB47B30D6BBC2DAFCC1E760AF8CCCB0F8E/",
      points = 4,
      type = "Training",
    },
    ["SMOKE GRENADES"] = {
      name = "Smoke Grenades",
      image = "https://steamusercontent-a.akamaihd.net/ugc/15223973175401373403/AB9C869FE463738878D0DFE6EF14529452DD08DD/",
      points = 3,
      type = "Grenades",
    },
    ["SNOWTROOPER"] = {
      name = "Snowtrooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140097669/E2D49A07E0E56FD07EC247313240A3D7C6ABE50D/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801717/EDEA1301FC55A6970D5FBCF0A9F10456E4C2EE40/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801215/595165C57A67BF2BD505BE6F0DF8F11AD4EA55D2/",      
      },
      points = 8,
      restrictions = {
        include = {
          unit = {
            "Snowtroopers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["SNOWTROOPER SQUAD"] = {
      name = "Snowtrooper Squad",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140097587/A54CEC5E18DF9FB2F3C6A5B01DD6D2043D4BE27B/",
      minis = {
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801837/D52F333945BF667A37E06611977C36186CEFC7B6/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801215/595165C57A67BF2BD505BE6F0DF8F11AD4EA55D2/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801500/728C586E21D0A4EBD8DE54EEF4E097EFEEECE871/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801215/595165C57A67BF2BD505BE6F0DF8F11AD4EA55D2/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801363/743D9E272367ABB1F6296D5EFB6010637C58D5E4/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801215/595165C57A67BF2BD505BE6F0DF8F11AD4EA55D2/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801500/728C586E21D0A4EBD8DE54EEF4E097EFEEECE871/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801215/595165C57A67BF2BD505BE6F0DF8F11AD4EA55D2/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801363/743D9E272367ABB1F6296D5EFB6010637C58D5E4/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801215/595165C57A67BF2BD505BE6F0DF8F11AD4EA55D2/",
        },      
      },
      points = 46,
      restrictions = {
        include = {
          unit = {
            "Snowtroopers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["SONIC CANNON WARRIOR"] = {
      name = "Sonic Cannon Warrior",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139933665/6D7AF85CB42A453D1AAD2B1B4DD03F00BD9C66CF/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177195589/5E52A1E47746FF179ED6327F681D51D92C47D1D5/",      
      },
      points = 25,
      restrictions = {
        include = {
          unit = {
            "Geonosian Warriors",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["SONIC CHARGE SABOTEUR"] = {
      name = "Sonic Charge Saboteur",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140103507/922568C5FAACC25FCE80574BE5459CB511022824/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/950714557093539716/6A0D63306F505A074395AFA61EB990280DB8995D/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/950714557093539899/FF7A535E91BF79D4C3E0D55E874C1ACEB6FBF434/",      
      },
      points = 23,
      restrictions = {
        include = {
          unit = {
            "Scout Troopers",          
          },        
        },      
      },
      additionalObjects = {
        "Proton Charge Token",      
      },
      type = "Heavy Weapon",
    },
    ["SONIC IMPLODERS"] = {
      name = "Sonic Imploders",
      image = "https://steamusercontent-a.akamaihd.net/ugc/9365292732961081475/6E1280991DDA4A40FD4B58948CCCEB2FBDD23C1A/",
      points = 3,
      type = "Grenades",
    },
    ["SPOTTER UPLINK"] = {
      name = "Spotter Uplink",
      image = "https://steamusercontent-a.akamaihd.net/ugc/14924322567155862762/F2A27A192FD49D879842AF20650351B03ACB0AFB/",
      points = 3,
      type = "Comms",
    },
    ["STORMTROOPER"] = {
      name = "Stormtrooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140097931/DB288D0B28104E95465A3ED5D12C65D527876F54/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650140825/D8AE1D1F27B97F359916236DA163DA7EC4B517C1/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141746/A8FD77EB51C50C64CD924BDAEEDB70D8839E0EF3/",      
      },
      points = 8,
      restrictions = {
        include = {
          unit = {
            "Stormtroopers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["STORMTROOPER CAPTAIN"] = {
      name = "Stormtrooper Captain",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140097752/7B066902F66EB65B14B17D9170987270B5C9B0BA/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650140913/ADEED3994E6F70777B939A89B18FF520765DCDC4/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141746/A8FD77EB51C50C64CD924BDAEEDB70D8839E0EF3/",      
      },
      leader = true,
      points = 10,
      restrictions = {
        include = {
          unit = {
            "Stormtroopers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["STORMTROOPER MARKSMAN"] = {
      name = "Stormtrooper Marksman",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140177027/4884AC61C97A4ACD22A03F85D95CA468DE75886E/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2491137781649838294/7197479F9D7ADF9DB1287E740A469A0E5C28F2ED/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2491137781649821736/A6557A52AB579A320023B7028C55A38815DC566E/",      
      },
      points = 30,
      restrictions = {
        include = {
          unit = {
            "Stormtrooper Riot Squad",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["STORMTROOPER SPECIALIST"] = {
      name = "Stormtrooper Specialist",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140097824/D6788FE32981247191B9A68F92DA96DAFDC3B47E/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141284/6D59924E68B2B1640C0AC479B8DE95F434056650/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141746/A8FD77EB51C50C64CD924BDAEEDB70D8839E0EF3/",      
      },
      points = 9,
      restrictions = {
        include = {
          unit = {
            "Stormtroopers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["STORMTROOPER SQUAD"] = {
      name = "Stormtrooper Squad",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140097883/0F0DF0E194F55384AE82D7F9A1CEA4EC7597CF42/",
      minis = {
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141545/30BEFE4E87E379AA361AFF5FD24A8F5D3F0BA4C0/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141746/A8FD77EB51C50C64CD924BDAEEDB70D8839E0EF3/",
        },
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141624/1366A6A4D84D9FE597EEA2736AFC187F392418DA/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141746/A8FD77EB51C50C64CD924BDAEEDB70D8839E0EF3/",
        },
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141692/8E06789B4D2003055108ED85D76E875729254757/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141746/A8FD77EB51C50C64CD924BDAEEDB70D8839E0EF3/",
        },
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141624/1366A6A4D84D9FE597EEA2736AFC187F392418DA/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141746/A8FD77EB51C50C64CD924BDAEEDB70D8839E0EF3/",
        },
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141692/8E06789B4D2003055108ED85D76E875729254757/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141746/A8FD77EB51C50C64CD924BDAEEDB70D8839E0EF3/",
        },      
      },
      points = 46,
      restrictions = {
        include = {
          unit = {
            "Stormtroopers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["STRICT ORDERS"] = {
      name = "Strict Orders",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13144615001636608131/4F2C4FF797BFB30D3FA835BE743C20EF7A1D333A/",
      points = 5,
      type = "Command",
    },
    ["STRIKE TEAM LEADER"] = {
      name = "Strike Team Leader",
      image = "https://steamusercontent-a.akamaihd.net/ugc/11456350745801770677/274AAA3D006877A45E7B114490584831707AB694/",
      points = 5,
      restrictions = {
        include = {
          rank = {
            "Operative",          
          },        
        },      
      },
      type = "Training",
    },
    ["STRIKE AND FADE"] = {
      name = "Strike and Fade",
      image = "https://steamusercontent-a.akamaihd.net/ugc/12387238698929923109/8DC11627ECA9A969FEBA8E2741FA455AA20FF62C/",
      points = 5,
      restrictions = {
        include = {
          type = {
            "Repulsor Vehicle",          
          },        
        },      
      },
      type = "Training",
    },
    ["SUPER COMMANDO COMBAT SHIELDS"] = {
      name = "Super Commando Combat Shields",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638051/2EB1F2BA6DC3BB022D0E9D04FAA77BEF7DE474E9/",
      points = 10,
      restrictions = {
        include = {
          unit = {
            "Mandalorian Super Commandos",          
          },        
        },      
      },
      type = "Gear",
    },
    ["SUPER COMMANDO GUNSLINGER"] = {
      name = "Super Commando Gunslinger",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638185/062D34CA1E85F91921AE17FA20FADC622E3F1591/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143366/41AB7DFFD2FCF20E2BCC3F899F728863C30F6343/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/1789640371717200823/B886D3157AA2F2528F4E5F76F26DF44A41496615/",      
      },
      points = 38,
      restrictions = {
        include = {
          unit = {
            "Mandalorian Super Commandos",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["SUPER COMMANDO JETPACK ROCKETS"] = {
      name = "Super Commando Jetpack Rockets",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638126/810C46F8A1B873A7CFFBDC1DDDEE400DFC3AF388/",
      points = 8,
      restrictions = {
        include = {
          unit = {
            "Mandalorian Super Commandos",          
          },        
        },      
      },
      type = "Armament",
    },
    ["SUPER COMMANDO MARKSMAN"] = {
      name = "Super Commando Marksman",
      image = "https://steamusercontent-a.akamaihd.net/ugc/15709592670795104171/ACE59DD60752ACF052681409AEBE159D7C400AFE/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143451/3DFD9C8BD5D504D3A2F7934678D1A0A7C2285863/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/1789640371717200769/60353F40BAE6D92D6F6ED24E2883EB9CC2EA74C4/",      
      },
      points = 28,
      restrictions = {
        include = {
          unit = {
            "Mandalorian Super Commandos",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["T-21 BLASTER RIFLE"] = {
      name = "T-21 Blaster Rifle",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140107073/9B787B4695966A18D0659B28A979EBEFFA1C29BD/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "Dewback Rider",          
          },        
        },      
      },
      type = "Armament",
    },
    ["T-21 SPECIAL FORCES TROOPER"] = {
      name = "T-21 Special Forces Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140103559/F3FC1C02320B5F60D4A041140E0637BD0C0EE86A/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1618438238123000906/C64EAD02CA22F8BFB59320925DAD7D89BA1E7AD6/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/1618438238123043414/B7E9660E470DC070545782406C29F1E1356A5685/",      
      },
      points = 27,
      restrictions = {
        include = {
          unit = {
            "Imperial Special Forces",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["T-21 STORMTROOPER"] = {
      name = "T-21 Stormtrooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140098050/4A82E8EF8A7B04EFF91757E70C88282919912093/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141339/1EB723D5FCF6655CFFF7EF700EE7108274E1A6C7/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141746/A8FD77EB51C50C64CD924BDAEEDB70D8839E0EF3/",      
      },
      points = 22,
      restrictions = {
        include = {
          unit = {
            "Stormtroopers",
            "Stormtroopers Heavy Response Unit",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["T-21A RANGE TROOPER"] = {
      name = "T-21A Range Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148701863/275BF33D3FD2CC6BCE759757AB74CEB8C940788F/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682669896/C2F5892D64B3B5CE33A83A3F874C1A66594F6412/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682582649/F03C73249983DDC1178314FD61C7D53DA27840EE/",      
      },
      points = 28,
      restrictions = {
        include = {
          unit = {
            "Range Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["T-21B SHORETROOPER"] = {
      name = "T-21B Shoretrooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/15356402076507157215/7BFF6CA98FAB03189CEA985CA8A892BDF7207BEC/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687816/8C17AF1D2344B7E8B1C8D34A0F2228E9ADC2FFAA/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687407/D5B685EA41E9C664F2D16381474B5F08DF9CFAE5/",      
      },
      points = 32,
      restrictions = {
        include = {
          unit = {
            "Shoretroopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["T-7 ION SNOWTROOPER"] = {
      name = "T-7 Ion Snowtrooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140097979/9F3CCF24FCF1D8F02F5B9CEEF9B8B4B157295F2F/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541802160/69A03779E6B67F6F547C2FBD70ACDFC39281387D/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541802252/037749C730FACCA3361B041BCB3C68E7E19DCDF8/",      
      },
      points = 24,
      restrictions = {
        include = {
          unit = {
            "Snowtroopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["T-SERIES TACTICAL DROID"] = {
      name = "T-Series Tactical Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139934011/3AA1AB05A592268E4C08E2CEAFB6B9B143105470/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809185719/FF120BC2FA5DC8258021E2849C2B81591CCA36B9/",      
      },
      leader = true,
      points = 18,
      restrictions = {
        include = {
          type = {
            "Droid Trooper",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["T-SERIES TACTICAL DROID PILOT"] = {
      name = "T-Series Tactical Droid Pilot",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139933742/5DA785FEB16866F613EF45A9998324B648F28026/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "AAT Battle Tank",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["TARGETING SCOPES"] = {
      name = "Targeting Scopes",
      image = "https://steamusercontent-a.akamaihd.net/ugc/17003971957433179861/711F8AAE5EAC0E70AF2B911805EFE33CA2E2A97C/",
      points = 4,
      type = "Gear",
    },
    ["TECH"] = {
      name = "Tech",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134145194/EA026AF5A84A9F1E34CCC601A39DF61B36D664CA/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2475370743175244098/67CBDAB9CA48B24940FC743CEB778A526C990993/",      
      },
      points = 0,
      restrictions = {
        include = {
          unit = {
            "The Bad Batch",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["TENACITY"] = {
      name = "Tenacity",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13667627159132611482/8C1C77825EEAB8D7099989FAF8A583725D8D9127/",
      points = 6,
      type = "Training",
    },
    ["TERROR"] = {
      name = "Terror",
      image = "https://steamusercontent-a.akamaihd.net/ugc/9638503798572904032/DD40B411FE4834EA82A7355EAF3EE268084977FA/",
      points = 6,
      restrictions = {
        include = {
          alignment = {
            "Dark",          
          },        
        },      
      },
      type = "Force",
    },
    ["THE DARKSABER"] = {
      name = "The Darksaber",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140090412/816EE4F5B469EC8334D0E84042E5C008FC67B04B/",
      points = 15,
      restrictions = {
        include = {
          unit = {
            "Sabine Wren",          
          },        
        },      
      },
      type = "Armament",
    },
    ["THE DARKSABER (GIDEON)"] = {
      name = "The Darksaber (Gideon)",
      image = "https://steamusercontent-a.akamaihd.net/ugc/16625983135926386325/491ADB4AF793015C774CBB05E327DFBB53A59E7B/",
      points = 15,
      restrictions = {
        include = {
          unit = {
            "Moff Gideon",          
          },        
        },      
      },
      type = "Armament",
    },
    ["THE DARKSABER (MAUL)"] = {
      name = "The Darksaber (Maul)",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148637945/3B49E86E68EBCB65154B12ECD4336463F7400B95/",
      points = 10,
      restrictions = {
        include = {
          unit = {
            "Maul",          
          },        
        },      
      },
      type = "Armament",
    },
    ["TRANQUILITY"] = {
      name = "Tranquility",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13728641352656300834/760A9CB4F241747DDB209C777746D41774518994/",
      points = 10,
      type = "Force",
    },
    ["TRISTAN WREN"] = {
      name = "Tristan Wren",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140090454/E3ADEFEA3EA70EEA160F391208AA8EE822DF1278/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809185988/83F7A4664576B192905C6393A6D9A5DAA776E01A/",      
      },
      points = 34,
      restrictions = {
        include = {
          unit = {
            "Mandalorian Resistance",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["TRUSTED AGENT"] = {
      name = "Trusted Agent",
      image = "https://steamusercontent-a.akamaihd.net/ugc/17954061666704112600/9401A70D88A98BA9FC5B5D8E56B0FA7F3B95961B/",
      points = 5,
      type = "Command",
    },
    ["TWIN BEAM CANNONS"] = {
      name = "Twin Beam Cannons",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135344651/FF1F346F4BC8D5A517747C10951F216DBF84A034/",
      points = 25,
      restrictions = {
        include = {
          unit = {
            "Infantry Support Platform",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["TWIN BLASTER CANNONS"] = {
      name = "Twin Blaster Cannons",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2491139050708067017/3B8BBCCFB6181F624CFF09DA5C4F762815CA4983/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "LM-432 Crab Droid",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["TWIN BLASTER CANNONS (ISP)"] = {
      name = "Twin Blaster Cannons (ISP)",
      image = "https://steamusercontent-a.akamaihd.net/ugc/14131708632610337124/66E8516A5E6EB1D1F90B8A835EB006A7EAB7F075/",
      points = 25,
      restrictions = {
        include = {
          unit = {
            "Infantry Support Platform",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["TWIN LASER TURRET"] = {
      name = "Twin Laser Turret",
      image = "https://steamusercontent-a.akamaihd.net/ugc/17399295105221231233/E6CA41DE7BAF2D58F8D86953FD25B3D431CFB80E/",
      points = 14,
      restrictions = {
        include = {
          unit = {
            "Saber-Class Tank",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["TWIN MISSILE PODS"] = {
      name = "Twin Missile Pods",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13940347858969613016/FC2F44AA892930B09D58A1259D9DABAC7CAB9488/",
      points = 25,
      restrictions = {
        include = {
          unit = {
            "Infantry Support Platform",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["UNDERWORLD CONNECTIONS"] = {
      name = "Underworld Connections",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13075491375596331661/7404D8A06A3E978E3729E9D32EE0EBA855FA18FF/",
      points = 5,
      type = "Command",
    },
    ["UNORTHODOX TACTICIAN"] = {
      name = "Unorthodox Tactician",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148637911/5E0AD27637C0A160099F5D36889082BD84E94BB1/",
      points = 16,
      restrictions = {
        include = {
          unit = {
            "A-A5 Speeder Truck",          
          },        
        },      
      },
      type = "Crew",
    },
    ["UNSTABLE R5 ASTROMECH"] = {
      name = "Unstable R5 Astromech",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148637860/93B0991DD63C226FA855DA5D2320F2372792BD7C/",
      points = 6,
      restrictions = {
        include = {
          unit = {
            "A-A5 Speeder Truck",
            "X-34 Landspeeder",          
          },        
        },      
      },
      type = "Crew",
    },
    ["UP CLOSE AND PERSONAL"] = {
      name = "Up Close and Personal",
      image = "https://steamusercontent-a.akamaihd.net/ugc/9232863277993940777/071132D1F5F4BF88B379A1BF94EB78ED4D9559BA/",
      points = 8,
      type = "Training",
    },
    ["URSA WREN"] = {
      name = "Ursa Wren",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140090523/750235F212F45721D81F9776FD957A26D40B3AC5/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809186071/A6DB57CF6BA2EEDAB6EB8A719DB8D0702708C759/",      
      },
      leader = true,
      points = 34,
      restrictions = {
        include = {
          unit = {
            "Mandalorian Resistance",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["VETERAN CLONE PILOT"] = {
      name = "Veteran Clone Pilot",
      image = "https://steamusercontent-a.akamaihd.net/ugc/14161188831430230944/D58989E46F93F8F783C9305E8056941DD27C449E/",
      points = 7,
      restrictions = {
        include = {
          faction = {
            "Republic",          
          },
          rank = {
            "Heavy",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["VIGILANCE"] = {
      name = "Vigilance",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10166497509018197631/139646D733278E6B4FDD81AC4AC6D4A9CEE967C0/",
      points = 12,
      type = "Command",
    },
    ["VIPER RECON DROID"] = {
      name = "Viper Recon Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139934033/79C8D8FEC5E44ACAE43E0679E50A3B517ABD33A2/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809185784/C7B137C19E24986DBE1E9A2712676AB320E4B2A9/",      
      },
      points = 9,
      restrictions = {
        include = {
          type = {
            "Droid Trooper",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["WAXER"] = {
      name = "Waxer",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384858645/C13E3786197044E433A4CB9852C603CD7B4FC206/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446813135349/81275DD398B659088A018A09394B7FD6E5C3B279/",      
      },
      leader = true,
      points = 20,
      restrictions = {
        include = {
          type = {
            "Clone Trooper",          
          },
          rank = {
            "Corps",          
          },        
        },      
      },
      type = "Squad Leader",
    },
    ["WEDGE ANTILLES"] = {
      name = "Wedge Antilles",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140091023/B1341EA467EFD4D50C2D7C677E1422B2FC84A4AD/",
      points = 5,
      restrictions = {
        include = {
          faction = {
            "Rebel",          
          },
          type = {
            "Repulsor Vehicle",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["WRECKER"] = {
      name = "Wrecker",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134145231/9FC3E238C50C89E5B4036AC1275370BAEF3B3944/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2475370743175244156/4986205CB2289E6CF72269D9A17E6B2D405968DA/",      
      },
      points = 0,
      restrictions = {
        include = {
          unit = {
            "The Bad Batch",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["XS-IV ASSAULT CANNON"] = {
      name = "XS-IV Assault Cannon",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148692176/FE7C110B78061106AA1471FE6B6EE3BD5F645AE2/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2004698291313160948/23CA698C8F2AF1C08D2DED3564B138E72E2ABCBF/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2004698291313176203/E77892ADB668EA0CB548F6ED71BE44CA3FB730E7/",      
      },
      points = 45,
      restrictions = {
        include = {
          unit = {
            "Imperial Dark Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["Z-6 CLONE TROOPER"] = {
      name = "Z-6 Clone Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384858721/8DC71D0C54F4EC65A776B9E62F2F1E7263CA8724/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393876/DEDAF52B0D07E0F2A2BCB54DE9A56E4FA437A3E4/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393180/6359B491483DCD9B2641BA134DC4B92DE10E9D92/",      
      },
      points = 22,
      restrictions = {
        include = {
          unit = {
            "Clone Trooper Infantry",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["Z-6 TROOPER"] = {
      name = "Z-6 Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140091094/420B06E5C9EB605F3CF37DB609BE1961F8861B66/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780862734756/1F48FA301357905B28DA35A03658DFA39154DBFE/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780862736228/22D1A1ACC79493FE82165CC95A5E23170A4FBC5B/",      
      },
      points = 20,
      restrictions = {
        include = {
          unit = {
            "Rebel Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
  },
  commands = {
    ["AI COORDINATION"] = {
      name = "AI Coordination",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131524713/997729685C3711220AD15A620B602F572C0D83E7/",
      pip = 1,
      faction = "Separatist",
    },
    ["AGGRESSION"] = {
      name = "Aggression",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139727645/6DE7757843A4090ABC83D7A4A2A69526B8FEEA5D/",
      pip = 2,
      faction = "Generic",
    },
    ["AIR SUPPORT"] = {
      name = "Air Support",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134030778/90E5CEF9833FED1C5F926FB8878BDBCD5B5099F6/",
      pip = 2,
      faction = "Republic",
    },
    ["AMBUSH"] = {
      name = "Ambush",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865564037146/9E4C2F5453A9016854F388BB078666B71AC794B6/",
      pip = 1,
      faction = "Generic",
    },
    ["ARBOREAL ASSAULT"] = {
      name = "Arboreal Assault",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133750252/A4F22646BC91929E2F3E36D040C0A4D0F27F033D/",
      pip = 1,
      faction = "Rebel",
    },
    ["ASSAULT"] = {
      name = "Assault",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865564034224/40364C1DDCF973A233C4A8F7AD43734067014C06/",
      pip = 3,
      faction = "Generic",
    },
    ["ATTACK OF THE CLONES"] = {
      name = "Attack Of the Clones",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134033797/3AA33B36A7B9EAAC8444A6CAC176F2130EE30E6C/",
      pip = 3,
      faction = "Republic",
    },
    ["CONSTANTLY ALERT"] = {
      name = "Constantly Alert",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384868501/99A8C4CE7856BD520F6B2E6AC72B50B58C05C7A7/",
      pip = 3,
      faction = "Empire",
    },
    ["COORDINATED FIRE"] = {
      name = "Coordinated Fire",
      image = "https://steamusercontent-a.akamaihd.net/ugc/11160049064172830842/F5BA2BA3243EE715B976CFF0CF6645D9B34563D3/",
      pip = 3,
      faction = "Empire",
    },
    ["COURAGE OF THE REBELLION"] = {
      name = "Courage of the Rebellion",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133709102/E61A46B9D30667B88527057B1A64B625F3BACAC9/",
      pip = 2,
      faction = "Rebel",
    },
    ["COVERING FIRE"] = {
      name = "Covering Fire",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133709439/D3EB5EB8A70E3BD95C4FE7EDAB952C2A9830159F/",
      pip = 3,
      faction = "Rebel",
    },
    ["COVERT OBSERVATION"] = {
      name = "Covert Observation",
      image = "https://steamusercontent-a.akamaihd.net/ugc/11077054665663790039/843089A1DD7F8F54FE9CE60752F15FFC586B1DB2/",
      pip = 1,
      faction = "Empire",
    },
    ["DARING DEFENSE"] = {
      name = "Daring Defense",
      image = "https://steamusercontent-a.akamaihd.net/ugc/12871643868680759199/5CC33092968E7DE16416344B01D7BC76211DB23E/",
      pip = 3,
      faction = "Republic",
    },
    ["DEBARK FOR GROUND ASSAULT"] = {
      name = "Debark for Ground Assault",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384868777/F190CCA4D8E0732DDDC0C2BF6B14650B03C6DAA1/",
      pip = 3,
      faction = "Empire",
    },
    ["DEFIANCE"] = {
      name = "Defiance",
      image = "https://steamusercontent-a.akamaihd.net/ugc/14615871148955326200/5C4A46932D48C89AC97B650847429D97701993D7/",
      pip = 1,
      faction = "Republic",
    },
    ["DELAYING TACTICS"] = {
      name = "Delaying Tactics",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133709526/A9486B47C4C1BED73083F4069E794A86E0FF708D/",
      pip = 1,
      faction = "Rebel",
    },
    ["DISCRETION"] = {
      name = "Discretion",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139727608/7FBDB2A3BEECFA85A5AB92E6D6DEC029E779DB31/",
      pip = 3,
      faction = "Generic",
    },
    ["DRIVE THEM OUT"] = {
      name = "Drive Them Out",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384885638/0E4718AEA75A6E87988B03768F30D55BBAF150C6/",
      pip = 1,
      faction = "Empire",
    },
    ["FOR THE TRIBE"] = {
      name = "For the Tribe",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133750350/A56DBAF5154B106C429885A598899D03A3A37525/",
      pip = 3,
      faction = "Rebel",
    },
    ["GET IN POSITION"] = {
      name = "Get In Position",
      image = "https://steamusercontent-a.akamaihd.net/ugc/17056187462617014571/3898DDC0BF25F87D73C3F40CDA7AA52DDB6CD765/",
      pip = 2,
      faction = "Republic",
    },
    ["GRROOOOGRRRAAAAWRRRRRRRRMPH"] = {
      name = "Grroooogrrraaaawrrrrrrrrmph",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865564036626/BA48B6895086D9FA7DA76D6CC2CB6D625CD1B7C6/",
      pip = 1,
      faction = "Republic",
    },
    ["HIDING IN PLAIN SIGHT"] = {
      name = "Hiding in Plain Sight",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133750416/5EF67EC8B9A28231AA10411A62FF5DDD0A95EF51/",
      pip = 2,
      faction = "Rebel",
    },
    ["HOLD AT ANY COST"] = {
      name = "Hold at Any Cost",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133710068/45014708453E80B4389733FE14A889B5C99496EB/",
      pip = 3,
      faction = "Rebel",
    },
    ["LEAD FROM THE FRONT"] = {
      name = "Lead from the Front",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384886540/66FE45A7B081F95DE3DAD94BD3F419013A77A733/",
      pip = 2,
      faction = "Republic",
    },
    ["LEADERS OF THE 501ST"] = {
      name = "Leaders of the 501st",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384886698/41DC9E2547F47EEA11B6DEC9AE7AC677CF1FBAAD/",
      pip = 3,
      faction = "Republic",
    },
    ["LOG TRAPS"] = {
      name = "Log Traps",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133752458/BF28419A06690AC846A210B34221AC931BC890B6/",
      pip = 1,
      faction = "Rebel",
    },
    ["MROWGH GHRRMROWRIG!"] = {
      name = "MROWGH GHRRMROWRIG!",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865564035071/5DAC9F1B36A1D6CCF3DB6BF0CB95D9D548A79F30/",
      pip = 2,
      faction = "Republic",
    },
    ["MECHANIZED INCURSION"] = {
      name = "Mechanized Incursion",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131525764/985E35D1F4C14B36C2DDE31CD8426CD3F9499744/",
      pip = 1,
      faction = "Separatist",
    },
    ["ORBITAL STRIKE"] = {
      name = "Orbital Strike",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131525802/A728666B0EE576499983022E283BD20396880699/",
      pip = 2,
      faction = "Separatist",
    },
    ["OVERWHELMING BARRAGE"] = {
      name = "Overwhelming Barrage",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384886936/A2D77342B1EE6DD9E4413C3F2344E37694BD7CFB/",
      pip = 2,
      faction = "Empire",
    },
    ["PINNED DOWN"] = {
      name = "Pinned Down",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13986899663843994273/C86535A24E53CB437CF5E6DFB02A6FCF21E1EC63/",
      pip = 2,
      faction = "Empire",
    },
    ["PLOY"] = {
      name = "Ploy",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148677058/419EFF83F969C131102CF0C1B4407F7F9920EF30/",
      pip = 1,
      faction = "Generic",
    },
    ["PUSH"] = {
      name = "Push",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865564034819/0E3D77E869D24AD638EB438F92577F44368487D3/",
      pip = 2,
      faction = "Generic",
    },
    ["ROGER, ROGER!"] = {
      name = "Roger, Roger!",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131525839/61442FE7510A1E55554FABC1937020A1143104F1/",
      pip = 3,
      faction = "Separatist",
    },
    ["SABOTAGED COMMUNICATIONS"] = {
      name = "Sabotaged Communications",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133712792/1E85BFDAD9BED16CED509629CF66A9E4A24A208A/",
      pip = 1,
      faction = "Rebel",
    },
    ["STANDING ORDERS"] = {
      name = "Standing Orders",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865564032760/662157DB1D462926F585301B5D6003D6B8172F14/",
      pip = 4,
      faction = "Generic",
    },
    ["SYNCHRONIZED OFFENSIVE"] = {
      name = "Synchronized Offensive",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135269254/75501E93209B73709745D7E629DBE9389A2984A8/",
      pip = 1,
      faction = "Republic",
    },
    ["TACTICAL PLANNING"] = {
      name = "Tactical Planning",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384887489/3F2A0B433374DA6A7F3EAF67C27E112900C0621B/",
      pip = 2,
      faction = "Republic",
    },
    ["TURNING THE TIDE"] = {
      name = "Turning The Tide",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133714141/B32483DB97F481A24CA78CB828326E29DCBDFBB4/",
      pip = 2,
      faction = "Rebel",
    },
    ["UNRELENTING ASSAULT"] = {
      name = "Unrelenting Assault",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131527688/D4BA941B65A6BB4EB1F08EE5D23C987317D50D8C/",
      pip = 2,
      faction = "Separatist",
    },
    ["UNRELENTING FIRE"] = {
      name = "Unrelenting Fire",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384887817/303CF3E31F3AB63B96FD87FB72AB3371F2BA3B2A/",
      pip = 1,
      faction = "Empire",
    },
    ["UNSTOPPABLE ADVANCE"] = {
      name = "Unstoppable Advance",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131527719/02ACE80E8D14CF7DC017156A128F34A09F725CF2/",
      pip = 3,
      faction = "Separatist",
    },
    ["WE NEED REINFORCEMENTS"] = {
      name = "We Need Reinforcements",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384887939/7411A8717918A7824BA095188603EC11D9275FBE/",
      pip = 2,
      faction = "Empire",
    },
    ["YHWARGGHHHHHHHHHH!"] = {
      name = "YHWARGGHHHHHHHHHH!",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865564032878/3AE933EA5F364FC236D8502BA96FF1FC6AA9FA27/",
      pip = 3,
      faction = "Republic",
    },
  },
  battlefield = {
    standard = {
      objective = {
        ["MARKED TARGETS"] = {
          name = "Marked Targets",
          image = "https://steamusercontent-a.akamaihd.net/ugc/11843919298206935699/A3B1D5201F36075D53E0ACE69E0C1ED6AFB4DD22/",
          type = "vertical",
          additionalObjects = {
            "Victory Token",
            "Victory Token",
            "Victory Token",
            "Victory Token",
            "Victory Token",
            "Victory Token",
            "Victory Token",
            "Victory Token",          
          },
        },
        ["SWEEP AND CLEAR"] = {
          name = "Sweep and Clear",
          image = "https://steamusercontent-a.akamaihd.net/ugc/12307394332451477333/DF65C02CC017BD25A960FC2A737AE28829325CD2/",
          type = "vertical",
        },
        ["BRING THEM TO HEEL"] = {
          name = "Bring Them to Heel",
          image = "https://steamusercontent-a.akamaihd.net/ugc/16790576095549234351/278EA3877E97AD155ADA4602D42DF023B7CEB78B/",
          type = "vertical",
        },
        ["SURFACE SCAN"] = {
          name = "Surface Scan",
          image = "https://steamusercontent-a.akamaihd.net/ugc/16343945853969639984/24ABD9DF34B74E343BD4F79D9461385D76C0CD88/",
          type = "vertical",
          additionalObjects = {
            "Objective Token",
            "Objective Token",
            "Objective Token",
            "Objective Token",          
          },
        },
        ["DESTROY ENEMY BASE"] = {
          name = "Destroy Enemy Base",
          image = "https://steamusercontent-a.akamaihd.net/ugc/15702722297992072119/D6071563AAC98F86DDD790E6DE034350EEF17F5F/",
          type = "vertical",
          additionalObjects = {
            "Objective Token",
            "Objective Token",
            "POI Token",
            "POI Token",          
          },
        },
        ["RECON MISSION"] = {
          name = "Recon Mission",
          image = "https://steamusercontent-a.akamaihd.net/ugc/18385343105541227063/7F990BB73C8675734EB02873157F392EA265DC20/",
          type = "vertical",
          additionalObjects = {
            "Objective Token",
            "Objective Token",          
          },
        },
      },
      deployment = {
        ["CLOSE THE POCKET"] = {
          name = "Close the Pocket",
          image = "https://steamusercontent-a.akamaihd.net/ugc/17314598212129638590/62EB33594611850FEBF0567D57ABA8CFB8077091/",
          type = "vertical",
          zone = {
            {
              "r",
              "r",
              "r",
              "rs",
              " ",
              " ",
              " ",
              " ",
              "rss",
              "r",
              "r",
              "r",
            },
            {
              "rh",
              "rh",
              "rh",
              "rc",
              " ",
              " ",
              " ",
              " ",
              "rcc",
              "rh",
              "rh",
              "rh",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              "bh",
              "bh",
              "bh",
              "bcc",
              " ",
              " ",
              " ",
              " ",
              "bc",
              "bh",
              "bh",
              "bh",
            },
            {
              "b",
              "b",
              "b",
              "bss",
              " ",
              " ",
              " ",
              " ",
              "bs",
              "b",
              "b",
              "b",
            },          
          },
          additionalObjects = {
            "Close the Pocket Map",
            "POI Token",
            "POI Token",
            "POI Token",          
          },
        },
        ["BUNKER ASSAULT"] = {
          name = "Bunker Assault",
          image = "https://steamusercontent-a.akamaihd.net/ugc/16995954044322736468/0D0086DE04A57350DF77F62FDEC94F5148B7C4D5/",
          type = "vertical",
          zone = {
            {
              " ",
              " ",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              " ",
              " ",
            },
            {
              " ",
              " ",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              " ",
              " ",
            },
            {
              " ",
              " ",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              " ",
              " ",
            },          
          },
          additionalObjects = {
            "Bunker Assault Map",
            "POI Token",
            "POI Token",
            "POI Token",
            "POI Token",          
          },
        },
        ["BREAKTHROUGH"] = {
          name = "Breakthrough",
          image = "https://steamusercontent-a.akamaihd.net/ugc/9648599321290140597/26C606119E07DCACAAF07B1F5429CB9A03EC59F3/",
          type = "vertical",
          zone = {
            {
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              " ",
              " ",
              " ",
            },
            {
              "r",
              "rl",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              " ",
              " ",
              " ",
            },
            {
              "r",
              "rs",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "bc",
              "bh",
            },
            {
              "rh",
              "rc",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "bs",
              "b",
            },
            {
              " ",
              " ",
              " ",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bl",
              "b",
            },
            {
              " ",
              " ",
              " ",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
            },          
          },
          additionalObjects = {
            "Breakthrough Map",
            "POI Token",
            "POI Token",
            "POI Token",
            "POI Token",          
          },
        },
        ["INTERCEPT SIGNALS"] = {
          name = "Intercept Signals",
          image = "https://steamusercontent-a.akamaihd.net/ugc/13661793580985225615/BB706B264CE5C71456271DE54E765EC27EA6F786/",
          type = "vertical",
          zone = {
            {
              " ",
              " ",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              " ",
              " ",
            },
            {
              " ",
              " ",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              " ",
              " ",
            },
            {
              " ",
              " ",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              " ",
              " ",
            },          
          },
          additionalObjects = {
            "Intercept Signals Map",
            "POI Token",
            "POI Token",
            "POI Token",
            "POI Token",          
          },
        },
        ["RECOVER THE RESEARCH"] = {
          name = "Recover the Research",
          image = "https://steamusercontent-a.akamaihd.net/ugc/16282482143036636007/FD7F429F82E2F61B9EC390C9FBAB6782B26D8507/",
          type = "vertical",
          zone = {
            {
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              " ",
              " ",
              " ",
            },
            {
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
            },
            {
              " ",
              " ",
              " ",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
            },          
          },
          additionalObjects = {
            "Recover the Research Map",
            "POI Token",
            "POI Token",
            "POI Token",
            "POI Token",
            "POI Token",
            "POI Token",          
          },
        },
        ["SHIFTING PRIORITIES"] = {
          name = "Shifting Priorities",
          image = "https://steamusercontent-a.akamaihd.net/ugc/16497333789704302385/06FFACF38887F17BF4E0351DA7ED0D22CE26AEC7/",
          type = "vertical",
          zone = {
            {
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              " ",
              " ",
              " ",
            },
            {
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
            },
            {
              " ",
              " ",
              " ",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
            },          
          },
          additionalObjects = {
            "Shifting Priorities Map",
            "POI Token",
            "POI Token",
            "POI Token",
            "POI Token",
            "POI Token",          
          },
        },
      },
      condition = {
        ["ADVANCED INTEL"] = {
          name = "Advanced Intel",
          image = "https://steamusercontent-a.akamaihd.net/ugc/13272907091260444770/243391B61F192F53AA7CF0360D3F846C7A7A0A97/",
          type = "vertical",
          additionalObjects = {
            "Condition Token",          
          },
        },
        ["FORTIFIED POSITION"] = {
          name = "Fortified Position",
          image = "https://steamusercontent-a.akamaihd.net/ugc/16927846453234643948/97D5A7F0E4C9D3DAB14C3754AC3A484C15CE3567/",
          type = "vertical",
          additionalObjects = {
            "Barricade",
            "Barricade",
            "Barricade",          
          },
        },
        ["CUNNING DEPLOYMENT"] = {
          name = "Cunning Deployment",
          image = "https://steamusercontent-a.akamaihd.net/ugc/14925552919945327142/06659E9120D6246C6048165ECDE9F5F5AEA7A5EB/",
          type = "vertical",
          additionalObjects = {
            "Dodge Token",
            "Dodge Token",
            "Dodge Token",          
          },
        },
        ["GARRISON"] = {
          name = "Garrison",
          image = "https://steamusercontent-a.akamaihd.net/ugc/11060842461995269445/3EC4678860C9AD82F7912D3FC3A56A519BCA3CEE/",
          type = "vertical",
          additionalObjects = {
            "Condition Token",          
          },
        },
        ["ORDNANCE"] = {
          name = "Ordnance",
          image = "https://steamusercontent-a.akamaihd.net/ugc/12637307440348267234/446B8F97B7C1EF2452E5B4DD6AF36FC1BAAD7FA2/",
          type = "vertical",
          additionalObjects = {
            "Objective Token",          
          },
        },
        ["STRAFING RUN"] = {
          name = "Strafing Run",
          image = "https://steamusercontent-a.akamaihd.net/ugc/16276132125547808705/8A61415CDD0F2E20417F6D8371858B206FA0A775/",
          type = "vertical",
          additionalObjects = {
            "Objective Token",          
          },
        },
      },
    },
    blitz = {
      objective = {
        ["BOMBING RUN"] = {
          name = "Bombing Run",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865566152284/34FB45C5D924F9975C35E307B36C42AD2F8153DB/",
          type = "horizontal",
          additionalObjects = {
            "Objective Token",
            "Objective Token",
            "Objective Token",
            "Objective Token",
            "Objective Token",
            "Objective Token",          
          },
        },
        ["BREAKTHROUGH"] = {
          name = "Breakthrough",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865566152228/97E7C41CF4591B0909E9F8A5692193FDE83D4756/",
          type = "horizontal",
        },
        ["HOSTAGE EXCHANGE"] = {
          name = "Hostage Exchange",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865566152166/E56E902183803EC15BFA3E84548C9F85B3EF5DC2/",
          type = "horizontal",
          additionalObjects = {
            "Hostage Deck",
            "Objective Token",
            "Objective Token",          
          },
        },
        ["INTERCEPT THE TRANSMISSIONS"] = {
          name = "Intercept The Transmissions",
          image = "https://steamusercontent-a.akamaihd.net/ugc/2094796397712554781/B6AD631AEEC48E4473426C34888E1A1B79A011C6/",
          type = "horizontal",
          additionalObjects = {
            "Objective Token",
            "Objective Token",
            "Objective Token",          
          },
        },
        ["KEY POSITIONS"] = {
          name = "Key Positions",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865566152103/6BF1CD3BC8EA028CA31C3EE21FA87E28AC992873/",
          type = "horizontal",
          additionalObjects = {
            "Objective Token",
            "Objective Token",
            "Objective Token",          
          },
        },
        ["PAYLOAD"] = {
          name = "Payload",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865566152051/1D6BFDBA0D76170AE1EB3129C5B589DE5426EB14/",
          type = "horizontal",
          additionalObjects = {
            "Bomb Cart",
            "Bomb Cart",          
          },
        },
        ["RECOVER THE SUPPLIES"] = {
          name = "Recover The Supplies",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865566152002/C2C470607C4006FD51F83854CEA2093BA206222D/",
          type = "horizontal",
          additionalObjects = {
            "Objective Token",
            "Objective Token",
            "Objective Token",
            "Objective Token",
            "Objective Token",          
          },
        },
        ["SABOTAGE THE MOISTURE VAPORATORS"] = {
          name = "Sabotage The Moisture Vaporators",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865566151946/368BA0B7F0BBD659B37D6BE6781E01FECCDCB5E6/",
          type = "horizontal",
          additionalObjects = {
            "Objective Token",
            "Objective Token",
            "Objective Token",
            "Objective Token",          
          },
        },
      },
      deployment = {
        ["ADVANCED POSITIONS"] = {
          name = "Advanced Positions",
          image = "https://steamusercontent-a.akamaihd.net/ugc/2094796397702918693/AE8363351402BC55707F1DD2A589650E19B0263B/",
          type = "horizontal",
          zone = {
            {
              " ",
              " ",
              " ",
              "r",
              "r",
              "r",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              "b",
              "b",
              " ",
              " ",
              " ",
            },          
          },
        },
        ["BATTLE LINES"] = {
          name = "Battle Lines",
          image = "https://steamusercontent-a.akamaihd.net/ugc/2094796397702918815/139CE233ACEFA51872404741852721F076C47B0F/",
          type = "horizontal",
          zone = {
            {
              " ",
              " ",
              " ",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              " ",
              " ",
              " ",
            },          
          },
        },
        ["DANGER CLOSE"] = {
          name = "Danger Close",
          image = "https://steamusercontent-a.akamaihd.net/ugc/2094796397702918918/BA6FDAF4E07773CCD202073C9C5451C39955AF77/",
          type = "horizontal",
          zone = {
            {
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              "b",
              "b",
              "b",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
              " ",
              "b",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
              " ",
              "b",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
              " ",
              "b",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
              " ",
              "b",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              "r",
              "r",
              " ",
              " ",
              "b",
              " ",
              " ",
              " ",
            },          
          },
        },
        ["DISARRAY"] = {
          name = "Disarray",
          image = "https://steamusercontent-a.akamaihd.net/ugc/2094796397702919022/BDC2741D424E582027A471BA7D46CA3640ADC274/",
          type = "horizontal",
          zone = {
            {
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
              "b",
              "b",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "b",
              "b",
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
            },          
          },
        },
        ["HEMMED IN"] = {
          name = "Hemmed In",
          image = "https://steamusercontent-a.akamaihd.net/ugc/2094796397702919191/28C57E7D8E553AB4F725F17C93CEBDAC806D9C78/",
          type = "horizontal",
          zone = {
            {
              " ",
              " ",
              " ",
              "r",
              "r",
              " ",
              " ",
              "r",
              "r",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              "b",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              "b",
              " ",
              " ",
              " ",
              " ",
              " ",
            },          
          },
        },
        ["THE LONG MARCH"] = {
          name = "The Long March",
          image = "https://steamusercontent-a.akamaihd.net/ugc/2474241114697108468/BAA15960E591B3B68E1E121A374C9C379BD9D4AF/",
          type = "horizontal",
          zone = {
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              "b",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              "r",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },          
          },
        },
        ["MAJOR OFFENSIVE"] = {
          name = "Major Offensive",
          image = "https://steamusercontent-a.akamaihd.net/ugc/2094796397702919381/AD7188D6FC9D337BC83F23CC482EB374F5021115/",
          type = "horizontal",
          zone = {
            {
              " ",
              " ",
              " ",
              "r",
              "r",
              "r",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              "b",
              "b",
              " ",
              " ",
              " ",
            },          
          },
        },
        ["ROLL OUT"] = {
          name = "Roll Out",
          image = "https://steamusercontent-a.akamaihd.net/ugc/2094796397702919479/0B6DF3A3F6CD3339F39F655CF770E9C783F48440/",
          type = "horizontal",
          zone = {
            {
              " ",
              " ",
              " ",
              "r",
              "r",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              "r",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              "b",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              "b",
              " ",
              " ",
              " ",
            },          
          },
        },
      },
      condition = {
        ["CLEAR CONDITIONS"] = {
          name = "Clear Conditions",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865566151419/955CCA2E7134CBE4FEF69C62F148FFFCCAE1A577/",
          type = "horizontal",
        },
        ["FORTIFIED POSITIONS"] = {
          name = "Fortified Positions",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865566151371/BAA93356D59B37199A3C468013F6A5E0CD0413FB/",
          type = "horizontal",
          additionalObjects = {
            "Barricade",
            "Barricade",
            "Barricade",
            "Barricade",
            "Barricade",
            "Barricade",
            "Barricade",
            "Barricade",          
          },
        },
        ["HOSTILE ENVIRONMENT"] = {
          name = "Hostile Environment",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865566151285/4B44EC69671E90D90000BB99A45500D85196E92C/",
          type = "horizontal",
        },
        ["LIMITED VISIBILITY"] = {
          name = "Limited Visibility",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865566151238/46E6A35C7DBC3956A042707ADED4D3E7999D1792/",
          type = "horizontal",
        },
        ["MINEFIELD"] = {
          name = "Minefield",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865566151174/7BF21B789BA2A715EE474286DBB98A30D7FED51A/",
          type = "horizontal",
          additionalObjects = {
            "Condition Token",
            "Condition Token",
            "Condition Token",
            "Condition Token",          
          },
        },
        ["RAPID REINFORCEMENTS"] = {
          name = "Rapid Reinforcements",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865566151116/18451A85E7201070C4E0D96F72FD5D8BE4377B80/",
          type = "horizontal",
          additionalObjects = {
            "Condition Token",
            "Condition Token",
            "Condition Token",
            "Condition Token",          
          },
        },
        ["SUPPLY DROP"] = {
          name = "Supply Drop",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865566151068/9801B093E60171C3AC7E5F4D447ADF27D7E9DC1F/",
          type = "horizontal",
          additionalObjects = {
            "Supply Deck",
            "Condition Token",
            "Condition Token",
            "Condition Token",
            "Condition Token",
            "Condition Token",
            "Condition Token",          
          },
        },
        ["WAR WEARY"] = {
          name = "War Weary",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1860546411028298787/A02438F159B74E38AAC0F8906EDB3EB356438228/",
          type = "horizontal",
        },
      },
    },
    skirmish = {
      objective = {
        ["BREACH"] = {
          name = "Breach",
          image = "https://steamusercontent-a.akamaihd.net/ugc/4112341331071279492/85477A894623DDA23BC182995DAF396671A0C007/",
          type = "vertical",
        },
        ["CONTROL"] = {
          name = "Control",
          image = "https://steamusercontent-a.akamaihd.net/ugc/4112341331071279456/10F29ECE1579A06D7DC564A6480F2BE27CC6EF04/",
          type = "vertical",
          additionalObjects = {
            "Objective Token",          
          },
        },
        ["ELIMINATION"] = {
          name = "Elimination",
          image = "https://steamusercontent-a.akamaihd.net/ugc/4112341331071279416/6160501F308751CB9266FF991FF62E1409058C4B/",
          type = "vertical",
        },
        ["PIVOTAL POSITIONS"] = {
          name = "Pivotal Positions",
          image = "https://steamusercontent-a.akamaihd.net/ugc/4112341331071279382/6E006F31C9D5200AAA94392D94C2AE78EE4D73C7/",
          type = "vertical",
          additionalObjects = {
            "Objective Token",
            "Objective Token",
            "Objective Token",          
          },
        },
      },
      deployment = {
        ["BATTLE LINES"] = {
          name = "Battle Lines",
          image = "https://steamusercontent-a.akamaihd.net/ugc/4112341331071279345/8A96884057E13BF488E89177C2B9CCB0ADDDFFE0/",
          type = "vertical",
          zone = {
            {
              " ",
              " ",
              " ",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              " ",
              " ",
              " ",
            },          
          },
        },
        ["FACEOFF"] = {
          name = "Faceoff",
          image = "https://steamusercontent-a.akamaihd.net/ugc/4112341331071279307/F41700690107CC7398BD5B95CDED30B041538517/",
          type = "vertical",
          zone = {
          
          },
        },
        ["FLANKING POSITIONS"] = {
          name = "Flanking Positions",
          image = "https://steamusercontent-a.akamaihd.net/ugc/4112341331071279273/0D6B1CF6762E532AA4C0D039C2CC96F0E25A419F/",
          type = "vertical",
          zone = {
            {
              " ",
              " ",
              " ",
              "r",
              "r",
              "r",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              "b",
              "b",
              " ",
              " ",
              " ",
            },          
          },
        },
        ["MEETING ENGAGEMENT"] = {
          name = "Meeting Engagement",
          image = "https://steamusercontent-a.akamaihd.net/ugc/4112341331071279232/4F4C1C54E5DCE9FD1E9C46BB75379AEF60E2DAFC/",
          type = "vertical",
          zone = {
            {
              " ",
              " ",
              " ",
              "r",
              "r",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              "r",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              "b",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              "b",
              " ",
              " ",
              " ",
            },          
          },
        },
      },
      condition = {
        ["WAR WEARY"] = {
          name = "War Weary",
          image = "https://steamusercontent-a.akamaihd.net/ugc/4112341331071279193/052C3637BE4F31FAA691235E186CC73B1CE928F7/",
          type = "vertical",
        },
        ["IMPROVISED DEFENSES"] = {
          name = "Improvised Defenses",
          image = "https://steamusercontent-a.akamaihd.net/ugc/4112341331071279155/3F72099B06947F23231D8B2228D25C63E01FED92/",
          type = "vertical",
          additionalObjects = {
            "Barricade",
            "Barricade",
            "Barricade",
            "Barricade",          
          },
        },
        ["DAWN"] = {
          name = "Dawn",
          image = "https://steamusercontent-a.akamaihd.net/ugc/4112341331071279122/1952ADAEF00EAAF039C3D0C160AABF3BD4F7B0E1/",
          type = "vertical",
        },
        ["CLEAR CONDITIONS"] = {
          name = "Clear Conditions",
          image = "https://steamusercontent-a.akamaihd.net/ugc/4112341331071279082/F2116A3FBAB46DAD85EE43AB1CBF9497C567B2A8/",
          type = "vertical",
        },
      },
    },
    scenario = {
    },
    community = {
    },
  },
  objects = {
    ["Aim Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314442508/5CF014A3E962C6116B3B910C8BE44FE1C8FCA1D2/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359883314442626/A2574B5726D1DE612FF4F2464A2315C7C85759D1/",      
      },
      target = "unit",    
    },
    ["Bane Token: Blank"] = {
      token = {
        name = "Bane Token",
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314441337/A0DD41660FEC7E450F2EDF38191AF3C26E826C49/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/1055478574362401130/E1FA2715959E37138C25B4B36FB963149643DAA6/",      
      },
      target = "table",
      scripted = "toggle-range-1",    
    },
    ["Bane Token: Bomb"] = {
      token = {
        name = "Bane Token",
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314441337/A0DD41660FEC7E450F2EDF38191AF3C26E826C49/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/1055478574362399079/B91760D0E7895797EBF0320BFC752F5DC04A5962/",      
      },
      target = "table",
      scripted = "toggle-range-1",    
    },
    ["Bane Token: Bane"] = {
      token = {
        name = "Bane Token",
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314441337/A0DD41660FEC7E450F2EDF38191AF3C26E826C49/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/1055478574362319474/84ACA1633B9C944D709B8770A251A629FF05ACBA/",      
      },
      target = "table",
      scripted = "toggle-range-1",    
    },
    Barricade = {
      model = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540542429589/F10F499F8D061EFA2C4C696641235D706E4C0974/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540542379040/149A4BEBD1F20D82737DB21773B93C52BC30DF78/",
        collider = "https://steamusercontent-a.akamaihd.net/ugc/785234540542430072/AA329530B252DDE7329AC70F9A98502F7875400C/",      
      },
      type = "terrain",    
    },
    ["Bomb Cart"] = {
      model = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/1002556529493751157/9D26DC64BAAB57A2EC4CCB04016AFEC660256685/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/1002556529493751537/4CC48BB4450924701366C8EDED262930F423E4AB/",
        collider = "https://steamusercontent-a.akamaihd.net/ugc/785234540540671597/B477FDC4D3200384E974945C2974ABFEFA566166/",      
      },
      type = "custom",
      scripted = "bomb-cart",    
    },
    ["Commander Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314443431/097A439FFEDF419BAA723FB00918F6A8188D390D/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359883314443535/51A0B4A9A3A230825DFAB81B6AA97ED36C85E420/",      
      },
      target = "unit",
      stacks = false,    
    },
    ["Complete the Mission Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314441337/A0DD41660FEC7E450F2EDF38191AF3C26E826C49/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/59217531460146495/B6325E11EB42C5840441BFE640F913BD3C57A832/",      
      },
      target = "table",
      stacks = false,
      scripted = "toggle-range-1",    
    },
    ["Condition Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314441337/A0DD41660FEC7E450F2EDF38191AF3C26E826C49/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786360308354563594/D7CA9A23D1F8610544A092594F1CFF19C8C0A578/",      
      },
      target = "table",
      stacks = false,
      scripted = "toggle-range-1",    
    },
    ["Damaged Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314442142/E2BBDA84DFF104080284F15909B71C8F125DA50F/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359883314442381/27F7A3A2E3687E52F3576BF9A1E1A12CFD0267FD/",      
      },
      target = "unit",
      stacks = false,    
    },
    ["Disabled Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314442142/E2BBDA84DFF104080284F15909B71C8F125DA50F/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359883314442275/B66CD8AB21D41AAE360DCF69A8F58E418CE0FBF3/",      
      },
      target = "unit",
      stacks = false,    
    },
    ["Dodge Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314442740/91C08C293B53CCF3D104B0472B60ECF7BF4B613E/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359883314442875/553BAF41BE032BCE7282C4DECB180B5410AC7226/",      
      },
      target = "unit",    
    },
    ["Graffiti Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314441337/A0DD41660FEC7E450F2EDF38191AF3C26E826C49/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717874061240/B449ED876CF0B2455BBCEE1E22CDEFFC12EDCBF8/",      
      },
      target = "terrain",
      stacks = false,    
    },
    ["Hostage Deck"] = {
      cards = {
        {
          name = "Hostage",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1773847942315486174/6A01D6080A44D121D4DFCFFAD82EC4F9073C79AF/",
        },
        {
          name = "Hostage",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1773847942315486113/545C3FA50BADD14C160FA3DA555E2DEB8DA87E68/",
        },      
      },    
    },
    ["Immobilize Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314442992/DD893F407D50F2D029305A2F181989F90E3FA46A/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359883314446126/CCD2483A716B81931D26829BF205D6C0CB0196CD/",      
      },
      target = "unit",    
    },
    ["Incognito Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314441337/A0DD41660FEC7E450F2EDF38191AF3C26E826C49/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/1777200555359102353/86DFA2C0B4428415B5765DE845A19BC78EC70050/",      
      },
      target = "unit",
      stacks = false,    
    },
    ["Ion Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314442992/DD893F407D50F2D029305A2F181989F90E3FA46A/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359883314443114/1C858EEC4B7A2247AA506EC699FF65D7C72E5484/",      
      },
      target = "unit",    
    },
    ["Observation Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314442992/DD893F407D50F2D029305A2F181989F90E3FA46A/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/1777200555359034130/1D014D75BCE30D49638FC9C0CA5E1BDC9B4DFAE0/",      
      },
      target = "unit",    
    },
    ["Objective Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314441337/A0DD41660FEC7E450F2EDF38191AF3C26E826C49/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359883314441567/9502856DC8B0CEDD3D8316346FAD22C7BB8ADBF7/",      
      },
      target = "table",
      stacks = false,
      scripted = "toggle-range-1",    
    },
    ["Operative Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314441337/A0DD41660FEC7E450F2EDF38191AF3C26E826C49/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/1019446639705431555/05F948CC883AFC3BDBDA8F8485957731EE29AF03/",      
      },
      target = "unit",
      stacks = false,    
    },
    ["Panic Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314442142/E2BBDA84DFF104080284F15909B71C8F125DA50F/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359883314444049/7A5C1C3F824FDE5C14596782B4DCC628F9846334/",      
      },
      target = "unit",
      stacks = false,    
    },
    ["Poison Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314442992/DD893F407D50F2D029305A2F181989F90E3FA46A/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717874061462/2C7252E4C3030E3640741560C7C24E55950EF332/",      
      },
      target = "unit",    
    },
    ["Proton Charge Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314441337/A0DD41660FEC7E450F2EDF38191AF3C26E826C49/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359883314446398/425766A72D25CEB4F0E9C8BED9FCFDD68109D4B7/",      
      },
      target = "table",
      stacks = false,
      scripted = "toggle-range-1",    
    },
    ["Shield Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314441337/A0DD41660FEC7E450F2EDF38191AF3C26E826C49/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717874061363/FC8A9E131548DC42D21D9748015A67D8235BDA93/",      
      },
      target = "unit",    
    },
    ["Smoke Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314441337/A0DD41660FEC7E450F2EDF38191AF3C26E826C49/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717874061016/BB4832A82AEEA19EE9B1E9498380E7D3850DB0B6/",      
      },
      target = "table",
      stacks = false,
      scripted = "toggle-range-1",    
    },
    ["Standby Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314441910/ED14AA37D66E5E75EA5D6790A50546B1FC105DAC/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359883314442019/EF36C682BC69BB9239DC15B0C52EE6FFACEE19C0/",      
      },
      target = "unit",    
    },
    ["Supply Deck"] = {
      back = "https://steamusercontent-a.akamaihd.net/ugc/1773847942315485602/925B9FA7B35FE1478BAFC4E7314C60288C8819AB/",
      multiples = 2,
      cards = {
        {
          name = "Arc Welder",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1773847942315485990/C3F3B1B5B459DCA2B73598B2CBB178B4C7EE6DC5/",
        },
        {
          name = "Bacta Capsules",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1773847942315486053/CA14B9CD49FD92428F0B2D5050EA5DD25797DB33/",
        },
        {
          name = "Camoflauge",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1773847942315485930/9D9EDF3108F222D53AF43EB41EDD5005FF20ABDE/",
        },
        {
          name = "Field Scanner",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1773847942315485652/63D35175DBB6FC01579253CE0386B30C6D76B796/",
        },
        {
          name = "Grapnel Harpoon",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1773847942315485870/99B837BC86196C56118132AF3B36B710F9FFD87B/",
        },
        {
          name = "Holoprojector",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1773847942315485706/DD7D68FDCAB31B1BD344FE8196A8B21E8FB098D9/",
        },
        {
          name = "Precision Scopes",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1773847942315485814/B5F5B7B897E1C13EFA45120F854D762364BF9DC9/",
        },
        {
          name = "Targeting Rangefinder",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1773847942315485757/734B12CDF6B61ED03B40E35759400C1EB916D3D5/",
        },      
      },    
    },
    ["Suppression Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314443213/E353EC3098CC94615DE0BA5CEF4CE8B298CF7777/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359883314443321/002CBBCACEB0F7497BEA744B8D7B17736A5FF65E/",      
      },
      target = "unit",    
    },
    ["Surge Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785236717874060749/314173062C289E83F826F78FC7FD0FF0D2E6E418/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717874060915/75B609A561604CAF66D7BD2868211D40F18B74E3/",      
      },
      target = "unit",    
    },
    ["Victory Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314441337/A0DD41660FEC7E450F2EDF38191AF3C26E826C49/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786360308354563474/D727C55A73EC48FBF56D78D188A731FEDDC2635B/",      
      },
      target = "unit",    
    },
    ["Weapon Disrupted Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314442142/E2BBDA84DFF104080284F15909B71C8F125DA50F/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359883314443730/B474A9A42C93151761AFE01AB45DBE5CABA1F451/",      
      },
      target = "unit",
      stacks = false,    
    },
    ["Wheel Mode Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314441337/A0DD41660FEC7E450F2EDF38191AF3C26E826C49/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/780734328492115080/57765C267CCBA4F177CF4C7FBED9B6BA242FB49B/",      
      },
      target = "unit",
      stacks = false,    
    },
    ["Wound Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314443832/CC490842F0159459C8D5C252BE7225E9D2581951/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359883314443935/0F8A37E8CD128D5644B391E4EFEC50656D558FF7/",      
      },
      target = "mini",    
    },
    ["POI Token"] = {
      token = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2482129948495931625/A14C0E047A0C7C8D12B96B34A16D2DAAA3A5E9E3/",      
      },
      target = "table",
      stacks = false,
      scripted = "poi-token",    
    },
    ["Breakthrough Map"] = {
      card = {
        image = "https://steamusercontent-a.akamaihd.net/ugc/16613435332891317382/334404D722726ECE56866DBBF444836E8AC2F3A3/",
        back = "https://steamusercontent-a.akamaihd.net/ugc/2482129948501051192/5A19D255E47E80FF3CCE0EBFA095CB8677C4188D/",      
      },    
    },
    ["Bunker Assault Map"] = {
      card = {
        image = "https://steamusercontent-a.akamaihd.net/ugc/12304553798171400164/69AB4EB2BA8A39D91996852580DCA1AB783913C4/",
        back = "https://steamusercontent-a.akamaihd.net/ugc/2482129948501051483/82F1D1EAA55C5794FD0301E5FADB5EEA3DAEFE49/",      
      },    
    },
    ["Close the Pocket Map"] = {
      card = {
        image = "https://steamusercontent-a.akamaihd.net/ugc/14769093936620373412/BC975CBADAEBD9AA231D83443BE9EDB59FF4308A/",
        back = "https://steamusercontent-a.akamaihd.net/ugc/2482129948501051694/8B05A05A5B24115F84B0A13F6FD392BB5C00E527/",      
      },    
    },
    ["Intercept Signals"] = {
      card = {
        image = "https://steamusercontent-a.akamaihd.net/ugc/12020228019721678387/E635199A7837BC89D679A0D848FB4EA7D7677239/",
        back = "https://steamusercontent-a.akamaihd.net/ugc/2482129948501052240/E4DFCE250EAB2459C05A7C73ED2C47B78DB5D467/",      
      },    
    },
    ["Recover the Research Map"] = {
      card = {
        image = "https://steamusercontent-a.akamaihd.net/ugc/15862931608322641380/4C8D35B94855B94A233EBF9D01FB0D1A0EEE3B32/",
        back = "https://steamusercontent-a.akamaihd.net/ugc/2482129948501052886/30E5BFA96EBC5AFA4197AE40882EC3B576420F51/",      
      },    
    },
    ["Shifting Priorities Map"] = {
      card = {
        image = "https://steamusercontent-a.akamaihd.net/ugc/12429316638634710380/005746FFEA77696118B237B650C7628F9089B946/",
        back = "https://steamusercontent-a.akamaihd.net/ugc/2482129948501052974/0D4D7ECABE727D484B8ECDF44DBA664BBF7E609D/",      
      },    
    },
  },
}

----#include !/generated/cards

function initCardsSchema()
  _G.CardsSchema = GENERATED_CARDS_SCHEMA
end

function sideLoadUnit(params)
  local faction = params.faction:upper()
  local unitKey = params.key:upper()
  local unitDat = params.unit
  if not _G.CardsSchema.units[faction] then
    _G.CardsSchema.units[faction] = {}
  end
  _G.CardsSchema.units[faction][unitKey] = unitDat
end

function sideLoadUpgrade(params)
  local name = params.name:upper()
  local data = params.data
  _G.CardsSchema.upgrades[name] = data
end

function sideLoadCommand(params)
  local name = params.name:upper()
  local data = params.data
  _G.CardsSchema.commands[name] = data
end

function sideLoadBattle(params)
  local name = params.name:upper()
  local data = params.data
  local type = params.type:lower()
  local kind = params.kind:lower()
  _G.CardsSchema.battlefield[type][kind] = data
end

function sideLoadObject(params)
  local name = params.name:upper()
  local data = params.data
  _G.CardsSchema.objects[name] = data
end

----#include !/CardSchema
----#include !/common/SHA256
--
--  Adaptation of the Secure Hashing Algorithm (SHA-244/256)
--  Found Here: http://lua-users.org/wiki/SecureHashAlgorithm
--
--  Using an adapted version of the bit library
--  Found Here: https://bitbucket.org/Boolsheet/bslf/src/1ee664885805/bit.lua
--
--  Adapted into a single function by GravityScore
--

function sha256(msg)
  local function band(int1, int2, int3, ...)
     int1 = int1 % 2^32
     int2 = int2 % 2^32
     local ret =
     ((int1%0x00000002>=0x00000001 and int2%0x00000002>=0x00000001 and 0x00000001) or 0)+
     ((int1%0x00000004>=0x00000002 and int2%0x00000004>=0x00000002 and 0x00000002) or 0)+
     ((int1%0x00000008>=0x00000004 and int2%0x00000008>=0x00000004 and 0x00000004) or 0)+
     ((int1%0x00000010>=0x00000008 and int2%0x00000010>=0x00000008 and 0x00000008) or 0)+
     ((int1%0x00000020>=0x00000010 and int2%0x00000020>=0x00000010 and 0x00000010) or 0)+
     ((int1%0x00000040>=0x00000020 and int2%0x00000040>=0x00000020 and 0x00000020) or 0)+
     ((int1%0x00000080>=0x00000040 and int2%0x00000080>=0x00000040 and 0x00000040) or 0)+
     ((int1%0x00000100>=0x00000080 and int2%0x00000100>=0x00000080 and 0x00000080) or 0)+
     ((int1%0x00000200>=0x00000100 and int2%0x00000200>=0x00000100 and 0x00000100) or 0)+
     ((int1%0x00000400>=0x00000200 and int2%0x00000400>=0x00000200 and 0x00000200) or 0)+
     ((int1%0x00000800>=0x00000400 and int2%0x00000800>=0x00000400 and 0x00000400) or 0)+
     ((int1%0x00001000>=0x00000800 and int2%0x00001000>=0x00000800 and 0x00000800) or 0)+
     ((int1%0x00002000>=0x00001000 and int2%0x00002000>=0x00001000 and 0x00001000) or 0)+
     ((int1%0x00004000>=0x00002000 and int2%0x00004000>=0x00002000 and 0x00002000) or 0)+
     ((int1%0x00008000>=0x00004000 and int2%0x00008000>=0x00004000 and 0x00004000) or 0)+
     ((int1%0x00010000>=0x00008000 and int2%0x00010000>=0x00008000 and 0x00008000) or 0)+
     ((int1%0x00020000>=0x00010000 and int2%0x00020000>=0x00010000 and 0x00010000) or 0)+
     ((int1%0x00040000>=0x00020000 and int2%0x00040000>=0x00020000 and 0x00020000) or 0)+
     ((int1%0x00080000>=0x00040000 and int2%0x00080000>=0x00040000 and 0x00040000) or 0)+
     ((int1%0x00100000>=0x00080000 and int2%0x00100000>=0x00080000 and 0x00080000) or 0)+
     ((int1%0x00200000>=0x00100000 and int2%0x00200000>=0x00100000 and 0x00100000) or 0)+
     ((int1%0x00400000>=0x00200000 and int2%0x00400000>=0x00200000 and 0x00200000) or 0)+
     ((int1%0x00800000>=0x00400000 and int2%0x00800000>=0x00400000 and 0x00400000) or 0)+
     ((int1%0x01000000>=0x00800000 and int2%0x01000000>=0x00800000 and 0x00800000) or 0)+
     ((int1%0x02000000>=0x01000000 and int2%0x02000000>=0x01000000 and 0x01000000) or 0)+
     ((int1%0x04000000>=0x02000000 and int2%0x04000000>=0x02000000 and 0x02000000) or 0)+
     ((int1%0x08000000>=0x04000000 and int2%0x08000000>=0x04000000 and 0x04000000) or 0)+
     ((int1%0x10000000>=0x08000000 and int2%0x10000000>=0x08000000 and 0x08000000) or 0)+
     ((int1%0x20000000>=0x10000000 and int2%0x20000000>=0x10000000 and 0x10000000) or 0)+
     ((int1%0x40000000>=0x20000000 and int2%0x40000000>=0x20000000 and 0x20000000) or 0)+
     ((int1%0x80000000>=0x40000000 and int2%0x80000000>=0x40000000 and 0x40000000) or 0)+
     ((int1>=0x80000000 and int2>=0x80000000 and 0x80000000) or 0)

     return (int3 and band(ret, int3, ...)) or ret
  end

  local function bxor(int1, int2, int3, ...)
     local ret =
     ((int1%0x00000002>=0x00000001 ~= (int2%0x00000002>=0x00000001) and 0x00000001) or 0)+
     ((int1%0x00000004>=0x00000002 ~= (int2%0x00000004>=0x00000002) and 0x00000002) or 0)+
     ((int1%0x00000008>=0x00000004 ~= (int2%0x00000008>=0x00000004) and 0x00000004) or 0)+
     ((int1%0x00000010>=0x00000008 ~= (int2%0x00000010>=0x00000008) and 0x00000008) or 0)+
     ((int1%0x00000020>=0x00000010 ~= (int2%0x00000020>=0x00000010) and 0x00000010) or 0)+
     ((int1%0x00000040>=0x00000020 ~= (int2%0x00000040>=0x00000020) and 0x00000020) or 0)+
     ((int1%0x00000080>=0x00000040 ~= (int2%0x00000080>=0x00000040) and 0x00000040) or 0)+
     ((int1%0x00000100>=0x00000080 ~= (int2%0x00000100>=0x00000080) and 0x00000080) or 0)+
     ((int1%0x00000200>=0x00000100 ~= (int2%0x00000200>=0x00000100) and 0x00000100) or 0)+
     ((int1%0x00000400>=0x00000200 ~= (int2%0x00000400>=0x00000200) and 0x00000200) or 0)+
     ((int1%0x00000800>=0x00000400 ~= (int2%0x00000800>=0x00000400) and 0x00000400) or 0)+
     ((int1%0x00001000>=0x00000800 ~= (int2%0x00001000>=0x00000800) and 0x00000800) or 0)+
     ((int1%0x00002000>=0x00001000 ~= (int2%0x00002000>=0x00001000) and 0x00001000) or 0)+
     ((int1%0x00004000>=0x00002000 ~= (int2%0x00004000>=0x00002000) and 0x00002000) or 0)+
     ((int1%0x00008000>=0x00004000 ~= (int2%0x00008000>=0x00004000) and 0x00004000) or 0)+
     ((int1%0x00010000>=0x00008000 ~= (int2%0x00010000>=0x00008000) and 0x00008000) or 0)+
     ((int1%0x00020000>=0x00010000 ~= (int2%0x00020000>=0x00010000) and 0x00010000) or 0)+
     ((int1%0x00040000>=0x00020000 ~= (int2%0x00040000>=0x00020000) and 0x00020000) or 0)+
     ((int1%0x00080000>=0x00040000 ~= (int2%0x00080000>=0x00040000) and 0x00040000) or 0)+
     ((int1%0x00100000>=0x00080000 ~= (int2%0x00100000>=0x00080000) and 0x00080000) or 0)+
     ((int1%0x00200000>=0x00100000 ~= (int2%0x00200000>=0x00100000) and 0x00100000) or 0)+
     ((int1%0x00400000>=0x00200000 ~= (int2%0x00400000>=0x00200000) and 0x00200000) or 0)+
     ((int1%0x00800000>=0x00400000 ~= (int2%0x00800000>=0x00400000) and 0x00400000) or 0)+
     ((int1%0x01000000>=0x00800000 ~= (int2%0x01000000>=0x00800000) and 0x00800000) or 0)+
     ((int1%0x02000000>=0x01000000 ~= (int2%0x02000000>=0x01000000) and 0x01000000) or 0)+
     ((int1%0x04000000>=0x02000000 ~= (int2%0x04000000>=0x02000000) and 0x02000000) or 0)+
     ((int1%0x08000000>=0x04000000 ~= (int2%0x08000000>=0x04000000) and 0x04000000) or 0)+
     ((int1%0x10000000>=0x08000000 ~= (int2%0x10000000>=0x08000000) and 0x08000000) or 0)+
     ((int1%0x20000000>=0x10000000 ~= (int2%0x20000000>=0x10000000) and 0x10000000) or 0)+
     ((int1%0x40000000>=0x20000000 ~= (int2%0x40000000>=0x20000000) and 0x20000000) or 0)+
     ((int1%0x80000000>=0x40000000 ~= (int2%0x80000000>=0x40000000) and 0x40000000) or 0)+
     ((int1>=0x80000000 ~= (int2>=0x80000000) and 0x80000000) or 0)

     return (int3 and bxor(ret, int3, ...)) or ret
  end

  local function bnot(int)
     return 4294967295 - int
  end

  local function rshift(int, by)
     int = int % 2^32
     local shifted = int / (2 ^ by)
     return shifted - shifted % 1
  end

  local function rrotate(int, by)
     int = int % 2^32
     local shifted = int / (2 ^ by)
     local fraction = shifted % 1
     return (shifted - fraction) + fraction * (2 ^ 32)
  end

  local k = {
     0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5,
     0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
     0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3,
     0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
     0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc,
     0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
     0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7,
     0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
     0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13,
     0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
     0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3,
     0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
     0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5,
     0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
     0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208,
     0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2,
  }


  local function str2hexa(s)
     local h = string.gsub(s, ".", function(c)
     return string.format("%02x", string.byte(c))
     end)
     return h
  end

  local function num2s(l, n)
     local s = ""
     for i = 1, n do
        local rem = l % 256
        s = string.char(rem) .. s
        l = (l - rem) / 256
     end
     return s
  end

  local function s232num(s, i)
     local n = 0
     for i = i, i + 3 do n = n*256 + string.byte(s, i) end
     return n
  end

  local function preproc(msg, len)
     local extra = 64 - ((len + 1 + 8) % 64)
     len = num2s(8 * len, 8)
     msg = msg .. "\128" .. string.rep("\0", extra) .. len
     return msg
  end

  local function initH256(H)
     H[1] = 0x6a09e667
     H[2] = 0xbb67ae85
     H[3] = 0x3c6ef372
     H[4] = 0xa54ff53a
     H[5] = 0x510e527f
     H[6] = 0x9b05688c
     H[7] = 0x1f83d9ab
     H[8] = 0x5be0cd19
     return H
  end

  local function digestblock(msg, i, H)
     local w = {}
     for j = 1, 16 do w[j] = s232num(msg, i + (j - 1) * 4) end
     for j = 17, 64 do
        local v = w[j - 15]
        local s0 = bxor(rrotate(v, 7), rrotate(v, 18), rshift(v, 3))
        v = w[j - 2]
        local s1 = bxor(rrotate(v, 17), rrotate(v, 19), rshift(v, 10))
        w[j] = w[j - 16] + s0 + w[j - 7] + s1
     end

     local a, b, c, d, e, f, g, h = H[1], H[2], H[3], H[4], H[5], H[6], H[7], H[8]
     for i = 1, 64 do
        local s0 = bxor(rrotate(a, 2), rrotate(a, 13), rrotate(a, 22))
        local maj = bxor(band(a, b), band(a, c), band(b, c))
        local t2 = s0 + maj
        local s1 = bxor(rrotate(e, 6), rrotate(e, 11), rrotate(e, 25))
        local ch = bxor (band(e, f), band(bnot(e), g))
        local t1 = h + s1 + ch + k[i] + w[i]
        h, g, f, e, d, c, b, a = g, f, e, d + t1, c, b, a, t1 + t2
     end

     H[1] = (H[1] + a) % 2^32
     H[2] = (H[2] + b) % 2^32
     H[3] = (H[3] + c) % 2^32
     H[4] = (H[4] + d) % 2^32
     H[5] = (H[5] + e) % 2^32
     H[6] = (H[6] + f) % 2^32
     H[7] = (H[7] + g) % 2^32
     H[8] = (H[8] + h) % 2^32
  end

  msg = preproc(msg, #msg)
  local H = initH256({})
  for i = 1, #msg, 64 do digestblock(msg, i, H) end
  return str2hexa(num2s(H[1], 4) .. num2s(H[2], 4) .. num2s(H[3], 4) .. num2s(H[4], 4) ..
  num2s(H[5], 4) .. num2s(H[6], 4) .. num2s(H[7], 4) .. num2s(H[8], 4))
end

----#include !/common/SHA256
----#include !/data/ListBuilder
function buildListBuilder()
    local listBuilder = {}
    listBuilder.modelTemplateGUID = "ba9920"
    listBuilder.redZoneGUID = "2c09a9"
    listBuilder.blueZoneGUID = "818608"

    listBuilder.redDeckMountGUID = "eb2d78"
    listBuilder.blueDeckMountGUID = "0c1c93"

    listBuilder.redDeckZoneGUID = "99d398"
    listBuilder.blueDeckZoneGUID = "4541f9"

    listBuilder.redCounterGUID = "5c7de3"
    listBuilder.blueCounterGUID = "55da62"

    listBuilder.dataDisk = {}
    listBuilder.dataDisk.guid = "66f23c"

    listBuilder.redDataDiskZone = "ccdc98"
    listBuilder.blueDataDiskZone = "cd7b3b"

    listBuilder.deckBuilderPos = {}

    listBuilder.deckBuilderPos.red = {-35.11, 0.95, -30.45}
    listBuilder.deckBuilderPos.blue = {-35.11, 0.95, 30.45}

    listBuilder.deckBuilderMesh = "https://steamusercontent-a.akamaihd.net/ugc/786360308354566451/1A3E2F61E3596E35D3FFA10660B8C63D5BE010E1/"
    listBuilder.deckBuilderDiffuse = "https://steamusercontent-a.akamaihd.net/ugc/786360308354566564/58E3DBF4523A099C371DA8A674AE9DB1932B4006/"
    listBuilder.deckBuilderGUID = "082f27"

    listBuilder.spawnOffsets = {
      cardHeight=2.5,
      cardScale=0.83,
      unitCardWidth=3.5,
      upgradeCardWidth=1.75,
      padding=0.2,
      templateHalfWidth=2,
      templateHalfHeight=4
    }

    listBuilder.redTemplatePos = {}
    listBuilder.redTemplatePos[1] = {x = -23.57,y= 1,z=-29}
    listBuilder.redTemplatePos[2] = {x =-16.60,y= 1,z=-29}
    listBuilder.redTemplatePos[3] = {x =-9.60,y= 1,z=-29}
    listBuilder.redTemplatePos[4] = {x =-2.63,y= 1,z=-29}
    listBuilder.redTemplatePos[5] = {x =4.38,y= 1,z=-29}
    listBuilder.redTemplatePos[6] = {x =11.38,y= 1,z=-29}
    listBuilder.redTemplatePos[7] = {x =18.35,y= 1,z=-29}
    listBuilder.redTemplatePos[8] = {x =25.07,y= 1,z=-29}
    listBuilder.redTemplatePos[9] = {x =32.36,y= 1,z=-29}
    listBuilder.redTemplatePos[10] = {x =39.37,y= 1,z=-29}

    listBuilder.redTemplatePos[11] = {x = -23.57,y= 1,z=-38}
    listBuilder.redTemplatePos[12] = {x =-16.60,y= 1,z=-38}
    listBuilder.redTemplatePos[13] = {x =-9.60,y= 1,z=-38}
    listBuilder.redTemplatePos[14] = {x =-2.63,y= 1,z=-38}
    listBuilder.redTemplatePos[15] = {x =4.38,y= 1,z=-38}
    listBuilder.redTemplatePos[16] = {x =11.38,y= 1,z=-38}
    listBuilder.redTemplatePos[17] = {x =18.35,y= 1,z=-38}
    listBuilder.redTemplatePos[18] = {x =25.07,y= 1,z=-38}
    listBuilder.redTemplatePos[19] = {x =32.36,y= 1,z=-38}
    listBuilder.redTemplatePos[20] = {x =39.37,y= 1,z=-38}

    listBuilder.blueTemplatePos = {}
    listBuilder.blueTemplatePos[1] = {x=39.37,y= 1,z=29}
    listBuilder.blueTemplatePos[2] = {x=32.36,y= 1,z=29}
    listBuilder.blueTemplatePos[3] = {x=25.07,y= 1,z=29}
    listBuilder.blueTemplatePos[4] = {x=18.35,y= 1,z=29}
    listBuilder.blueTemplatePos[5] = {x=11.38,y= 1,z=29}
    listBuilder.blueTemplatePos[6] = {x=4.38,y= 1,z=29}
    listBuilder.blueTemplatePos[7] = {x=-2.63,y= 1,z=29}
    listBuilder.blueTemplatePos[8] = {x=-9.60,y= 1,z=29}
    listBuilder.blueTemplatePos[9] = {x=-16.60,y= 1,z=29}
    listBuilder.blueTemplatePos[10] = {x=-23.57,y= 1,z=29}

    listBuilder.blueTemplatePos[11] = {x=39.37,y= 1,z=38}
    listBuilder.blueTemplatePos[12] = {x=32.36,y= 1,z=38}
    listBuilder.blueTemplatePos[13] = {x=25.07,y= 1,z=38}
    listBuilder.blueTemplatePos[14] = {x=18.35,y= 1,z=38}
    listBuilder.blueTemplatePos[15] = {x=11.38,y= 1,z=38}
    listBuilder.blueTemplatePos[16] = {x=4.38,y= 1,z=38}
    listBuilder.blueTemplatePos[17] = {x=-2.63,y= 1,z=38}
    listBuilder.blueTemplatePos[18] = {x=-9.60,y= 1,z=38}
    listBuilder.blueTemplatePos[19] = {x=-16.60,y= 1,z=38}
    listBuilder.blueTemplatePos[20] = {x=-23.57,y= 1,z=38}

    listBuilder.miniSpawnPos = {}
    listBuilder.miniSpawnPos[1] = {c = 5.32, q = -90}
    listBuilder.miniSpawnPos[2] = {q = 74.097447395813,  c = -5.5109073663055}
    listBuilder.miniSpawnPos[3] = {q = 83.470464001153, c = -6.6833524521754}
    listBuilder.miniSpawnPos[4] = {q = -83.460700769998, c = 6.6734174153878}
    listBuilder.miniSpawnPos[5] = {q = -73.826845678316, c = 5.5288063811279}
    listBuilder.miniSpawnPos[6] = {q = -78.799202212116, c = 4.1184463089859}
    listBuilder.miniSpawnPos[7] = {q = 79.544342439695, c = -4.0777076893764}
    listBuilder.miniSpawnPos[8] = {c = 7.9, q = -90}

    listBuilder.handPos = {}
    listBuilder.handPos.red = {}
    listBuilder.handPos.red.pos = {8.50, 4.0, -58}
    listBuilder.handPos.red.rot = {0,180,0}
    listBuilder.handPos.blue = {}
    listBuilder.handPos.blue.pos = {8.50, 4.0, 58}
    listBuilder.handPos.blue.rot = {0,0,0}

    listBuilder.tokenModelGUID = "a57c41"
    modelToken = getObjectFromGUID(listBuilder.tokenModelGUID)
    listBuilder.tokenScript = modelToken.getLuaScript()

    listBuilder.modelMiniGUID = "99f1c8"
    modelMini = getObjectFromGUID(listBuilder.modelMiniGUID)
    listBuilder.modelMiniScript = modelMini.getLuaScript()
    return listBuilder
end

----#include !/data/ListBuilder
----#include !/generated/cards
-- AUTO GENERATED (`npm run generate`). DO NOT MODIFY BY HAND.
GENERATED_CARDS_SCHEMA = {
  units = {
    ["REBEL"] = {
      ["LUKE SKYWALKER HERO OF THE REBELLION"] = {
        name = "Luke Skywalker",
        title = "Hero Of The Rebellion",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133196942/E1A8548A9C0688D979CAD83F32F130B0115D9C50/",
        size = "small",
        type = "Trooper",
        points = 120,
        speed = 2,
        upgrades = {
          Command = 1,
          Force = 1,
          Training = 1,
          Gear = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540537100371/0B15B2810ABEBE5429E4A24852D96BAC2DC28BF7/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540537079134/11A17263AD81DC9D4271B7C6BD809B69141DCB61/",
          },        
        },
        commands = {
          {
            name = "Son Of Skywalker",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133712958/CF63D0FDA40318CE886E6DA309CEB291857776E4/",
            pip = 1,
          },
          {
            name = "You Serve Your Master Well",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133714680/FD14E558D7D2B7EF32BD992FFC1C89141CD1F192/",
            pip = 1,
          },
          {
            name = "My Ally Is The Force",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133711308/CECAE0B5B62858582522F7FBED6463FE5834A64E/",
            pip = 2,
          },
          {
            name = "Full Of Surprises",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133709999/FA890B2A2EA1528C8BCF2A80AEB3B97A97BB9E15/",
            pip = 2,
          },
          {
            name = "Return Of The Jedi",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133711996/90C4CB28C0554DEC3797882252E6C5D3CCAC65A1/",
            pip = 3,
          },
          {
            name = "I Am A Jedi",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133710140/F162DE57287EB8C43F845BF34550B6666929E36A/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Rebel",
      },
      ["LEIA ORGANA FEARLESS AND INVENTIVE"] = {
        name = "Leia Organa",
        title = "Fearless And Inventive",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133196907/3603F95E0847EC7E202162FF2BA8E587A3B8E8D8/",
        size = "small",
        type = "Trooper",
        points = 75,
        speed = 2,
        upgrades = {
          Command = 2,
          Training = 1,
          Gear = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540537137572/2AC01B05AF1576F49C3156EDB614E2C1804C2A42/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540537137853/F8E5FE7B221E9115B36E22C14E5707B7CFA6CFC3/",
          },        
        },
        commands = {
          {
            name = "Coordinated Bombardment",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133709038/5F4C655FAD4092BA114E76531B141C09D17A413C/",
            pip = 1,
          },
          {
            name = "No Time For Sorrows",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133711809/CE6019479334BF3204C4BD05DF6615B7ABA02B44/",
            pip = 2,
          },
          {
            name = "A Beautiful Friendship",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133708647/EA50E83AC0C23B932428034601250A9C698E8F87/",
            pip = 2,
          },
          {
            name = "Somebody Has To Save Our Skins",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133712915/7EFEAD84C8B64A86D130C765225552D91AEAF814/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Rebel",
      },
      ["HAN SOLO UNORTHODOX GENERAL"] = {
        name = "Han Solo",
        title = "Unorthodox General",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133196276/8433A2CEDE2DA7DE9EFEE663DCD27875BA7CA3F6/",
        size = "small",
        type = "Trooper",
        points = 100,
        speed = 2,
        upgrades = {
          Command = 1,
          Training = 1,
          Gear = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540540669649/C440F429AB1182944D329D0C16C3402DB731CA87/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540540669835/B4E395AA781518EAC4FBFFCB27BAA646201F411C/",
          },        
        },
        commands = {
          {
            name = "Sorry About The Mess",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133713891/5010BC7FF52D6539147756EF04579FD860630D4E/",
            pip = 1,
          },
          {
            name = "Reckless Diversion",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133711955/8E5E53B03E9248B3BB6CCBC1942C831C02ACFF67/",
            pip = 2,
          },
          {
            name = "Change Of Plans",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133708965/8DA6716707434EDAF86655364C9557E3408B9B5E/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Rebel",
      },
      ["REBEL OFFICER RESOLUTE COMMANDER"] = {
        name = "Rebel Officer",
        title = "Resolute Commander",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384863340/260721B8F3E1D9501B665F44F02869C34B561AF6/",
        size = "small",
        type = "Trooper",
        points = 50,
        speed = 2,
        upgrades = {
          Command = 1,
          Gear = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780862726770/62FECAB3FED284E098751CC3BBC70C4CFF828A58/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780862727097/DE589901F66E4079D82BA2C819672F622A5D7240/",
          },        
        },
        rank = "Commander",
        faction = "Rebel",
      },
      ["LANDO CALRISSIAN CANNY GENERAL"] = {
        name = "Lando Calrissian",
        title = "Canny General",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133196874/E2254E94528D352BF5AEE9E92D4532EE44E46C7F/",
        size = "small",
        type = "Trooper",
        points = 105,
        speed = 2,
        upgrades = {
          Command = 1,
          Training = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809186518/DCA8031C62A867134FAA814D4976978058C01369/",
          },        
        },
        commands = {
          {
            name = "Corellian Spike",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133709076/0B6C95F039C36F8709EAA7D83441D537E9F10FA9/",
            pip = 1,
          },
          {
            name = "Ace Up His Sleeve",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133708717/1DF313D87604E77DA0B404B8C8388364671B5070/",
            pip = 2,
          },
          {
            name = "Idiot's Array",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133711194/7A82389E04650FF63B89965A425182594B7A7463/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Rebel",
      },
      ["PYKE SYNDICATE CAPO"] = {
        name = "Pyke Syndicate Capo",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718883/40D17DA044960A4A34979FBDEAE9296EB1E50346/",
        size = "small",
        type = "Trooper",
        points = 48,
        speed = 2,
        upgrades = {
          Command = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420351237/706DEA645FEE2EC9787F05F4FF2926632E2C4894/",
          },        
        },
        rank = "Commander",
        faction = "Rebel",
      },
      ["WICKET HERO OF BRIGHT TREE"] = {
        name = "Wicket",
        title = "Hero of Bright Tree",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133208061/787C79B49789528F2EF54F1668B0BF28EBD6635C/",
        size = "small",
        type = "Trooper",
        points = 70,
        speed = 2,
        upgrades = {
          Training = 3,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2023850162090106066/B6E661CAB8049A1B1CE975B53BB57B337E2C5DEE/",
          },        
        },
        commands = {
          {
            name = "Close Call",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133753263/3C95DC036CEC1999E18A0AB104AEC6EB7FCE3CA6/",
            pip = 1,
          },
          {
            name = "Sneaky Scouting",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133752539/377B718FE350EAE5B002F2AC0B72DCB94A98CF08/",
            pip = 2,
          },
          {
            name = "Courageous Counterattack",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133755677/82DB9DB79E1CB8732C43EDD3B117B69EE6DCA6B8/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Rebel",
      },
      ["LOGRAY SUPERSTITIOUS SHAMAN"] = {
        name = "Logray",
        title = "Superstitious Shaman",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133207972/4E2F553BC1FBA06D841591067D3D5E2AED2BF4E5/",
        size = "small",
        type = "Trooper",
        points = 45,
        speed = 2,
        upgrades = {
          Command = 1,
          Training = 3,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129309/3D6C219F243BDE984C42BB3444B01DB09B522CBB/",
          },        
        },
        rank = "Commander",
        faction = "Rebel",
      },
      ["C-3P0 GOLDEN GOD"] = {
        name = "C-3P0",
        title = "Golden God",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133206077/3E485B54786039A916672ED9387F5C2AC4415B97/",
        size = "small",
        type = "Trooper",
        points = 40,
        speed = 2,
        upgrades = {
        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/776232727456807069/DE7E32B39455DB5111769436FD0C5BFDA3841268/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/777357228032306506/D60CB8A1159723917EF1831D4042318A67458A7A/",
          },        
        },
        rank = "Commander",
        faction = "Rebel",
      },
      ["JYN ERSO STARDUST"] = {
        name = "Jyn Erso",
        title = "Stardust",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133196300/612F0E84DA6E44E3F325FA031FC6537A314B769F/",
        size = "small",
        type = "Trooper",
        points = 75,
        speed = 2,
        upgrades = {
          Command = 1,
          Training = 1,
          Gear = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/951848302305475778/55B558E631655D0430BAF76E71C93899AAECA7A1/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/951848302305475871/06400240648CC39F933BE504C74DA9BEF4D006C4/",
          },        
        },
        commands = {
          {
            name = "I Rebel",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133710266/ABE39C99F45579E1052C8F63229350F85EBE02D4/",
            pip = 1,
          },
          {
            name = "Trust Goes Both Ways",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133714087/00E3558ED7687A4BA73636EA8290E647CE946A5B/",
            pip = 2,
          },
          {
            name = "Rebellions Are Built on Hope",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133711911/08855BFCF5653BBBEC5E09846AA302C7665BAD94/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Rebel",
      },
      ["CASSIAN ANDOR CAPABLE INTELLIGENCE AGENT"] = {
        name = "Cassian Andor",
        title = "Capable Intelligence Agent",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133196164/8178848A6C088BDD3F7D1C3B2A2C52CD55A8ED64/",
        size = "small",
        type = "Trooper",
        points = 90,
        speed = 2,
        upgrades = {
          Training = 2,
          Gear = 1,
          Armament = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/773996263556990389/C38E9CAD7E5BA5496E1A211CA799E9ACBAC51D00/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/770611701143191344/5CAA4F0CE9A3FBE89A81560221ADCDDB5A801CC3/",
          },        
        },
        commands = {
          {
            name = "Crack Shot",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133709477/9F40BE3B7E4964FC3D3A6FE5D617D08E584F391B/",
            pip = 1,
          },
          {
            name = "Last Stand",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133711249/CCC78CABDD6AA13C1CE1421B63F76E18225B8359/",
            pip = 2,
          },
          {
            name = "Volunteer Mission",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133714589/039C85DD6F50BC392B1F1D3D542770E877B25A3C/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Rebel",
      },
      ["CHEWBACCA WALKING CARPET"] = {
        name = "Chewbacca",
        title = "Walking Carpet",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133196213/4E3D98C13521875895DBA499660FAD9C03401E19/",
        size = "small",
        type = "Wookiee Trooper",
        points = 90,
        speed = 2,
        upgrades = {
          Training = 2,
          Gear = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540540669973/90DD9EA44756CCF9B2473302DC644F3AEEED07B4/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670117/5AA04499FC8CC467864F9F335601E6335C03326D/",
          },        
        },
        commands = {
          {
            name = "Common Cause",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133708994/B3C343B1AB15D93C121AFBA7DBA5AF00A30519E5/",
            pip = 1,
          },
          {
            name = "Brains And Brawn",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133708752/39258ED34508F7BBCDB7FB38DC6E533D0F76A2AE/",
            pip = 2,
          },
          {
            name = "Notorious Scoundrels",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133711853/8E3AAF9ACF4DB73F5DA153B39F022E00F50CE865/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Rebel",
      },
      ["SABINE WREN EXPLOSIVE ARTIST"] = {
        name = "Sabine Wren",
        title = "Explosive Artist",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133198454/7B0CE6DEA21E5969ACFD78775BB716526A2F5E19/",
        size = "small",
        type = "Trooper",
        points = 125,
        speed = 3,
        upgrades = {
          Training = 1,
          Gear = 2,
          Armament = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809186599/4B154E18EF2C0ADE6C347FC4B15AD856D00546DF/",
          },        
        },
        commands = {
          {
            name = "Explosions!",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133709550/FD7BD543D5672320D01B8CB84960B07D13BFF009/",
            pip = 1,
          },
          {
            name = "Symbol Of Rebellion",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133714045/1B46D54400840D3F7B1C5DC9E65757945FD482C9/",
            pip = 2,
          },
          {
            name = "Legacy Of Mandalore",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133711283/D9F6D219F5B6DA873D7D366B31BC6EC667478368/",
            pip = 3,
          },        
        },
        additionalObjects = {
          "Proton Charge Token",
          "Proton Charge Token",
          "Graffiti Token",        
        },
        rank = "Operative",
        faction = "Rebel",
      },
      ["LUKE SKYWALKER JEDI KNIGHT"] = {
        name = "Luke Skywalker",
        title = "Jedi Knight",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133196988/42DDFCCED093080587DEC624C04303D85BF5C365/",
        size = "small",
        type = "Trooper",
        points = 195,
        speed = 2,
        upgrades = {
          Force = 3,
          Training = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/777357228030156264/12F93F60CC26F1FDC2B577D4014787B7CAFBF9A1/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/777357228030156398/F811CAE962A0BFE369544C0A96C251F5BF198B3A/",
          },        
        },
        commands = {
          {
            name = "Son Of Skywalker",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133712958/CF63D0FDA40318CE886E6DA309CEB291857776E4/",
            pip = 1,
          },
          {
            name = "You Serve Your Master Well",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133714680/FD14E558D7D2B7EF32BD992FFC1C89141CD1F192/",
            pip = 1,
          },
          {
            name = "My Ally Is The Force",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133711308/CECAE0B5B62858582522F7FBED6463FE5834A64E/",
            pip = 2,
          },
          {
            name = "Full Of Surprises",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133709999/FA890B2A2EA1528C8BCF2A80AEB3B97A97BB9E15/",
            pip = 2,
          },
          {
            name = "Return Of The Jedi",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133711996/90C4CB28C0554DEC3797882252E6C5D3CCAC65A1/",
            pip = 3,
          },
          {
            name = "I Am A Jedi",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133710140/F162DE57287EB8C43F845BF34550B6666929E36A/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Rebel",
      },
      ["R2-D2 HERO OF A THOUSAND DEVICES"] = {
        name = "R2-D2",
        title = "Hero Of A Thousand Devices",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384863210/CC236C516A4590747888E3A71ABA6C543905BD5F/",
        size = "small",
        type = "Droid Trooper",
        points = 55,
        speed = 1,
        upgrades = {
          Counterpart = 1,
          Comms = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/776232727456806966/EFBA4A71BFE748A2868C14B82DA3A7B0D559874A/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/777357228032306302/F5CA6FC54A8625E261F123D73792DE36D74E1686/",
          },        
        },
        commands = {
          {
            name = "Blast Off!",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133708728/EE34AF6EF6C63A6BC2C2E8985D9BCBA9809CACA6/",
            pip = 1,
          },
          {
            name = "Impromptu Immolation",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133711126/58749B0F102DF1389C70E66298838B28B9B6795E/",
            pip = 2,
          },
          {
            name = "Smoke Screen",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133712867/BD1886FA3B75683BB1B3D6C95971DFE1BBB5DD30/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Rebel",
      },
      ["K-2SO SARDONIC SECURITY DROID"] = {
        name = "K-2SO",
        title = "Sardonic Security Droid",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133196811/24F4099145C9D7E19B87DF774BF443DA448248D1/",
        size = "small",
        type = "Droid Trooper",
        points = 70,
        speed = 2,
        upgrades = {
          Comms = 1,
          Armament = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/773996263557000439/C9EA2A27264C73E42C016FE26E665CBB75F8E7DE/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/770611701143471855/26BE70BB475D8B61122C8954CCA2EC79C1ED4C25/",
          },        
        },
        commands = {
          {
            name = "Sacrifice",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133712817/9454157523A2CCA90773E8795DC9FBD317AB3059/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Rebel",
      },
      ["BOBA FETT DAIMYO OF MOS ESPA"] = {
        name = "Boba Fett",
        title = "Daimyo of Mos Espa",
        image = "https://steamusercontent-a.akamaihd.net/ugc/16579174465147196746/9D5131128D833819B159E467C76A731BA5E896EF/",
        size = "small",
        type = "Trooper",
        points = 120,
        speed = 2,
        upgrades = {
          Training = 2,
          Gear = 2,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728519554838398/33764317D1BE774E1F978082C1A97681C1183C01/",
          },        
        },
        commands = {
          {
            name = "A Simple Man",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133796666/FF13777E67A0A5315AB1DFE941DE403FEC542DA3/",
            pip = 1,
          },
          {
            name = "Whipcord Launcher",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133795508/C3589C8AFAB04E0FD8A92A983532CFCDF6FA1B89/",
            pip = 1,
          },
          {
            name = "Making His Way in the Galaxy",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133800518/86AF77B41A2B4EE0C0ED5C2100EEA0E97FAE08A8/",
            pip = 2,
          },
          {
            name = "ZX Flame Projector",
            image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865564034359/7CC1427FEA79D22D3128A5650F8A93159661A656/",
            pip = 2,
          },
          {
            name = "Rule with Respect",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133795310/09B0E60A61663E865F43404BD844454C358D8B41/",
            pip = 3,
          },
          {
            name = "Z-6 Jetpack Rocket",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133796142/01926BBF8B27E512F920012E557A61E05267633A/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Rebel",
      },
      ["DIN DJARIN THE MANDALORIAN"] = {
        name = "Din Djarin",
        title = "The Mandalorian",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137007934/A7B3E612E6E4A9392C36548BB7B507AFF0D3841D/",
        size = "small",
        type = "Trooper",
        points = 105,
        speed = 2,
        upgrades = {
          Training = 2,
          Comms = 1,
          Gear = 2,
          Armament = 1,
          Counterpart = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2446089105226763008/9B5002BC5C049F340FF7CDBC875F5053A5DB2574/",
          },        
        },
        commands = {
          {
            name = "This is the Way",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137015239/C47AEAA769E49330AF8A9A18B9E6FBBBC14D411B/",
            pip = 1,
          },
          {
            name = "I Like Those Odds",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137015412/584A22A4135D4349D3D2A2D269F97FAC5F14558C/",
            pip = 2,
          },
          {
            name = "The Hand Thing",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139777564/741083A5DC7A0B07FE1EFAC37B113604CA918C7F/",
            pip = 2,
          },
          {
            name = "Whistling Birds",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137015298/D63392C36661D3EB8E0376A51A461AA761D5827F/",
            pip = 3,
          },        
        },
        additionalObjects = {
          "Victory Token",        
        },
        rank = "Operative",
        faction = "Rebel",
      },
      ["IG-11 NURSE AND PROTECT"] = {
        name = "IG-11",
        title = "Nurse and Protect",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137008859/81A3C1FCE76085D59EE6AC6B2D28D6114E0CFBA2/",
        size = "small",
        type = "Droid Trooper",
        points = 110,
        speed = 2,
        upgrades = {
          Training = 1,
          Comms = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1789640371719058670/9E6B82A0BF8367F2C6D369BD3464DA5E9D0C7917/",
          },        
        },
        commands = {
          {
            name = "Mechanical Carnage",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137016841/F2528C4F77766BC90F225B6BBB4D3A42BB0EB0C4/",
            pip = 1,
          },
          {
            name = "A Machine Made For Killing",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137016998/E6071BE8EDF0A20E6032D047B35D5EF5FC8B7182/",
            pip = 2,
          },
          {
            name = "Anti-Capture Protocols",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137016902/C3B4710D3F5ACD27D67CB51B0C6B4E6B229B9BD9/",
            pip = 3,
          },        
        },
        additionalObjects = {
          "Victory Token",        
        },
        rank = "Operative",
        faction = "Rebel",
      },
      ["AHSOKA TANO FULCRUM"] = {
        name = "Ahsoka Tano",
        title = "Fulcrum",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133195586/1A1B3A8C98F61A54D40DD8920D859B78C1B08F2E/",
        size = "small",
        type = "Trooper",
        points = 165,
        speed = 2,
        upgrades = {
          Force = 2,
          Training = 2,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2023850162084443471/517A8997FB85780B040DD3017147753F438137CC/",
          },        
        },
        commands = {
          {
            name = "I am no Jedi",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133710197/7F9F965E20829475FF9BA4912847B9C623A46ACF/",
            pip = 1,
          },
          {
            name = "Swift Protector",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133713979/17BE69E23BB277BB589B016EAF7779DE55999582/",
            pip = 2,
          },
          {
            name = "Family Reunion",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133709585/EB651566F03586E293E563D69EFA56BF515E5251/",
            pip = 2,
          },
          {
            name = "A New Beginning",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133708687/2329C2477E6CB92E3434AC63CC2857D15ED189D0/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Rebel",
      },
      ["THE BAD BATCH CLONE FORCE 99"] = {
        name = "The Bad Batch",
        title = "Clone Force 99",
        image = "https://steamusercontent-a.akamaihd.net/ugc/12250968622432378580/92A3A64FE3A5BA176A4DF5D2BB6F66B8D47B840B/",
        size = "small",
        type = "Trooper",
        points = 140,
        speed = 2,
        upgrades = {
          Counterpart = 1,
          ["Heavy Weapon"] = 4,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2475370743175243916/EFBD0137414E802232F64B02C78A9D9275C9C1CB/",
          },        
        },
        commands = {
          {
            name = "We Do What We Do",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133795415/0235923ED3C127B003714A0C009AE79215524F73/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Rebel",
      },
      ["REBEL TROOPERS"] = {
        name = "Rebel Troopers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133198369/1E028B2F335F3E9FC0AABE4C0362F03AFB144C4E/",
        size = "small",
        type = "Trooper",
        points = 40,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780862746147/3F3A21962C4AC0DA0445024688BF580A144D3825/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670236/6257E7A3CE86803490A8A0FAC7F81C281D700F52/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780862752262/41BD6AB8B17AB7449226A3D80EF186EB8ABA3952/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780862750426/2563904D7561144EE85EBCD3E07D68F48D8DD034/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780862764799/98CBD8B4DD0C08CFA01A8E6C8B5A70A137804EAB/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780862750426/2563904D7561144EE85EBCD3E07D68F48D8DD034/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780862755846/CD522BCA5D6E918E13A3FF593D7212FF4B0E79CA/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780862750426/2563904D7561144EE85EBCD3E07D68F48D8DD034/",
          },        
        },
        rank = "Corps",
        faction = "Rebel",
      },
      ["FLEET TROOPERS"] = {
        name = "Fleet Troopers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133196242/48ACAF50F0BCD3D831101C13ECAF0BF0FBA9DC03/",
        size = "small",
        type = "Trooper",
        points = 40,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670464/96FB3825C890968C09B07A2E0E227886D2CC768C/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670556/9B759F6F1A8B7C11AE5F2908208CBA9EF99ECE2C/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670667/CB316B23D59F28C5EF22E94A43280D49DFFDD6AC/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670760/47DF3E87B3F71E8EA42A89ECFE96E4FB3990D7ED/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540540671182/A605D9D0DB356DC71473F5C9DF27DE1CADB4F320/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540540671278/9B94D359A61113F72EEB0435D70A1291431D737A/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670978/0642E99CB4E8CABA1AA10389F2387A1C70D9322D/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670760/47DF3E87B3F71E8EA42A89ECFE96E4FB3990D7ED/",
          },        
        },
        rank = "Corps",
        faction = "Rebel",
      },
      ["REBEL VETERANS"] = {
        name = "Rebel Veterans",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133198409/983DC405DCEE4973DB7FA2C3906BCF678F2B011D/",
        size = "small",
        type = "Trooper",
        points = 48,
        speed = 1,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Training = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192015/F194EFE217778158ED30DFD40EFC1F70BEC01772/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192135/526538CE10AC6856578996BE6B8AB7263D32D5C7/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192232/D15615AF2A0F4F4887E9BD3DFFA141C8ACCCEC78/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192135/526538CE10AC6856578996BE6B8AB7263D32D5C7/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192402/4D1858AA566FEEE91774E40B10C233AAD8C381D5/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192135/526538CE10AC6856578996BE6B8AB7263D32D5C7/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192498/BF583EA43B457E816CDE323C172B2F4558B7A8BD/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192135/526538CE10AC6856578996BE6B8AB7263D32D5C7/",
          },        
        },
        rank = "Corps",
        faction = "Rebel",
      },
      ["MARK II MEDIUM BLASTER TROOPER"] = {
        name = "Mark II Medium Blaster Trooper",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133197490/1B64AC039E75E3028CFF048F4DCAD95975C34A5D/",
        size = "medium",
        type = "Emplacement Trooper",
        points = 38,
        speed = 1,
        upgrades = {
          Comms = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359682702688462/6B35D0B4E18CB7D0081825BEDC6E6C4AE45AA329/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359682702688570/1827E8E24FE65F309AF936EF35D07CC2149CD95E/",
          },        
        },
        rank = "Corps",
        faction = "Rebel",
      },
      ["PYKE SYNDICATE FOOT SOLDIERS"] = {
        name = "Pyke Syndicate Foot Soldiers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718821/EBC76B7A94A5F3C03B036C17E3C26E0319F1C6EB/",
        size = "small",
        type = "Trooper",
        points = 44,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845548/FD104F41509A53EA1C888862A3C5F0B98F609F1F/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845646/BE0DEED782F96BD44C389DEDEA41EBEA0C7A6D04/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845697/15B6DCCA8D8D76E1CB78219C58790E40DDD7CE8A/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845389/0D7DFE0C5BF5CDD527A619B75A25A2177D417BD0/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },        
        },
        rank = "Corps",
        faction = "Rebel",
      },
      ["EWOK SKIRMISHERS"] = {
        name = "Ewok Skirmishers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133206135/9932914CEED1068F058672A166F0F7A67E5C68D5/",
        size = "small",
        type = "Trooper",
        points = 40,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 2,
          Training = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128972/9388116F0C7BE70B991CC7715943BF9FF08D3890/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129131/D612F1B1EBDA3172B69BEE40159CE5D999045A62/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129196/6EED0C8AAF8F50751EE4206471D1273B6C0F4B5A/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129252/FC0A6247B6AB21A99919659C1F9069186C6D82ED/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128356/9E8C70962F9D5BF853BD9310F2BB1E1A3F80DB5D/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128445/EBB56734DB6527B3566C317F6F4F0E84471D6776/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
          },        
        },
        rank = "Corps",
        faction = "Rebel",
      },
      ["REBEL COMMANDOS"] = {
        name = "Rebel Commandos",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133198280/BA9DB93D2D168B835C95075E8B1C52C79E044286/",
        size = "small",
        type = "Trooper",
        points = 48,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 1,
          Comms = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541173156/D637683F992DD0C4488252BE266EEEA1F26006B0/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541172655/B10522A40482843AF69A3F321BD091B0ECF52C6B/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541172497/B3E1593143504101920CC6419BE7C2EAEF52993F/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541188141/6E23E29BB42963B94A0B7DFE01C4C49D776D9657/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541173253/155BAA01BA51A8EB524DD434A3C512D8C0B3A04B/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541172655/B10522A40482843AF69A3F321BD091B0ECF52C6B/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541173354/3483C6FB73C66481BC6CCC398BAB8E796F7EC076/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541188141/6E23E29BB42963B94A0B7DFE01C4C49D776D9657/",
          },        
        },
        rank = "Special Forces",
        faction = "Rebel",
      },
      ["REBEL COMMANDOS STRIKE TEAM"] = {
        name = "Rebel Commandos",
        displayName = "Rebel Commandos (Strike Team)",
        title = "Strike Team",
        heavyWeaponTeam = true,
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133197589/A51BFFE52ED2FAE9DACE45BF774C7F5FE12CBC07/",
        size = "small",
        type = "Trooper",
        points = 20,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 1,
          Comms = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541173156/D637683F992DD0C4488252BE266EEEA1F26006B0/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541172655/B10522A40482843AF69A3F321BD091B0ECF52C6B/",
          },        
        },
        rank = "Special Forces",
        faction = "Rebel",
      },
      ["WOOKIEE WARRIORS FREEDOM FIGHTERS"] = {
        name = "Wookiee Warriors",
        title = "Freedom Fighters",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133195004/B68B0EBD3193888339421B0AFE8A9F9803EFC027/",
        size = "small",
        type = "Wookiee Trooper",
        points = 69,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 2,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541173937/5179F4315AD6B0839454E1934E794A7F006C7813/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541174467/18352D89A219B89F6C869D89B9EDE22822F7F950/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541174158/677BF72C323CFF2314C174393AFA361C398C5519/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541174034/90C4A124BB82CCE0B5E38E13860ED49BB9A4973B/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541174304/9053CDD2798CEA905F8486498D0104B6ACA2F078/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541174467/18352D89A219B89F6C869D89B9EDE22822F7F950/",
          },        
        },
        rank = "Special Forces",
        faction = "Rebel",
      },
      ["REBEL PATHFINDERS"] = {
        name = "Rebel Pathfinders",
        image = "https://steamusercontent-a.akamaihd.net/ugc/1683770969788604432/47C2CB26F7C98A3F449136D78165F64BE7D0A846/",
        size = "small",
        type = "Trooper",
        points = 56,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 1,
          Comms = 1,
          Gear = 1,
          Armament = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/951848302305475193/3C613417B99B185BBAEC7A4C66AAE10E8FD6F8D5/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/951848302305475310/FF2A55C2559DA2CA2108EE6D7E5605774EF1B04D/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/951848302305475558/EE0863D9DE3C9D35C486B7273E1D555BB1F09566/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/951848302305475310/FF2A55C2559DA2CA2108EE6D7E5605774EF1B04D/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/951848302305475456/26BF332D69FD5B08D677EBDB91948820E03690DB/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/951848302305475310/FF2A55C2559DA2CA2108EE6D7E5605774EF1B04D/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/951848302305475667/B5CC42E1CAB9059DEE4B1237222CF0FE3BB6B838/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/951848302305475310/FF2A55C2559DA2CA2108EE6D7E5605774EF1B04D/",
          },        
        },
        rank = "Special Forces",
        faction = "Rebel",
      },
      ["MANDALORIAN RESISTANCE"] = {
        name = "Mandalorian Resistance",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133197470/8F69CF0D59AA51A8D0EFB406C7B3594937BB8D3D/",
        size = "small",
        type = "Trooper",
        points = 68,
        speed = 3,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 1,
          Comms = 1,
          Gear = 1,
          Armament = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809186437/C255A6920C6B62ADD6B948311053BAAE4803BE29/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809186272/7872209AB5CBE104129F9AFC58267EB8F6CF80D1/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809186179/35024924D8BC8A727F508557AF7B714D2E3D22FF/",
          },        
        },
        rank = "Special Forces",
        faction = "Rebel",
      },
      ["MANDALORIAN RESISTANCE CLAN WREN"] = {
        name = "Mandalorian Resistance",
        title = "Clan Wren",
        displayName = "Clan Wren",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133197439/A9AEEBFD286112DACCAB9944794C5521EE60BB8E/",
        size = "small",
        type = "Trooper",
        points = 30,
        speed = 3,
        upgrades = {
          ["Heavy Weapon"] = 2,
          Training = 1,
          Comms = 1,
          Gear = 1,
          Armament = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809185852/7940F0BEFCFE905039054DA1CA3BBF3C0CB2C7A9/",
          },        
        },
        required = {
          "Ursa Wren",
          "Tristan Wren",        
        },
        rank = "Special Forces",
        faction = "Rebel",
      },
      ["WOOKIEE WARRIORS KASHYYYK RESISTANCE"] = {
        name = "Wookiee Warriors",
        title = "Kashyyyk Resistance",
        displayName = "Wookiee Warriors (Resistance)",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133195051/93FB6360319FCFB5CABA147A27FB34D2A843FAC2/",
        size = "small",
        type = "Wookiee Trooper",
        points = 72,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1619598366708043779/0D96CE1619F4B27F583257A366431E3BAD428F19/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1619598366708043883/1EA1B3C21A50C20D4D168AB91ECFE1C01A4F7DF5/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1619598366708043883/1EA1B3C21A50C20D4D168AB91ECFE1C01A4F7DF5/",
          },        
        },
        rank = "Special Forces",
        faction = "Rebel",
      },
      ["EWOK SLINGERS"] = {
        name = "Ewok Slingers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133206165/0E347DAEAF6A94808CAAC5869754E639B33F669F/",
        size = "small",
        type = "Trooper",
        points = 35,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 2,
          Training = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128972/9388116F0C7BE70B991CC7715943BF9FF08D3890/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128506/B24F2402EDC36C64688B7F492B382D972ABA30F1/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128565/24D88975D67E46B5FA9294EB6DCC146912D61F2F/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128627/19AC5B05F3A355226EE783B9F239B3B285EA077A/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128715/CB52DA6C0FC1DF3511C2A2D62CB2B3A13A9D4F8F/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128778/1D5BCB551375F1A7988C434F0B52E18434BB4747/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
          },        
        },
        rank = "Special Forces",
        faction = "Rebel",
      },
      ["REBEL SLEEPER CELL READY TO STRIKE"] = {
        name = "Rebel Sleeper Cell",
        title = "Ready to Strike",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133198319/3751EC4355C0216944AC0333339EEBB78ADD38D1/",
        size = "small",
        type = "Trooper",
        points = 70,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Gear = 1,
          Comms = 1,
          Training = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/2508033889679621098/DAC14B407CC47E5C2B4A3AFCF87A704907C3940A/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/2508033889679614622/B379336947ACE47BF9FBEECA30A93F6ABCD3842B/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/2508033889680567004/0BB417962A0ABE0E6381B767782F6BBA6AE62CE8/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/2508033889680567174/19D7BF881EDCD2F7FB8718CD79E678CFF56495FF/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/2508033889680568477/ECEA13C55B0C37AED1B8066D2158BE7F9A84FB32/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/2508033889680568730/452F1CC25775CDE1D107BC6C457E22740182F594/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/2508033889680572703/37BA3BE34A5FEBE80DB7A4EB6FB3BBFD87CCE22D/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/2508033889680573104/5EFBE526BA06E0026124917566EC020AACDBB9EB/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/2508033889680574338/C9C5456700D989BA3389499336AC8C5DA7586755/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/2508033889680574595/595808E8FBD39F09F2754FE48F97A4A493BD3A37/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/2508033889680574338/C9C5456700D989BA3389499336AC8C5DA7586755/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/2508033889680574595/595808E8FBD39F09F2754FE48F97A4A493BD3A37/",
          },        
        },
        rank = "Special Forces",
        faction = "Rebel",
      },
      ["AT-RT"] = {
        name = "AT-RT",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133195638/6804A989329D472D728452290CD8EFE41A02F9A2/",
        size = "large",
        type = "Ground Vehicle",
        points = 50,
        speed = 2,
        upgrades = {
          Hardpoint = 1,
          Comms = 1,        
        },
        silhouette = {
          height = 2.576,
          offset = 0,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541266463/014ECD21C93F864E1C1DFD104A365DFC555EBAF8/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541267239/D9891291A896CC024383C024B20C5ACF87EC8A18/",
          },        
        },
        rank = "Support",
        faction = "Rebel",
      },
      ["1.4 FD LASER CANNON TEAM"] = {
        name = "1.4 FD Laser Cannon Team",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133195524/B46674A1014A295A986942391D7C9DB1B92D8629/",
        size = "huge",
        type = "Emplacement Trooper",
        points = 65,
        speed = 1,
        upgrades = {
          Comms = 1,
          Generator = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541267781/BE163E2112B28E8C7C5E536B037D3115103F9642/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541269701/797EACA86E0FB799D16DC8FE907A70C4B976C5EE/",
          },        
        },
        rank = "Support",
        faction = "Rebel",
      },
      ["TAUNTAUN RIDERS"] = {
        name = "Tauntaun Riders",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133194939/65297606E28367C04BF4BB4DE3474EAB723F4416/",
        size = "medium",
        type = "Creature Trooper",
        points = 95,
        speed = 3,
        upgrades = {
          Training = 1,
          Comms = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/788608699499191489/E91DEB380842511B21284A125A505B6C71D18474/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/788608699499191676/8E19A176FF0B3D2923F8F3D6DEA80D389F77CB27/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/788608699499191881/3DBB7DF0943F0D25484DE34581411825BA566F8A/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/788608699499191676/8E19A176FF0B3D2923F8F3D6DEA80D389F77CB27/",
          },        
        },
        rank = "Support",
        faction = "Rebel",
      },
      ["SWOOP BIKE RIDERS"] = {
        name = "Swoop Bike Riders",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139721420/2BD490189FBB2AF2C7D6AA12EFA6EAA643EA2002/",
        size = "medium",
        type = "Repulsor Vehicle",
        points = 65,
        speed = 3,
        upgrades = {
          Comms = 1,        
        },
        silhouette = {
          height = 1.891,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1924743543116067434/0A068914BDD35AE6F63D7E29EBC7E0B5F712DA1F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1924743543116067490/87719312BE33C493B97B0915DB8C89FDC57D3F38/",
          },        
        },
        rank = "Support",
        faction = "Rebel",
      },
      ["T-47 AIRSPEEDER"] = {
        name = "T-47 Airspeeder",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133194839/3B6BF81A2960A253A671CEDBF09F3C22AD52277C/",
        size = "huge",
        type = "Repulsor Vehicle",
        points = 125,
        speed = 3,
        upgrades = {
          Pilot = 1,
          Hardpoint = 1,
          Comms = 1,        
        },
        silhouette = {
          height = 4.633,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1686023073179090715/187094FD9EBAFB6FF44A65F2D411D68154C0FAC7/",
          },        
        },
        rank = "Heavy",
        faction = "Rebel",
      },
      ["X-34 LANDSPEEDER"] = {
        name = "X-34 Landspeeder",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133195095/8AA9C62E3102445090A15FD71C48234EA2F1D03F/",
        size = "huge",
        type = "Repulsor Vehicle",
        points = 55,
        speed = 2,
        upgrades = {
          Pilot = 1,
          Crew = 2,
          Hardpoint = 1,
          Comms = 1,        
        },
        silhouette = {
          height = 1.9,
          offset = 0,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/949599512594267188/9FA2B8A42C94B6E3683F1B753CEBA14FC3258592/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/949599512594267308/582E5F56A65FE6CD486BCBABB510CAE4B4DF6C8C/",
          },        
        },
        rank = "Heavy",
        faction = "Rebel",
      },
      ["A-A5 SPEEDER TRUCK"] = {
        name = "A-A5 Speeder Truck",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133195560/90F1524F640B97B178EE17A8D5C3D73EDA51E80F/",
        size = "long",
        type = "Repulsor Vehicle",
        points = 65,
        speed = 1,
        height = 4,
        upgrades = {
          Pilot = 1,
          Crew = 2,
          Hardpoint = 1,
          Comms = 1,        
        },
        silhouette = {
          height = 3.591,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1802024425338475441/730DE7AD6E1A55EA9F9264DADC1DDC0AC2CCA565/",
          },        
        },
        rank = "Heavy",
        faction = "Rebel",
      },
      ["CHEWBACCA LET THE WOOKIEE WIN"] = {
        name = "Chewbacca",
        title = "Let the Wookiee Win",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133206109/0DCD00886E51BDA8114E68212DAB8591AFF28DE6/",
        size = "huge",
        type = "Ground Vehicle",
        points = 180,
        speed = 2,
        upgrades = {
        
        },
        silhouette = {
          height = 8.84,
          offset = 0,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/999141806429351360/24C098E7B3D1708CDCFB9AEA4B2C445EF2DBAEE0/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/1752434998239690716/C6578DAF9012605B1F44A907D1C28646E34A73CF/",
          },        
        },
        commands = {
          {
            name = "Common Cause",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133708994/B3C343B1AB15D93C121AFBA7DBA5AF00A30519E5/",
            pip = 1,
          },
          {
            name = "Brains And Brawn",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133708752/39258ED34508F7BBCDB7FB38DC6E533D0F76A2AE/",
            pip = 2,
          },
          {
            name = "Notorious Scoundrels",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133711853/8E3AAF9ACF4DB73F5DA153B39F022E00F50CE865/",
            pip = 3,
          },        
        },
        rank = "Heavy",
        faction = "Rebel",
      },
    },
    ["EMPIRE"] = {
      ["DARTH VADER DARK LORD OF THE SITH"] = {
        name = "Darth Vader",
        title = "Dark Lord Of The Sith",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135444419/726425B7C209349209399BDDB87B34BE0B4447AA/",
        size = "small",
        type = "Trooper",
        points = 190,
        speed = 1,
        upgrades = {
          Force = 3,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541323740/BF58AB674CB7D638333F1B04A7C9A5B9D7DBF0E4/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541324289/B37D84D512722740E8310629C3E7BFC45AF0FBC9/",
          },        
        },
        commands = {
          {
            name = "Implacable",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135444439/06F119390473A1CAA7F4785636130B4D857A61A8/",
            pip = 1,
          },
          {
            name = "Vader's Might",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135444550/33DB2D103378C35509E7FEE23A0ACD2BFEE8195E/",
            pip = 1,
          },
          {
            name = "New Ways To Motivate Them",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135444510/952B5595A8E35BF7E2A0B51933DEC0A855D8EBAB/",
            pip = 2,
          },
          {
            name = "Fear And Dead Men",
            image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384885751/FEED7C91A363ECAC94BCD7395AB4CA196889147B/",
            pip = 2,
          },
          {
            name = "Master Of Evil",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135444481/AF8E308CE2EE310C787E53AA0BAC97471DC05621/",
            pip = 3,
          },
          {
            name = "Darkness Descends",
            image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384868611/E02306C20DA2B9C1C2D5A987429939564A935200/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Empire",
      },
      ["GENERAL VEERS MASTER TACTICIAN"] = {
        name = "General Veers",
        title = "Master Tactician",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384862383/B5EA5EAF81F9D730B20E0EED4BFFDCE93CCDAE45/",
        size = "small",
        type = "Trooper",
        points = 75,
        speed = 2,
        upgrades = {
          Command = 2,
          Gear = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541565411/F5F84397A9353DAD3D913F34E49812C1C895DA65/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541565593/F948637FEE70F52681A5A3C49C0E00EF25471AC1/",
          },        
        },
        commands = {
          {
            name = "Maximum Firepower",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135449935/27D7D687763686F54338BA5A2848E1B1A65C62A7/",
            pip = 1,
          },
          {
            name = "Evasive Maneuvers",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135449823/16F99AFAA1AD6647F0B47ED9FBF3EEDF2A034BFE/",
            pip = 2,
          },
          {
            name = "Imperial Discipline",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135449883/86FF6A857D6EBD4365D06547285401B3E3D4B79F/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Empire",
      },
      ["DIRECTOR ORSON KRENNIC ARCHITECT OF TERROR"] = {
        name = "Director Orson Krennic",
        title = "Architect Of Terror",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384861964/1F16DA425DE63290D76463CDDDE253E5B201EA64/",
        size = "small",
        type = "Trooper",
        points = 65,
        speed = 2,
        upgrades = {
          Command = 2,
          Gear = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/951848302305476013/77069645EC03E0F1C1DB10C2CE7EA85917E45404/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/951848302305476130/772EEBD3EC49A7271C1C7647F817C51ED23DE3B2/",
          },        
        },
        commands = {
          {
            name = "Voracious Ambition",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135450643/8B21E1AC56AE75D2204878EA62E65325AE365494/",
            pip = 1,
          },
          {
            name = "Deploy The Garrison",
            image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865564035541/3076FCDDC51B733A5970AD91FE0698F9A1888084/",
            pip = 2,
          },
          {
            name = "Annihilation Looms",
            image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384868277/1F59C545DAC623A8CC344AA96E40981F9A656079/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Empire",
      },
      ["IDEN VERSIO INFERNO SQUAD LEADER"] = {
        name = "Iden Versio",
        title = "Inferno Squad Leader",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135447992/97B7DD726FEB2C4811A53FE5B68FB430713FB9FD/",
        size = "small",
        type = "Trooper",
        points = 100,
        speed = 2,
        upgrades = {
          Training = 2,
          Gear = 1,
          Armament = 1,
          Counterpart = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/773996263557021593/68887AFFBF8F1A2472A80F6514CD617A54A1D705/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/770611889400014191/9442AAB074AB2204C7A5CD8843037C71CFC44540/",
          },        
        },
        commands = {
          {
            name = "Pulse Scan",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135447957/DFC97CD26266A0F75601991E627A9A7D88D2DC26/",
            pip = 1,
          },
          {
            name = "Concussive Blast",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135447851/69B1F705930944BD26685CDCB3F7A52127D9BF25/",
            pip = 2,
          },
          {
            name = "Incapacitate",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135447917/9D2822AF6299DF22D89273129D1E7870430429DF/",
            pip = 2,
          },
          {
            name = "Tactical Strike",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135447971/CD83916F6A11CD5CE3D75CCACA9FA01C248FDF18/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Empire",
      },
      ["MOFF GIDEON LONG LIVE THE EMPIRE"] = {
        name = "Moff Gideon",
        title = "Long Live the Empire",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135445399/8AB358A896676499DDA9B176E90E39AEA6C36DB1/",
        size = "small",
        type = "Trooper",
        points = 100,
        speed = 2,
        upgrades = {
          Command = 2,
          Training = 1,
          Gear = 1,
          Armament = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2446089105227025807/2E7D8F479762060CAF447A2E5A6C27891C314EA2/",
          },        
        },
        commands = {
          {
            name = "Die at My Hand",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135445379/2E1BA2F22E9816B73C934205D77DDAB726F93D44/",
            pip = 1,
          },
          {
            name = "You Have Something I Want",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135445472/1CCEC5B09B861DA2530A4F9C5548480F5B9CC7B8/",
            pip = 2,
          },
          {
            name = "Moment of Consideration",
            image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384886856/80255CC3DC05C1CD68DB15DDDA530F15BB82EA99/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Empire",
      },
      ["PYKE SYNDICATE CAPO"] = {
        name = "Pyke Syndicate Capo",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718883/40D17DA044960A4A34979FBDEAE9296EB1E50346/",
        size = "small",
        type = "Trooper",
        points = 48,
        speed = 2,
        upgrades = {
          Command = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420351237/706DEA645FEE2EC9787F05F4FF2926632E2C4894/",
          },        
        },
        rank = "Commander",
        faction = "Empire",
      },
      ["BLACK SUN VIGO"] = {
        name = "Black Sun Vigo",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718200/725F66281B4596ACF010C38A1E37D169B597D56C/",
        size = "small",
        type = "Trooper",
        points = 50,
        speed = 2,
        upgrades = {
          Command = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143763/E93BA6716A05CA95AE2EA3B7C0DFD8AF145D5C22/",
          },        
        },
        rank = "Commander",
        faction = "Empire",
      },
      ["BOBA FETT INFAMOUS BOUNTY HUNTER"] = {
        name = "Boba Fett",
        title = "Infamous Bounty Hunter",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137005787/86FC806D7DFDD74A0AB92D0E1B2D4842E84DB677/",
        size = "small",
        type = "Trooper",
        points = 130,
        speed = 3,
        upgrades = {
          Training = 2,
          Comms = 1,
          Gear = 2,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541667697/9BC2C54E14EA265620F3D96553274503245D1681/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541669466/60DFE8F3EC756ECE7E5729D3261EF37CACA587C6/",
          },        
        },
        commands = {
          {
            name = "A Simple Man",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137003571/5A5FB50BC907A26126D8D458A0A4A3283DFFFEC0/",
            pip = 1,
          },
          {
            name = "Whipcord Launcher",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137003429/DD564B5EA75537F3EBD45048833E5810DF5B33F5/",
            pip = 1,
          },
          {
            name = "Making His Way in the Galaxy",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137003517/D14FF44B1B27BEA7A9058101AD2C8B1FB8FAA445/",
            pip = 2,
          },
          {
            name = "Rule with Respect",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137003465/FB8C27572F44CAC6D4D6222AE11DA7A1EE7E201F/",
            pip = 3,
          },
          {
            name = "Z-6 Jetpack Rocket",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137003593/EDE3AF9DE7EE272F32C187643DFE4A565B205FD6/",
            pip = 3,
          },        
        },
        additionalObjects = {
          "Victory Token",        
        },
        rank = "Operative",
        faction = "Empire",
      },
      ["BOSSK TRANDOSHAN TERROR"] = {
        name = "Bossk",
        title = "Trandoshan Terror",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137006564/2C7F90FF127392A78F71B82EF4E69C35973824AD/",
        size = "small",
        type = "Trooper",
        points = 105,
        speed = 2,
        upgrades = {
          Training = 2,
          Gear = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/948474323838791181/6B9D77B77DF8FD7AFA19342AD687F0E15A2E21B7/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/948474323838791276/ABFCDD8C71D484E6B6050080BB80B79D0DE93178/",
          },        
        },
        commands = {
          {
            name = "Merciless Munitions",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137013809/1D7FCC2F2A12F6B09B07345330F840800A846F7C/",
            pip = 1,
          },
          {
            name = "Reptilian Rampage",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137013972/29F197704D74AF20E8954F2BE8AC5C9203F9A2E6/",
            pip = 2,
          },
          {
            name = "Lying In Wait",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137013903/60F4AC014F68998F8A3587BA0A5389301A0BAA7C/",
            pip = 3,
          },        
        },
        additionalObjects = {
          "Proton Charge Token",
          "Victory Token",        
        },
        rank = "Operative",
        faction = "Empire",
      },
      ["CAD BANE NEEDS NO INTRODUCTION"] = {
        name = "Cad Bane",
        title = "Needs No Introduction",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137007196/49655B5A32FFAB3CE31BFCCFEA9811CD4A51B748/",
        size = "small",
        type = "Trooper",
        points = 105,
        speed = 2,
        upgrades = {
          Training = 2,
          Comms = 1,
          Gear = 1,
          Armament = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/1003681674396400482/F8900CFC9EF2309C9F54AE33AE5444B2B09DB1CD/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/1003681674396400696/907F4310FEA7A7CD89EE64A1AF3A8CC77897CCAC/",
          },        
        },
        commands = {
          {
            name = "I'm Your Worst Nightmare",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137014543/33FE8591FAFD29F8BEAF13D64851772A7FD794FE/",
            pip = 1,
          },
          {
            name = "I'm In Control",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137014579/D2FC7AF724D1C7527CCDDABF18517E9CB99DF061/",
            pip = 2,
          },
          {
            name = "I Make The Rules Now",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137014560/4B6E8AF4CB10FFE7EC529D204390FC45291FC962/",
            pip = 3,
          },        
        },
        additionalObjects = {
          "Bane Token: Blank",
          "Bane Token: Bomb",
          "Bane Token: Bane",
          "Victory Token",        
        },
        rank = "Operative",
        faction = "Empire",
      },
      ["DARTH VADER THE EMPEROR'S APPRENTICE"] = {
        name = "Darth Vader",
        title = "The Emperor's Apprentice",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135453126/1C9CAD022704D64F0B9139865DBEB8BCA11EBFA4/",
        size = "small",
        type = "Trooper",
        points = 175,
        speed = 2,
        upgrades = {
          Force = 2,
          Training = 2,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/777357228030156593/FEBA127ECDF2917EA8F8066BBB10BADA7D365D3E/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541324289/B37D84D512722740E8310629C3E7BFC45AF0FBC9/",
          },        
        },
        commands = {
          {
            name = "Implacable",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135444439/06F119390473A1CAA7F4785636130B4D857A61A8/",
            pip = 1,
          },
          {
            name = "Vader's Might",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135444550/33DB2D103378C35509E7FEE23A0ACD2BFEE8195E/",
            pip = 1,
          },
          {
            name = "New Ways To Motivate Them",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135444510/952B5595A8E35BF7E2A0B51933DEC0A855D8EBAB/",
            pip = 2,
          },
          {
            name = "Fear And Dead Men",
            image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384885751/FEED7C91A363ECAC94BCD7395AB4CA196889147B/",
            pip = 2,
          },
          {
            name = "Master Of Evil",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135444481/AF8E308CE2EE310C787E53AA0BAC97471DC05621/",
            pip = 3,
          },
          {
            name = "Darkness Descends",
            image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384868611/E02306C20DA2B9C1C2D5A987429939564A935200/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Empire",
      },
      ["IG-88 NOTORIOUS ASSASSIN DROID"] = {
        name = "IG-88",
        title = "Notorious Assassin Droid",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137009352/1C2EF08C41D85E6F3B214B380DA174D2AADE6BDB/",
        size = "small",
        type = "Droid Trooper",
        points = 110,
        speed = 2,
        upgrades = {
          Training = 1,
          Comms = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1789640371719058670/9E6B82A0BF8367F2C6D369BD3464DA5E9D0C7917/",
          },        
        },
        commands = {
          {
            name = "Focused on the Kill",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137026321/D9785EEF3FE2835319A9F3A2FB632A6E68D34371/",
            pip = 1,
          },
          {
            name = "A Machine Made For Killing",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137016998/E6071BE8EDF0A20E6032D047B35D5EF5FC8B7182/",
            pip = 2,
          },
          {
            name = "Independent Programming",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137017800/F888E446D9C374E57E091347F651D30A7CEEC81F/",
            pip = 2,
          },        
        },
        additionalObjects = {
          "Victory Token",        
        },
        rank = "Operative",
        faction = "Empire",
      },
      ["DIN DJARIN THE MANDALORIAN"] = {
        name = "Din Djarin",
        title = "The Mandalorian",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137007934/A7B3E612E6E4A9392C36548BB7B507AFF0D3841D/",
        size = "small",
        type = "Trooper",
        points = 105,
        speed = 2,
        upgrades = {
          Training = 2,
          Comms = 1,
          Gear = 2,
          Armament = 1,
          Counterpart = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2446089105226763008/9B5002BC5C049F340FF7CDBC875F5053A5DB2574/",
          },        
        },
        commands = {
          {
            name = "This is the Way",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137015239/C47AEAA769E49330AF8A9A18B9E6FBBBC14D411B/",
            pip = 1,
          },
          {
            name = "I Like Those Odds",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137015412/584A22A4135D4349D3D2A2D269F97FAC5F14558C/",
            pip = 2,
          },
          {
            name = "The Hand Thing",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139777564/741083A5DC7A0B07FE1EFAC37B113604CA918C7F/",
            pip = 2,
          },
          {
            name = "Whistling Birds",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137015298/D63392C36661D3EB8E0376A51A461AA761D5827F/",
            pip = 3,
          },        
        },
        additionalObjects = {
          "Victory Token",        
        },
        rank = "Operative",
        faction = "Empire",
      },
      ["IG-11 NURSE AND PROTECT"] = {
        name = "IG-11",
        title = "Nurse and Protect",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137008859/81A3C1FCE76085D59EE6AC6B2D28D6114E0CFBA2/",
        size = "small",
        type = "Droid Trooper",
        points = 110,
        speed = 2,
        upgrades = {
          Training = 1,
          Comms = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1789640371719058670/9E6B82A0BF8367F2C6D369BD3464DA5E9D0C7917/",
          },        
        },
        commands = {
          {
            name = "Mechanical Carnage",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137016841/F2528C4F77766BC90F225B6BBB4D3A42BB0EB0C4/",
            pip = 1,
          },
          {
            name = "A Machine Made For Killing",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137016998/E6071BE8EDF0A20E6032D047B35D5EF5FC8B7182/",
            pip = 2,
          },
          {
            name = "Anti-Capture Protocols",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137016902/C3B4710D3F5ACD27D67CB51B0C6B4E6B229B9BD9/",
            pip = 3,
          },        
        },
        additionalObjects = {
          "Victory Token",        
        },
        rank = "Operative",
        faction = "Empire",
      },
      ["FIFTH BROTHER THE KILL IS MINE"] = {
        name = "Fifth Brother",
        title = "The Kill is Mine",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137011062/2CD518FAF98E506E8D2316B4A21294FAE1D2DAF8/",
        size = "small",
        type = "Trooper",
        points = 105,
        speed = 2,
        upgrades = {
          Force = 1,
          Training = 2,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2456221571853672166/B86F663B609267644D837B4F18C59614C6785229/",
          },        
        },
        commands = {
          {
            name = "You Would Question Me?",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137018940/87231143078D7F264017F3EF0B7C221098555811/",
            pip = 2,
          },
          {
            name = "I Care Not for your Struggles",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137018989/07882CCD7D056DFFB777074A53C21811352E6844/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Empire",
      },
      ["SEVENTH SISTER COMPELLED TO INFLICT PAIN"] = {
        name = "Seventh Sister",
        title = "Compelled to Inflict Pain",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137011773/5377A3D119B96061C7EFAF2F8469BD5E889F3F13/",
        size = "small",
        type = "Trooper",
        points = 110,
        speed = 2,
        upgrades = {
          Force = 1,
          Training = 2,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2446090001278329724/E8E229E0E3FB6230D9F5A1823C71032A0FC9F2D0/",
          },        
        },
        commands = {
          {
            name = "Come and Prove It",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137019689/3B73F5638839DF849BC5921412BCC4ABCC35DAEC/",
            pip = 1,
          },
          {
            name = "Unexpected, but not Unwelcome",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137019893/59EB748713DD2A67E92CCFE9D3243D15C3670FBC/",
            pip = 2,
          },
          {
            name = "You Hide Your Fear Well",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137019788/90EA4637127092D742B503FE3E5DF0F9E96473A0/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Empire",
      },
      ["AGENT KALLUS HUNTER OF SPECTRES"] = {
        name = "Agent Kallus",
        title = "Hunter Of Spectres",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135448854/CC65D752275214DB6D5791534DDEFF4784D6259E/",
        size = "small",
        type = "Trooper",
        points = 90,
        speed = 2,
        upgrades = {
          Command = 1,
          Training = 1,
          Gear = 1,
          Armament = 1,
          Flaw = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2446089105227059084/0EB4EE32683338BC754DA5EC1F613ABA71048E90/",
          },        
        },
        commands = {
          {
            name = "Face Me!",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135448798/AACA6ECCF1997BBEB2F5A054C4EC8B0D47C2D0C7/",
            pip = 1,
          },
          {
            name = "ISB Investigation",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135448812/E8D9B9BDEB69B87FADD3E294851E7AFD6868EB42/",
            pip = 2,
          },
          {
            name = "Ruthless Tactics",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135448839/F78FAA7976B9225D466E754C622758F60EE30D5F/",
            pip = 3,
          },        
        },
        additionalObjects = {
          "Victory Token",        
        },
        rank = "Operative",
        faction = "Empire",
      },
      ["STORMTROOPERS"] = {
        name = "Stormtroopers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384863867/71125D3CB8BC663C340433AED88CA794951DCA34/",
        size = "small",
        type = "Trooper",
        points = 42,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2478747809413608082/BD8A164AAD4C70AE2F8CB8165F3D2DC9FD94C778/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2478747809407737751/27A207BFDA271D2EA267D400CBDF551B11EE093C/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2478747809407737751/27A207BFDA271D2EA267D400CBDF551B11EE093C/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2478747809407737751/27A207BFDA271D2EA267D400CBDF551B11EE093C/",
          },        
        },
        rank = "Corps",
        faction = "Empire",
      },
      ["STORMTROOPER RIOT SQUAD"] = {
        name = "Stormtrooper Riot Squad",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139658813/F6DC48260186CC0283711F9A6E216341F1631319/",
        size = "small",
        type = "Trooper",
        points = 50,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 2,
          Gear = 1,
          Training = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2491137781649821645/5FF305DCBED87DDE0DC92AB430557E501D5CDFC2/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2491137781649821736/A6557A52AB579A320023B7028C55A38815DC566E/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2491137781649821412/A274C8B3E646E0EBFB81D282570C5A1C6D263F2B/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2491137781649821736/A6557A52AB579A320023B7028C55A38815DC566E/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2491137781649821497/585AF58548561265B23B01A56577DE0732464636/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2491137781649821736/A6557A52AB579A320023B7028C55A38815DC566E/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2491137781649821557/0B4EFC2CDDBC7BB72768141562946583278CAAD6/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2491137781649821736/A6557A52AB579A320023B7028C55A38815DC566E/",
          },        
        },
        rank = "Corps",
        faction = "Empire",
      },
      ["STORMTROOPERS HEAVY RESPONSE UNIT"] = {
        name = "Stormtroopers Heavy Response Unit",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384863789/6869DCFFBE7B47365197E220FB76E24E70D13808/",
        size = "small",
        type = "Trooper",
        points = 36,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 2,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141156/BF26D516EA8F33C72822FF9AB369FF7CA444C403/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141746/A8FD77EB51C50C64CD924BDAEEDB70D8839E0EF3/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141545/30BEFE4E87E379AA361AFF5FD24A8F5D3F0BA4C0/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141746/A8FD77EB51C50C64CD924BDAEEDB70D8839E0EF3/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141624/1366A6A4D84D9FE597EEA2736AFC187F392418DA/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141746/A8FD77EB51C50C64CD924BDAEEDB70D8839E0EF3/",
          },        
        },
        rank = "Corps",
        faction = "Empire",
      },
      ["SNOWTROOPERS"] = {
        name = "Snowtroopers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384863754/2B0DF1A43014AABAE680518777D8D9B72CA26DF1/",
        size = "small",
        type = "Trooper",
        points = 42,
        speed = 1,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801027/2A5DEE9952A0179FC8448FFA52819B387124ACD7/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801215/595165C57A67BF2BD505BE6F0DF8F11AD4EA55D2/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801837/D52F333945BF667A37E06611977C36186CEFC7B6/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801215/595165C57A67BF2BD505BE6F0DF8F11AD4EA55D2/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801500/728C586E21D0A4EBD8DE54EEF4E097EFEEECE871/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801215/595165C57A67BF2BD505BE6F0DF8F11AD4EA55D2/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801363/743D9E272367ABB1F6296D5EFB6010637C58D5E4/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801215/595165C57A67BF2BD505BE6F0DF8F11AD4EA55D2/",
          },        
        },
        rank = "Corps",
        faction = "Empire",
      },
      ["SHORETROOPERS"] = {
        name = "Shoretroopers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384863691/D8CE49A682DADD9B1E57E3EA64BFA5F86F1AD883/",
        size = "small",
        type = "Trooper",
        points = 52,
        speed = 1,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Training = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359682702688359/642C317FE5C91E4DCC908FEA02A7ED4000B06A9F/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687694/C12AAE8B7F487BE4C1545E253AB3C026E0426AA1/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687570/0D2A602282BAACDCE665EF9D1D65CEA413944083/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687694/C12AAE8B7F487BE4C1545E253AB3C026E0426AA1/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359682702688133/C8D721D29D711045A27EEC3868D4B7A111C86F20/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687694/C12AAE8B7F487BE4C1545E253AB3C026E0426AA1/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687282/B02342FDEEE7DDE82DF96EB434B1D033B0A4C899/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687694/C12AAE8B7F487BE4C1545E253AB3C026E0426AA1/",
          },        
        },
        rank = "Corps",
        faction = "Empire",
      },
      ["DF-90 MORTAR TROOPER"] = {
        name = "DF-90 Mortar Trooper",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139662551/E8496B01C9619FBA2E5EEEBEF285ABEEF95ECF00/",
        size = "medium",
        type = "Emplacement Trooper",
        points = 40,
        speed = 1,
        upgrades = {
          Comms = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359682702688709/1EB7C549A90465F116EF307643FEA1D572CE1008/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359682702688820/94F2B4954FD378EA9E5544E37B80B8556812F2F2/",
          },        
        },
        rank = "Corps",
        faction = "Empire",
      },
      ["PYKE SYNDICATE FOOT SOLDIERS"] = {
        name = "Pyke Syndicate Foot Soldiers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718821/EBC76B7A94A5F3C03B036C17E3C26E0319F1C6EB/",
        size = "small",
        type = "Trooper",
        points = 44,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845548/FD104F41509A53EA1C888862A3C5F0B98F609F1F/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845646/BE0DEED782F96BD44C389DEDEA41EBEA0C7A6D04/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845697/15B6DCCA8D8D76E1CB78219C58790E40DDD7CE8A/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845389/0D7DFE0C5BF5CDD527A619B75A25A2177D417BD0/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },        
        },
        rank = "Corps",
        faction = "Empire",
      },
      ["BLACK SUN ENFORCERS"] = {
        name = "Black Sun Enforcers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718139/222491782E56EAECE8B93E78E946F308211DC049/",
        size = "small",
        type = "Trooper",
        points = 50,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845475/01738B0D52E2D9C2870D6E33A2D05ECD12201C85/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143724/48B5A35E10B4977E255D889A8FCAEA8C980A11A9/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143328/3D6F3C2E8DFB78B9B748FFC8F339B9C568D7408E/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143724/48B5A35E10B4977E255D889A8FCAEA8C980A11A9/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143328/3D6F3C2E8DFB78B9B748FFC8F339B9C568D7408E/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143724/48B5A35E10B4977E255D889A8FCAEA8C980A11A9/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143328/3D6F3C2E8DFB78B9B748FFC8F339B9C568D7408E/",
          },        
        },
        rank = "Corps",
        faction = "Empire",
      },
      ["SCOUT TROOPERS"] = {
        name = "Scout Troopers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139667737/5A74C7A6641FF79D0BEA098600B7338595160681/",
        size = "small",
        type = "Trooper",
        points = 48,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 1,
          Comms = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541911155/36E8C01A67E5E7A4188FC619261E0BAB0DF438C1/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/950714557093539603/6584D58DCD3135C901F302599C304E2D7044AD4B/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541911406/C33160A2888F0CE53C9712B1872478E038F9B0EA/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/950714557093539603/6584D58DCD3135C901F302599C304E2D7044AD4B/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541911585/324AE8DA9D33C07E2FE620FC4B49E2C190F39F5A/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/950714557093539603/6584D58DCD3135C901F302599C304E2D7044AD4B/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541911689/42647324CBDBF25155498DF1FFDDDC2EC04FB5EC/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/950714557093539603/6584D58DCD3135C901F302599C304E2D7044AD4B/",
          },        
        },
        rank = "Special Forces",
        faction = "Empire",
      },
      ["SCOUT TROOPERS STRIKE TEAM"] = {
        name = "Scout Troopers",
        title = "Strike Team",
        displayName = "Scout Troopers (Strike Team)",
        heavyWeaponTeam = true,
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384863628/C90F310AB2FFFFB744B68B2A0D3B0C657FA8ABA4/",
        size = "small",
        type = "Trooper",
        points = 20,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 1,
          Comms = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541911155/36E8C01A67E5E7A4188FC619261E0BAB0DF438C1/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/950714557093539603/6584D58DCD3135C901F302599C304E2D7044AD4B/",
          },        
        },
        rank = "Special Forces",
        faction = "Empire",
      },
      ["IMPERIAL DEATH TROOPERS"] = {
        name = "Imperial Death Troopers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139667689/20539A9EAB988308E299A3DE18818D7B9FBA63C9/",
        size = "small",
        type = "Trooper",
        points = 72,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 2,
          Comms = 1,
          Gear = 1,
          Armament = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/951848302305474570/777B8146B150032E3D733D17110BE5887D1AB991/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/951848302305474695/F076E77D0278B10EAE330BC9073B05BC9A3BCD57/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/951848302305474824/49EFFD221EF1EBD3F3365B6B73B9A4A5C6E6A075/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/951848302305474695/F076E77D0278B10EAE330BC9073B05BC9A3BCD57/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/951848302305474956/BB78111128E91BB2DB22F2990AFB438B9EA5FC0E/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/951848302305474695/F076E77D0278B10EAE330BC9073B05BC9A3BCD57/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/951848302305475069/81803116C6F5F9B133D2D0CC39E2A2CA6043E9DB/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/951848302305474695/F076E77D0278B10EAE330BC9073B05BC9A3BCD57/",
          },        
        },
        rank = "Special Forces",
        faction = "Empire",
      },
      ["IMPERIAL SPECIAL FORCES"] = {
        name = "Imperial Special Forces",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139667628/DC827BC31A0CA433CBACA568292623523896981F/",
        size = "small",
        type = "Trooper",
        points = 68,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 2,
          Comms = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1618438238122999812/779C9D69CA440F970DD0B7C6394A812732F9C588/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1618438238123043414/B7E9660E470DC070545782406C29F1E1356A5685/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1618438238122996093/C79160007FD884C2B8737DCA888D61C955073141/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1618438238123043414/B7E9660E470DC070545782406C29F1E1356A5685/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1618438238122996656/AAD706C50446522C98259A20C03E757C4F7B98B1/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1618438238123043414/B7E9660E470DC070545782406C29F1E1356A5685/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1618438238122997115/F100B28E5DBF4A56FB22D3410270BEE4EF344FEF/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1618438238123043414/B7E9660E470DC070545782406C29F1E1356A5685/",
          },        
        },
        rank = "Special Forces",
        faction = "Empire",
      },
      ["IMPERIAL SPECIAL FORCES INFERNO SQUAD"] = {
        name = "Imperial Special Forces",
        title = "Inferno Squad",
        displayName = "Inferno Squad",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139667572/5230C0C79688307883294267607D597037641B36/",
        size = "small",
        type = "Trooper",
        points = 34,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 2,
          Training = 2,
          Comms = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1618438238122999341/C1AEEE50112F060BA8E5CAFBC16F417A0EF7C3C0/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1618438238123043414/B7E9660E470DC070545782406C29F1E1356A5685/",
          },        
        },
        required = {
          "Gideon Hask",
          "Del Meeko",        
        },
        rank = "Special Forces",
        faction = "Empire",
      },
      ["74-Z SPEEDER BIKES"] = {
        name = "74-Z Speeder Bikes",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139672763/037D15DE4ACD0941BA57FEEBDEBE3F346E04F8BC/",
        size = "medium",
        type = "Repulsor Vehicle",
        points = 70,
        speed = 3,
        upgrades = {
          Comms = 1,        
        },
        silhouette = {
          height = 1.561,
          offset = 0,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540542045928/74630975D4992CA09BDDD88460874FB9E4095FC9/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540542045645/AF0264339BB7E1D09E74AF920E2FB693C3CA1592/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540542045506/0E2EC344AA0AD37699FFEFD4E1BA86A4FD4CD48B/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540542045645/AF0264339BB7E1D09E74AF920E2FB693C3CA1592/",
          },        
        },
        rank = "Support",
        faction = "Empire",
      },
      ["E-WEB HEAVY BLASTER TEAM"] = {
        name = "E-Web Heavy Blaster Team",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384862029/A422AB31270839D44F459E78D02C18165E459E4C/",
        size = "large",
        type = "Emplacement Trooper",
        points = 60,
        speed = 1,
        upgrades = {
          Comms = 1,
          Generator = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540542046063/4018BD67779A3F2ACCFA92C35306880C2FC60188/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540542046257/D259CAB86BBC7A60FB09149229F33508C8DF4CE8/",
          },        
        },
        rank = "Support",
        faction = "Empire",
      },
      ["DEWBACK RIDER"] = {
        name = "Dewback Rider",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139672717/75700C648595B7642273964A59B5CDFFBD650014/",
        size = "large",
        type = "Creature Trooper",
        points = 70,
        speed = 1,
        upgrades = {
          Training = 1,
          Comms = 1,
          Armament = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359682702688959/0FCB94B52F0C2DF6E3F296AB6980CEC158E3E496/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359682702689114/727755B3BE824994C869F1C869D8B5A07A3CD284/",
          },        
        },
        rank = "Support",
        faction = "Empire",
      },
      ["RANGE TROOPERS"] = {
        name = "Range Troopers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139672651/467BD8F23216F7AE5274DC84837483AE40571B02/",
        size = "small",
        type = "Trooper",
        points = 60,
        speed = 1,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Comms = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682669687/1A75297DAE22B6DFE46AF5B69EDC87652B23957F/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682582649/F03C73249983DDC1178314FD61C7D53DA27840EE/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682669758/7E6C79BDA776AD0618FF66FCD961C59DD6B0F4F1/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682582649/F03C73249983DDC1178314FD61C7D53DA27840EE/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682669758/7E6C79BDA776AD0618FF66FCD961C59DD6B0F4F1/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682582649/F03C73249983DDC1178314FD61C7D53DA27840EE/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682669758/7E6C79BDA776AD0618FF66FCD961C59DD6B0F4F1/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682582649/F03C73249983DDC1178314FD61C7D53DA27840EE/",
          },        
        },
        rank = "Support",
        faction = "Empire",
      },
      ["AT-ST"] = {
        name = "AT-ST",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384861327/6E2988CCCF7820F765C1D5486D95F8EFB77ABED1/",
        size = "huge",
        type = "Ground Vehicle",
        points = 145,
        speed = 2,
        upgrades = {
          Pilot = 1,
          Hardpoint = 3,
          Comms = 1,        
        },
        silhouette = {
          height = 8.84,
          offset = 0,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/999141806429351360/24C098E7B3D1708CDCFB9AEA4B2C445EF2DBAEE0/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/1752434998239690716/C6578DAF9012605B1F44A907D1C28646E34A73CF/",
          },        
        },
        rank = "Heavy",
        faction = "Empire",
      },
      ["TX-225 GAVW OCCUPIER TANK"] = {
        name = "TX-225 GAVw Occupier Tank",
        displayName = "Occupier Tank",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384864284/91145F71FC94DCE7BE3239F7B57430D050C04CBF/",
        size = "long",
        type = "Ground Vehicle",
        points = 125,
        speed = 1,
        upgrades = {
          Pilot = 1,
          Hardpoint = 1,
          Comms = 1,        
        },
        silhouette = {
          height = 2,
          offset = 0,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/770610077943664603/48F725F2C3EAAF7514813A42EE084CE2E7382909/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/770610077942978328/35E12FB664BC3AE0A7AFCCAFF306AFC7481CE4D3/",
          },        
        },
        rank = "Heavy",
        faction = "Empire",
      },
      ["LAAT/LE PATROL TRANSPORT"] = {
        name = "LAAT/LE Patrol Transport",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384862671/52E7A6A14E5822A396F273D924D083F6F3A86286/",
        size = "laat",
        type = "Repulsor Vehicle",
        points = 100,
        speed = 2,
        height = 7,
        upgrades = {
          Pilot = 1,
          Ordnance = 1,
          Comms = 1,        
        },
        silhouette = {
          height = 6.36,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1747939379132611640/1EEBEB993635A56525283FAFA0D62D347FB3121C/",
          },        
        },
        rank = "Heavy",
        faction = "Empire",
      },
      ["IMPERIAL DARK TROOPERS"] = {
        name = "Imperial Dark Troopers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384862505/D3093456F093CB155707B1BA64512664F2A4B7DB/",
        size = "small",
        type = "Droid Trooper",
        points = 95,
        speed = 1,
        tokens = 2,
        upgrades = {
          ["Heavy Weapon"] = 2,
          Personnel = 1,
          Programming = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1785135125810942830/666860D7C34C83C500C62BDDE115F30C59A42C74/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2004698291313176203/E77892ADB668EA0CB548F6ED71BE44CA3FB730E7/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1785135125810942938/E77EC5970DA310A2E1D96F796E98D82813AE0891/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2004698291313176203/E77892ADB668EA0CB548F6ED71BE44CA3FB730E7/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1785135125810943021/4B5888D461F54C2C281B108233D1F1D8D8C2A679/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2004698291313176203/E77892ADB668EA0CB548F6ED71BE44CA3FB730E7/",
          },        
        },
        rank = "Heavy",
        faction = "Empire",
      },
      ["MAJOR MARQUAND TEMPEST SCOUT 2"] = {
        name = "Major Marquand",
        title = "Tempest Scout 2",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384862876/6C4E872F77BD526E8B352B041ADE53ED5504AC2B/",
        size = "huge",
        type = "Ground Vehicle",
        points = 180,
        speed = 2,
        upgrades = {
        
        },
        silhouette = {
          height = 8.84,
          offset = 0,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/999141806429351360/24C098E7B3D1708CDCFB9AEA4B2C445EF2DBAEE0/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/1752434998239690716/C6578DAF9012605B1F44A907D1C28646E34A73CF/",
          },        
        },
        commands = {
          {
            name = "Gunner, Infantry!",
            image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384886041/1D8783572AB6844253E1B746C543511E9B721587/",
            pip = 1,
          },
          {
            name = "Squadron, on me",
            image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384887260/11CDA1204949826F29A70E5544BF0ED0C5E2A153/",
            pip = 2,
          },
          {
            name = "Armored Cavalry",
            image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384868355/7ED8143E1A691DCF1E37E84E4E19F9231B891DB5/",
            pip = 3,
          },        
        },
        rank = "Heavy",
        faction = "Empire",
      },
    },
    ["REPUBLIC"] = {
      ["AHSOKA TANO PADAWAN COMMANDER"] = {
        name = "Ahsoka Tano",
        title = "Padawan Commander",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59217531459831840/7BAA676E59D56B62D2E11FB77DD5B0E5BC387437/",
        size = "small",
        type = "Trooper",
        points = 110,
        speed = 3,
        upgrades = {
          Force = 1,
          Command = 1,
          Training = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/16433335599854666/7D5FBD7E60477189142C905E42679993F4CA9CAD/",
          },        
        },
        commands = {
          {
            name = "You Are Beaten",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59217531459831475/BAB718B98F827E294BA50680227A363E3256DC7A/",
            pip = 1,
          },
          {
            name = "Revenge Is Not the Jedi Way",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59217531459831631/87162AF3AA810544D40A745E1F98085A92ACA105/",
            pip = 2,
          },
          {
            name = "I Go Where I'm Needed",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59217531459831728/03A628654EBBA66A64E040E128BB03A2650A8E90/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Republic",
      },
      ["OBI-WAN KENOBI CIVILIZED WARRIOR"] = {
        name = "Obi-Wan Kenobi",
        title = "Civilized Warrior",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134023515/2C9320594DD79CF3D7FC98C13487A00A2AE28598/",
        size = "small",
        type = "Trooper",
        points = 150,
        speed = 2,
        upgrades = {
          Force = 2,
          Command = 1,
          Training = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785236717873394134/94407058FBA842AD0FDCC0BBB8AB613EA9A739C2/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717873394267/272C1C9A8C15C36DC5C10DD62D5EFCEF9BFF4496/",
          },        
        },
        commands = {
          {
            name = "Hello There!",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134023412/5FD1AF7B0198FBD887EA7A072F53A8EFE47BA5AD/",
            pip = 1,
          },
          {
            name = "Knowledge And Defense",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134023462/0B7E151462188D5E5706415F406F0B51892CE553/",
            pip = 2,
          },
          {
            name = "General Kenobi",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134023367/DBEE15E658282BE84E693970FF184CBF515C7DEA/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Republic",
      },
      ["CLONE CAPTAIN REX HONORABLE SOLDIER"] = {
        name = "Clone Captain Rex",
        title = "Honorable Soldier",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134020880/7C51F849FFBA45101F85ED56C60A39BC9DCFEA9E/",
        size = "small",
        type = "Clone Trooper",
        points = 95,
        speed = 2,
        upgrades = {
          Command = 1,
          Training = 1,
          Gear = 2,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/776232727456806720/869654FC3B0590BFFF2E1845C3CFA9169838EBF9/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/776232727456806858/52327997163A5113DF9E11B85F9DA8B6B970012C/",
          },        
        },
        commands = {
          {
            name = "Call Me Captain",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134020825/C9D873D723AFC9AFB05A20B57D3335CB5DACC0C1/",
            pip = 1,
          },
          {
            name = "Take That, Clankers!",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134020928/838D3C418B11344945B861E1E17B2259AB7DC9A3/",
            pip = 2,
          },
          {
            name = "We're Not Programmed",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134020977/7375B857CECD3EC04F3DDA22799E789FAF4ABC13/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Republic",
      },
      ["ANAKIN SKYWALKER THE CHOSEN ONE"] = {
        name = "Anakin Skywalker",
        title = "The Chosen One",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384861047/D0BF783091611724C1324B3847037C1C1237F461/",
        size = "small",
        type = "Trooper",
        points = 155,
        speed = 2,
        upgrades = {
          Force = 2,
          Training = 2,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/1647717402898546429/B304222EB644FD345A672FA36A7C4F5DF5152C49/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/1618472373243511338/BA0B615A051FBA00DEFBB555DB87B516E19AF8EA/",
          },        
        },
        commands = {
          {
            name = "This Is Where The Fun Begins",
            image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384887696/8B9FE3223AA89990AC33B6326946F049921EC4D7/",
            pip = 1,
          },
          {
            name = "You Underestimate My Power",
            image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384888230/CD4880CE0C47B29696AC5AE71F165D9FF6A38266/",
            pip = 2,
          },
          {
            name = "General Skywalker",
            image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384885900/A971093410E02605CF759557DEC0B5CBD3127D79/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Republic",
      },
      ["CLONE COMMANDER TRAINED FOR LEADERSHIP"] = {
        name = "Clone Commander",
        title = "Trained For Leadership",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134030932/097AEAB205D99962C4D1BF4136A36D73029A43B2/",
        size = "small",
        type = "Clone Trooper",
        points = 60,
        speed = 2,
        upgrades = {
          Command = 1,
          Training = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809186354/387C36C2BB545E6CC882A05C0D81F5BE164166B7/",
          },        
        },
        rank = "Commander",
        faction = "Republic",
      },
      ["YODA GRAND MASTER OF THE JEDI ORDER"] = {
        name = "Yoda",
        title = "Grand Master Of The Jedi Order",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134036684/529CFF85876C6F4710D6E97CBBB99E15323584D4/",
        size = "small",
        type = "Trooper",
        points = 180,
        speed = 1,
        upgrades = {
          Force = 3,
          Command = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1617345381346377755/75D0ACFDFFCA5A08D7CAB59DA941B226D1563D46/",
          },        
        },
        commands = {
          {
            name = "Size Matters Not",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134037394/0B7834ECF0331C805C27F603B00D6C743B854388/",
            pip = 1,
          },
          {
            name = "There Is No Try",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134037407/66DFAF805CB1864A8A71CD35B3DCA41F9B213ECA/",
            pip = 2,
          },
          {
            name = "Luminous Beings Are We",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134037376/DDC7E052702169D9E14A51F886535CF5BD2007C1/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Republic",
      },
      ["WOOKIEE CHIEFTAIN CLAN LEADER"] = {
        name = "Wookiee Chieftain",
        title = "Clan Leader",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134052113/10120AB84E10E0EBDFEF30603F2B1EE9FA8382A7/",
        size = "small",
        type = "Wookiee Trooper",
        points = 100,
        speed = 2,
        upgrades = {
          Command = 1,
          Training = 2,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1619598523372467360/2810096383D51B0939DC3FFCBC83155C6D08CB53/",
          },        
        },
        rank = "Commander",
        faction = "Republic",
      },
      ["CHEWBACCA HERO OF KASHYYYK"] = {
        name = "Chewbacca",
        title = "Hero Of Kashyyyk",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134028001/43E55FD3A97B6A7800A94B65EA47507F7033CA65/",
        size = "small",
        type = "Wookiee Trooper",
        points = 90,
        speed = 2,
        upgrades = {
          Training = 2,
          Gear = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540540669973/90DD9EA44756CCF9B2473302DC644F3AEEED07B4/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670117/5AA04499FC8CC467864F9F335601E6335C03326D/",
          },        
        },
        commands = {
          {
            name = "Size Matters Sometimes",
            image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384887168/E234AAEC15D5B30E804CCD761723D30DAD4AC337/",
            pip = 2,
          },        
        },
        rank = "Commander",
        faction = "Republic",
      },
      ["PYKE SYNDICATE CAPO"] = {
        name = "Pyke Syndicate Capo",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718883/40D17DA044960A4A34979FBDEAE9296EB1E50346/",
        size = "small",
        type = "Trooper",
        points = 48,
        speed = 2,
        upgrades = {
          Command = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420351237/706DEA645FEE2EC9787F05F4FF2926632E2C4894/",
          },        
        },
        rank = "Commander",
        faction = "Republic",
      },
      ["CLONE COMMANDER CODY LEADER OF THE 212TH"] = {
        name = "Clone Commander Cody",
        title = "Leader of the 212th",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134025861/02F5F0A5209FE1F7F3315632CBDA187666A0258A/",
        size = "small",
        type = "Clone Trooper",
        points = 105,
        speed = 2,
        upgrades = {
          Command = 1,
          Training = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446813135529/6A6C874DBCA77E800A77C20FD36C2F223661CD10/",
          },        
        },
        commands = {
          {
            name = "Bring it Down!",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134025758/112F3DFC81DC78543EDFE2947CF3F3F007471510/",
            pip = 1,
          },
          {
            name = "Have I Ever Let you Down?",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134026057/C02C788C4E22D659C4C1FC71FA93C5CED64C4B87/",
            pip = 2,
          },
          {
            name = "Combined Arms",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134025951/456F450F410FB505809E7069B4E5ED4E9CAD8FD9/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Republic",
      },
      ["R2-D2 INDEPENDENT ASTROMECH"] = {
        name = "R2-D2",
        title = "Independent Astromech",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134141698/FAE960D0D49F0061E6FA7755E67185322CF307F0/",
        size = "small",
        type = "Droid Trooper",
        points = 55,
        speed = 1,
        upgrades = {
          Counterpart = 1,
          Comms = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/776232727456806966/EFBA4A71BFE748A2868C14B82DA3A7B0D559874A/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/777357228032306302/F5CA6FC54A8625E261F123D73792DE36D74E1686/",
          },        
        },
        commands = {
          {
            name = "Blast Off!",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134141577/8D591F13DCEA99113D64D58B6E2D68ED52A08EE7/",
            pip = 1,
          },
          {
            name = "Impromptu Immolation",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134141630/9373A105353B80AC756D358EBF8F21D63295D45C/",
            pip = 2,
          },
          {
            name = "Smoke Screen",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134141746/0599A5682160DFB2D79CCA9577530E15478AAEBD/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Republic",
      },
      ["PADME AMIDALA SPIRITED SENATOR"] = {
        name = "Padme Amidala",
        title = "Spirited Senator",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134139534/3D7B05D39495FB34AE0D4985A9B7E7771F738CAF/",
        size = "small",
        type = "Trooper",
        points = 60,
        speed = 2,
        upgrades = {
          Command = 1,
          Training = 1,
          Gear = 1,
          Armament = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/1003681674396399543/F485B2E6C10CBC01661E393966F014E5A5DE8BF9/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/1618472373243511387/F761552349A2CA2AE8210CEE254BCE08D439B687/",
          },        
        },
        commands = {
          {
            name = "Our Fate Is In Your Hands",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134139479/047DB4C4D70DEF7A41C639D90C4931DD04C9BD5C/",
            pip = 1,
          },
          {
            name = "Aggressive Negotiations",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134139326/7A72415F3906D4A9182818FE7BB25C3F3151E3FB/",
            pip = 2,
          },
          {
            name = "Diplomatic Cover",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134139409/0EBF63FE95FD6CCA1E652F1FCF25C048BCB39148/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Republic",
      },
      ["THE BAD BATCH CLONE FORCE 99"] = {
        name = "The Bad Batch",
        title = "Clone Force 99",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134145076/BAE80029E18C81D609CE49C8F8DAE0BE2D1FCF4D/",
        size = "small",
        type = "Trooper",
        points = 160,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 5,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2475370743175243916/EFBD0137414E802232F64B02C78A9D9275C9C1CB/",
          },        
        },
        commands = {
          {
            name = "We Do What We Do",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134148285/8246937579A18E5BE5A53451E49E65028CFC1EA1/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Republic",
      },
      ["CLONE TROOPER INFANTRY"] = {
        name = "Clone Trooper Infantry",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384861815/5F00E6C2F6F1B235D9D3B4E8A11E3D9B74EFEED0/",
        size = "small",
        type = "Clone Trooper",
        points = 56,
        speed = 2,
        upgrades = {
          ["Squad Leader"] = 1,
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Training = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393043/33A6FEA07374DAC8EBB6CDD463B6C761DC765D03/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393180/6359B491483DCD9B2641BA134DC4B92DE10E9D92/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393589/6AF627688F36D2049C1307BCB67A755FB27D51C5/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393180/6359B491483DCD9B2641BA134DC4B92DE10E9D92/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393727/8C4030EF9FEEB32E048567DC2EC38A1985E7C8C0/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393180/6359B491483DCD9B2641BA134DC4B92DE10E9D92/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785236717873457225/6382F0EA6E2DB0BC65921C3F4E5C97A84B422187/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393180/6359B491483DCD9B2641BA134DC4B92DE10E9D92/",
          },        
        },
        rank = "Corps",
        faction = "Republic",
      },
      ["PYKE SYNDICATE FOOT SOLDIERS"] = {
        name = "Pyke Syndicate Foot Soldiers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718821/EBC76B7A94A5F3C03B036C17E3C26E0319F1C6EB/",
        size = "small",
        type = "Trooper",
        points = 44,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845548/FD104F41509A53EA1C888862A3C5F0B98F609F1F/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845646/BE0DEED782F96BD44C389DEDEA41EBEA0C7A6D04/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845697/15B6DCCA8D8D76E1CB78219C58790E40DDD7CE8A/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845389/0D7DFE0C5BF5CDD527A619B75A25A2177D417BD0/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },        
        },
        rank = "Corps",
        faction = "Republic",
      },
      ["ARC TROOPERS"] = {
        name = "Arc Troopers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384861176/4AB3CC68BD898A328A2FB935E6F120934123D54E/",
        size = "small",
        type = "Clone Trooper",
        points = 58,
        speed = 2,
        upgrades = {
          ["Squad Leader"] = 1,
          ["Heavy Weapon"] = 1,
          Training = 1,
          Comms = 1,
          Gear = 2,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1009315641457802621/01F605D855048F823A0ECA6C46D2A62B56C04124/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/773995200348530664/5E248091F8CC37B1023257338D4947E4ADFE48AB/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1009315641457799750/AE83DC038BA8AAF48678D07E1F9734D4A9944C1D/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/773995200348530664/5E248091F8CC37B1023257338D4947E4ADFE48AB/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1009315641457800134/88E2FEC812AD5E7B7570836120992252AC758BF8/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/773995200348530664/5E248091F8CC37B1023257338D4947E4ADFE48AB/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1009315641457800538/06BBAAAAC7FB68DAA9351F12008475068A96BFFB/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/773995200348530664/5E248091F8CC37B1023257338D4947E4ADFE48AB/",
          },        
        },
        rank = "Special Forces",
        faction = "Republic",
      },
      ["ARC TROOPERS STRIKE TEAM"] = {
        name = "Arc Troopers",
        title = "Strike Team",
        displayName = "Arc Troopers (Strike Team)",
        heavyWeaponTeam = true,
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384861099/0BF691267928341734741CDF04AAE59A41E5E20B/",
        size = "small",
        type = "Clone Trooper",
        points = 24,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 1,
          Comms = 1,
          Gear = 2,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1009315641457802621/01F605D855048F823A0ECA6C46D2A62B56C04124/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/773995200348530664/5E248091F8CC37B1023257338D4947E4ADFE48AB/",
          },        
        },
        rank = "Special Forces",
        faction = "Republic",
      },
      ["WOOKIEE WARRIORS NOBLE FIGHTERS"] = {
        name = "Wookiee Warriors",
        title = "Noble Fighters",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135341447/B0773809842EFD82EFA442C9E918729C2DE3AA1F/",
        size = "small",
        type = "Wookiee Trooper",
        points = 69,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 2,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541173937/5179F4315AD6B0839454E1934E794A7F006C7813/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541174467/18352D89A219B89F6C869D89B9EDE22822F7F950/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541174158/677BF72C323CFF2314C174393AFA361C398C5519/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541174034/90C4A124BB82CCE0B5E38E13860ED49BB9A4973B/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541174304/9053CDD2798CEA905F8486498D0104B6ACA2F078/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541174467/18352D89A219B89F6C869D89B9EDE22822F7F950/",
          },        
        },
        rank = "Special Forces",
        faction = "Republic",
      },
      ["WOOKIEE WARRIORS KASHYYYK DEFENDERS"] = {
        name = "Wookiee Warriors",
        title = "Kashyyyk Defenders",
        displayName = "Wookiee Warriors (Defenders)",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135341419/3EC4467936F4470CD7F7E5BA2E4BE0CD069869AF/",
        size = "small",
        type = "Wookiee Trooper",
        points = 72,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1619598366708043779/0D96CE1619F4B27F583257A366431E3BAD428F19/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1619598366708043883/1EA1B3C21A50C20D4D168AB91ECFE1C01A4F7DF5/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1619598366708043883/1EA1B3C21A50C20D4D168AB91ECFE1C01A4F7DF5/",
          },        
        },
        rank = "Special Forces",
        faction = "Republic",
      },
      ["ARF TROOPERS"] = {
        name = "ARF Troopers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/12272409584211361084/EF41D3B9F89F86EC4E803863C17D1549052C8B55/",
        size = "small",
        type = "Clone Trooper",
        points = 58,
        speed = 2,
        upgrades = {
          ["Squad Leader"] = 1,
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Training = 1,
          Comms = 1,
          Gear = 2,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/16428815149933614/80D6829DB63FAE3328D00AC36F00E5FD71251E69/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/16428815149933714/D3FE0C2DEFBE1E78A71A55516DF87199D66DE2AC/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/16428815149643329/8D273B40809BF89188238DE6FC5C207756AA22EF/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/16428815149643405/9A3D0A513A31513523E59855980DFCE0A8F0F6E0/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/16428815149932871/EE8DF333D45ED841E9C31625FB4A9385C16B2F49/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/16428815149933386/736E0CCF2ADE31D6A9F6BE172B20AEB5420B815E/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/16428815149649053/B24484CFED06020454EE95B663DB3ECE17871D26/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/16428815149646949/50B6AA8C2CC5283537DBA2291F9801E7CD5FE77C/",
          },        
        },
        rank = "Special Forces",
        faction = "Republic",
      },
      ["BARC SPEEDER"] = {
        name = "BARC Speeder",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135357592/ED3AA636CBB456AA395C1694D27B84A296DD406B/",
        size = "large",
        type = "Repulsor Vehicle",
        points = 55,
        speed = 3,
        upgrades = {
          Crew = 1,
          Comms = 1,        
        },
        silhouette = {
          height = 1.584,
          offset = 0,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785236717873394399/018F8CC63E0D90F58AADA6328DF1709D4D1DF796/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717873394534/3E2F0490BA5D1024741F5806A4921D0E0E79EA9F/",
          },        
        },
        rank = "Support",
        faction = "Republic",
      },
      ["AT-RT"] = {
        name = "AT-RT",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384861217/5A25D4C32DFA78CC0FA0D45A19350BB8F971A467/",
        size = "large",
        type = "Ground Vehicle",
        points = 60,
        speed = 2,
        upgrades = {
          Hardpoint = 1,
          Comms = 1,        
        },
        silhouette = {
          height = 2.576,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2202884666993392985/D48A26F5F9D3498814911131BA08B0BAF92F8B65/",
          },        
        },
        rank = "Support",
        faction = "Republic",
      },
      ["RADDAUGH GNASP FLUTTERCRAFT"] = {
        name = "Raddaugh Gnasp Fluttercraft",
        displayName = "Fluttercraft",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135343126/F85A20B8CBAFDED99A98E49A5606034C27863FE8/",
        size = "huge",
        type = "Repulsor Vehicle",
        points = 55,
        speed = 2,
        upgrades = {
          Crew = 1,
          Comms = 1,        
        },
        silhouette = {
          height = 6.5,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1619598523372505515/1191E8089B37C0CC4BBE8283EF6B7F9C5A74A13C/",
          },        
        },
        rank = "Support",
        faction = "Republic",
      },
      ["SWOOP BIKE RIDERS"] = {
        name = "Swoop Bike Riders",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139721420/2BD490189FBB2AF2C7D6AA12EFA6EAA643EA2002/",
        size = "medium",
        type = "Repulsor Vehicle",
        points = 65,
        speed = 3,
        upgrades = {
          Comms = 1,        
        },
        silhouette = {
          height = 1.891,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1924743543116067434/0A068914BDD35AE6F63D7E29EBC7E0B5F712DA1F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1924743543116067490/87719312BE33C493B97B0915DB8C89FDC57D3F38/",
          },        
        },
        rank = "Support",
        faction = "Republic",
      },
      ["RADDAUGH GNASP FLUTTERCRAFT ATTACK CRAFT"] = {
        name = "Raddaugh Gnasp Fluttercraft",
        title = "Attack Craft",
        displayName = "Attack Craft",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384863253/19EFFAD3DCCEF1FA1CCBE08AE62F90E4EF63F414/",
        size = "huge",
        type = "Repulsor Vehicle",
        points = 57,
        speed = 2,
        upgrades = {
          Crew = 1,
          Comms = 1,        
        },
        silhouette = {
          height = 6.5,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1619598523372505515/1191E8089B37C0CC4BBE8283EF6B7F9C5A74A13C/",
          },        
        },
        rank = "Support",
        faction = "Republic",
      },
      ["CLONE COMMANDOS"] = {
        name = "Clone Commandos",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135343637/2D368BCB50598F733E54128E5B1BF53CB49F853F/",
        size = "small",
        type = "Clone Trooper",
        points = 75,
        speed = 2,
        upgrades = {
          Training = 1,
          Gear = 1,
          Comms = 1,
          Armament = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682669631/743A3F4EE203D22A0C7A8324994F8DD6D15337C0/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682582714/3AFE8876506FE4B261417033A0E804BA9146FECE/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682669442/778C5CDC3ED0EF8036784484685D9C1E283AE229/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682582714/3AFE8876506FE4B261417033A0E804BA9146FECE/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682669514/964CC0732F05CF777C4F226E4A66B82C9B8F17F1/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682582714/3AFE8876506FE4B261417033A0E804BA9146FECE/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682669589/FE6E365D8DFE4186F7AE93CBEF854B84881DFA18/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682582714/3AFE8876506FE4B261417033A0E804BA9146FECE/",
          },        
        },
        additionalObjects = {
          "Complete the Mission Token",        
        },
        rank = "Support",
        faction = "Republic",
      },
      ["CLONE COMMANDOS DELTA SQUAD"] = {
        name = "Clone Commandos Delta Squad",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135343678/F395BC8F8B88F888355FCFAFA870875613499CD1/",
        size = "small",
        type = "Clone Trooper",
        points = 100,
        speed = 2,
        upgrades = {
          Training = 2,
          Gear = 1,
          Comms = 1,
          Armament = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2474241114696859651/A77E973493F46183AC97F68C1A191EC0E74F6A65/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2474241114696882381/265198067C41DF8333A609EDCE831A547A68F28F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2474241114696859554/12CFFC76B71288B5426C2E57CC8A91F515B075F2/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2474241114696882580/BE0E56B70A5D6B576BA4AAB83FDB1DB2BD835887/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2474241114696859485/0340EC3130B99413F05F2CB2544E9FDE79A3871D/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2474241114696882497/A846281F67580B208A2BBBDADE7C601230486E20/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2474241114696859319/2846289D99E3CA2DC68F2BB8FC69ECF1ABE2072E/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2474241114696882664/1B6168DA14AFA3A40CC823399CC4072FD1B7E958/",
          },        
        },
        additionalObjects = {
          "Complete the Mission Token",        
        },
        rank = "Support",
        faction = "Republic",
      },
      ["SABER-CLASS TANK"] = {
        name = "Saber-Class Tank",
        displayName = "Saber Tank",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384863579/ABC4E8CCA9A2C837A86FF23215B5AE4885E2A9DF/",
        size = "epic",
        type = "Repulsor Vehicle",
        points = 155,
        speed = 2,
        upgrades = {
          Pilot = 1,
          Hardpoint = 1,
          Ordnance = 2,
          Comms = 1,        
        },
        silhouette = {
          height = 2.596,
          offset = 0,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785236717873392482/BC01571E47E96306C31FABABE3EA971814E00C96/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717873392638/CE1C3404249840D5F7F9499D1427E83530ACEB19/",
          },        
        },
        rank = "Heavy",
        faction = "Republic",
      },
      ["LAAT/LE PATROL TRANSPORT"] = {
        name = "LAAT/LE Patrol Transport",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384862727/5EB0BB290C80AE07B16848984044B13E3C405E05/",
        size = "laat",
        type = "Repulsor Vehicle",
        points = 100,
        speed = 2,
        height = 7,
        upgrades = {
          Pilot = 1,
          Ordnance = 1,
          Comms = 1,        
        },
        silhouette = {
          height = 6.46,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1747939379132611640/1EEBEB993635A56525283FAFA0D62D347FB3121C/",
          },        
        },
        rank = "Heavy",
        faction = "Republic",
      },
      ["INFANTRY SUPPORT PLATFORM"] = {
        name = "Infantry Support Platform",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135344629/540E23C816C00B4B7E086B626329F13633403C9E/",
        size = "huge",
        type = "Repulsor Vehicle",
        points = 65,
        speed = 3,
        upgrades = {
          Pilot = 1,
          Hardpoint = 1,
          Comms = 1,        
        },
        silhouette = {
          height = 1.55,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1619598523372574861/CCF68AF1C35F52A714AB0344FCB170F5BAA1672A/",
          },        
        },
        rank = "Heavy",
        faction = "Republic",
      },
    },
    ["SEPARATIST"] = {
      ["GENERAL GRIEVOUS SINISTER CYBORG"] = {
        name = "General Grievous",
        title = "Sinister Cyborg",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131432388/26B30B4276062FA8693A0D3E566671DAD9DF5DD2/",
        size = "small",
        type = "Trooper",
        points = 130,
        speed = 2,
        upgrades = {
          Command = 2,
          Training = 1,
          Gear = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780869167436/AAA2C61A17BB43F2673AF16D30BD0478B9AAAD2A/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780869167571/EF86CBDA5F361282AD077D61FA81ABF0FEE061A0/",
          },        
        },
        commands = {
          {
            name = "Trained In Your Jedi Arts",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131526384/C4406A3487D2E58D1AF4962B9A306EC5882596CC/",
            pip = 1,
          },
          {
            name = "Supreme Commander",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131525863/124C8C8CAA960D6680FD429BD85DA760AFD9040A/",
            pip = 2,
          },
          {
            name = "Crush Them!",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131524786/7D9A98904E7D5F80F9590AAA5EDF107F2B95623A/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Separatist",
      },
      ["COUNT DOOKU DARTH TYRANUS"] = {
        name = "Count Dooku",
        title = "Darth Tyranus",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131432037/24F46472FEFFC678779BC1CA2FF6B4460E2E039D/",
        size = "small",
        type = "Trooper",
        points = 165,
        speed = 2,
        upgrades = {
          Force = 3,
          Command = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/775105953849586543/25BD09F275C593DB6C794359A9C50F3188F4D804/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/775105953849586640/B0512CC73C982F94EB5FEAE1661CF4438DAD8879/",
          },        
        },
        commands = {
          {
            name = "Fear, Surprise, Intimidation",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131525203/8AE25439B2A4589B48502B5BECE8652BC37CF941/",
            pip = 1,
          },
          {
            name = "Double The Fall",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131525177/CD39DEA23EB51B132F1263FEF158FBED10C5C32A/",
            pip = 2,
          },
          {
            name = "You Disappoint Me",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131527845/7429252D8F4A59BFD43846F93CBA904ADEC133E3/",
            pip = 3,
          },
          {
            name = "The Sith Will Rule",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131526321/AD7E17FC8BC3387075D2EDAEB5506F4AAEF2084F/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Separatist",
      },
      ["T-SERIES TACTICAL DROID PROGRAMMED FOR STRATEGY"] = {
        name = "T-Series Tactical Droid",
        title = "Programmed For Strategy",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131433848/B4160FE013FB7B00BA8A6DE876F507A667602F6A/",
        size = "small",
        type = "Droid Trooper",
        points = 60,
        speed = 2,
        upgrades = {
          Command = 1,
          Comms = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809185719/FF120BC2FA5DC8258021E2849C2B81591CCA36B9/",
          },        
        },
        rank = "Commander",
        faction = "Separatist",
      },
      ["SUPER TACTICAL DROID"] = {
        name = "Super Tactical Droid",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384864140/4D45D9C35BD4227637CADD23C1E750583320D68F/",
        size = "small",
        type = "Droid Trooper",
        points = 75,
        speed = 2,
        upgrades = {
          Command = 2,
          Comms = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1619598366706441730/D50A1B8823BE590384D2A2D904A321B3337276AD/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1619598366706441991/04B29BB48A98AF8D79FC1414548496BAD49CCB28/",
          },        
        },
        commands = {
          {
            name = "They Too Will Suffer",
            image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865564036005/BCB6B4D75C375323E4CA020BB1AA01497BEE11ED/",
            pip = 1,
          },
          {
            name = "Preservation Protocols",
            image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865564034846/6DFE5FBF65026639A194D1A915193AD147736713/",
            pip = 2,
          },
          {
            name = "Do Not Underestimate Our Means",
            image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384885557/BB41754355D4B8C5C9E444C1F3A5D41096109F5E/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Separatist",
      },
      ["KALANI SUPER TACTICAL DROID"] = {
        name = "Kalani",
        title = "Super Tactical Droid",
        displayName = "Kalani",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131432463/7A808E698411F5F0692FAF805529083CDB7EFAF8/",
        size = "small",
        type = "Droid Trooper",
        points = 85,
        speed = 2,
        upgrades = {
          Command = 3,
          Comms = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1619598366706441824/97EB6FA096B824294EE48FE762380CCBE866F3E2/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1619598366706441991/04B29BB48A98AF8D79FC1414548496BAD49CCB28/",
          },        
        },
        commands = {
          {
            name = "They Too Will Suffer",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131526359/B72758B5C45391BA8FDD1C1E6023685EF3B64EBD/",
            pip = 1,
          },
          {
            name = "Preservation Protocols",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131525817/8473E63B725077F3D5EED0C66B103F218DA907BF/",
            pip = 2,
          },
          {
            name = "Do Not Underestimate Our Means",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131524814/1C9294E7627AEFC235A525FED15C4EF7B2341C9E/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Separatist",
      },
      ["KRAKEN SUPER TACTICAL DROID"] = {
        name = "Kraken",
        title = "Super Tactical Droid",
        displayName = "Kraken",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131433103/C2CD6A90911C879E745B1B79DFE9B810F02CA25D/",
        size = "small",
        type = "Droid Trooper",
        points = 80,
        speed = 2,
        upgrades = {
          Command = 2,
          Training = 1,
          Comms = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1619598366706113202/449F19DA94D42DAD0F0B4D0B77A8E9AD45C320E5/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1619598366706441991/04B29BB48A98AF8D79FC1414548496BAD49CCB28/",
          },        
        },
        commands = {
          {
            name = "They Too Will Suffer",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131526359/B72758B5C45391BA8FDD1C1E6023685EF3B64EBD/",
            pip = 1,
          },
          {
            name = "Preservation Protocols",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131525817/8473E63B725077F3D5EED0C66B103F218DA907BF/",
            pip = 2,
          },
          {
            name = "Do Not Underestimate Our Means",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131524814/1C9294E7627AEFC235A525FED15C4EF7B2341C9E/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Separatist",
      },
      ["PYKE SYNDICATE CAPO"] = {
        name = "Pyke Syndicate Capo",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718883/40D17DA044960A4A34979FBDEAE9296EB1E50346/",
        size = "small",
        type = "Trooper",
        points = 48,
        speed = 2,
        upgrades = {
          Command = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420351237/706DEA645FEE2EC9787F05F4FF2926632E2C4894/",
          },        
        },
        rank = "Commander",
        faction = "Separatist",
      },
      ["BLACK SUN VIGO"] = {
        name = "Black Sun Vigo",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718200/725F66281B4596ACF010C38A1E37D169B597D56C/",
        size = "small",
        type = "Trooper",
        points = 50,
        speed = 2,
        upgrades = {
          Command = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143763/E93BA6716A05CA95AE2EA3B7C0DFD8AF145D5C22/",
          },        
        },
        rank = "Commander",
        faction = "Separatist",
      },
      ["POGGLE THE LESSER PUBLIC LEADER OF THE GEONOSIANS"] = {
        name = "Poggle the Lesser",
        title = "Public Leader of the Geonosians",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131433181/C18229FCF2010EC9491505DEA6AECE1F4F21C147/",
        size = "small",
        type = "Trooper",
        points = 80,
        speed = 1,
        upgrades = {
          Command = 2,
          Comms = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177195973/1D70D4C8D0C6A06E14A7A875228E3CD49D5E0807/",
          },        
        },
        commands = {
          {
            name = "Let the Executions Begin!",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131525219/2DC3EA9357F54CB08F97B0B3449B2923DB7FB9A5/",
            pip = 1,
          },
          {
            name = "We Serve the Queen",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131527776/24A2E956D84B32FBED8B65F05B05BB32560F0E34/",
            pip = 2,
          },
          {
            name = "We Make Weapons",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131527739/6639117C739334B7AD7980050721AA7C8028B56B/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "Separatist",
      },
      ["CAD BANE NEEDS NO INTRODUCTION"] = {
        name = "Cad Bane",
        title = "Needs No Introduction",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137007196/49655B5A32FFAB3CE31BFCCFEA9811CD4A51B748/",
        size = "small",
        type = "Trooper",
        points = 105,
        speed = 2,
        upgrades = {
          Training = 2,
          Comms = 1,
          Gear = 1,
          Armament = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/1003681674396400482/F8900CFC9EF2309C9F54AE33AE5444B2B09DB1CD/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/1003681674396400696/907F4310FEA7A7CD89EE64A1AF3A8CC77897CCAC/",
          },        
        },
        commands = {
          {
            name = "I'm Your Worst Nightmare",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137014543/33FE8591FAFD29F8BEAF13D64851772A7FD794FE/",
            pip = 1,
          },
          {
            name = "I'm In Control",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137014579/D2FC7AF724D1C7527CCDDABF18517E9CB99DF061/",
            pip = 2,
          },
          {
            name = "I Make The Rules Now",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137014560/4B6E8AF4CB10FFE7EC529D204390FC45291FC962/",
            pip = 3,
          },        
        },
        additionalObjects = {
          "Bane Token: Blank",
          "Bane Token: Bomb",
          "Bane Token: Bane",
          "Victory Token",        
        },
        rank = "Operative",
        faction = "Separatist",
      },
      ["BOSSK TRANDOSHAN TERROR"] = {
        name = "Bossk",
        title = "Trandoshan Terror",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137006564/2C7F90FF127392A78F71B82EF4E69C35973824AD/",
        size = "small",
        type = "Trooper",
        points = 105,
        speed = 2,
        upgrades = {
          Training = 2,
          Gear = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/948474323838791181/6B9D77B77DF8FD7AFA19342AD687F0E15A2E21B7/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/948474323838791276/ABFCDD8C71D484E6B6050080BB80B79D0DE93178/",
          },        
        },
        commands = {
          {
            name = "Merciless Munitions",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137013809/1D7FCC2F2A12F6B09B07345330F840800A846F7C/",
            pip = 1,
          },
          {
            name = "Reptilian Rampage",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137013972/29F197704D74AF20E8954F2BE8AC5C9203F9A2E6/",
            pip = 2,
          },
          {
            name = "Lying In Wait",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137013903/60F4AC014F68998F8A3587BA0A5389301A0BAA7C/",
            pip = 3,
          },        
        },
        additionalObjects = {
          "Proton Charge Token",
          "Victory Token",        
        },
        rank = "Operative",
        faction = "Separatist",
      },
      ["MAUL IMPATIENT APPRENTICE"] = {
        name = "Maul",
        title = "Impatient Apprentice",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131433136/F385AC355EF21CEED5446F6BB6DEB590B4341000/",
        size = "small",
        type = "Trooper",
        points = 130,
        speed = 2,
        upgrades = {
          Force = 2,
          Training = 2,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809185590/81774E94925CD5B15B7CE0DC52DEC465D9774024/",
          },        
        },
        commands = {
          {
            name = "Duel Of The Fates",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131525195/991D793228F9D99D199201EEF560C5A4F294C4C1/",
            pip = 1,
          },
          {
            name = "The Phantom Menace",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131526286/338C5FAB4F7AB7F57BA3C1D5791B2BB1F6B2DC09/",
            pip = 2,
          },
          {
            name = "At Last",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131524747/50D631657EE81A881136A50FBDA60E8B22DCD9ED/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Separatist",
      },
      ["ASAJJ VENTRESS SEPARATIST ASSASSIN"] = {
        name = "Asajj Ventress",
        title = "Separatist Assassin",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131430684/75EA0FFCF13BC00426CBFA0F3F8E390B0FCDF508/",
        size = "small",
        type = "Trooper",
        points = 130,
        speed = 2,
        upgrades = {
          Force = 2,
          Training = 2,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2022718494181455957/4BB3E42AA412A7ED2ED6F26BFDFA25414F127B71/",
          },        
        },
        commands = {
          {
            name = "The Jedi Shall Fall",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131526250/371EA639E96CFA36BE3A339BE26403B2923D5C1E/",
            pip = 1,
          },
          {
            name = "I am Fear",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131525215/8F52AEE8AA429791E8333BC3F3F8B89E6157246B/",
            pip = 2,
          },
          {
            name = "Yes, My Master",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131527806/5B8009C57EF4BF1EBAEF31CF6D5AC745D12B5730/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "Separatist",
      },
      ["SUN FAC RUTHLESS LIEUTENANT"] = {
        name = "Sun Fac",
        title = "Ruthless Lieutenant",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131433813/69B81D6A1264FF5AAA8B683580A55D26BF104EAA/",
        size = "small",
        type = "Trooper",
        points = 80,
        speed = 2,
        upgrades = {
          Training = 1,
          Comms = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177195724/233E75C81DB511291B2B95015510DF1B48B2A8DB/",
          },        
        },
        commands = {
          {
            name = "Brutal Enforcer",
            image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131524776/66DAC77F67654F866C0B521F0AFB46A4CD6FFC06/",
            pip = 1,
          },        
        },
        rank = "Operative",
        faction = "Separatist",
      },
      ["B1 BATTLE DROIDS"] = {
        name = "B1 Battle Droids",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131430739/5F4B6BDDB4CD6561E87D8203CEEA15B77A2B7149/",
        size = "small",
        type = "Droid Trooper",
        points = 38,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Comms = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166347/AA861F86A0B74CF335533E425A6CBACB99395A09/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166529/263C2AB95B1743539EC2CBDE40B0A14B1F5E5693/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780869167061/48F42C02EDD970E6DE8E59B8601EF3E7F11C1742/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166919/FE5AD3A71430C729735E3FF7023D9E546E12FEF1/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780869167061/48F42C02EDD970E6DE8E59B8601EF3E7F11C1742/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166919/FE5AD3A71430C729735E3FF7023D9E546E12FEF1/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780869167318/DBC7863706A08B96020D3BFBE7A0C2C5689B7B08/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166919/FE5AD3A71430C729735E3FF7023D9E546E12FEF1/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166660/36AF6887F11FC70FF6AB75D0434EA79952C9E882/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166919/FE5AD3A71430C729735E3FF7023D9E546E12FEF1/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780869167194/9ADFFD9AD608CBE3E9F6F61AB416E699A4156109/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166919/FE5AD3A71430C729735E3FF7023D9E546E12FEF1/",
          },        
        },
        rank = "Corps",
        faction = "Separatist",
      },
      ["B2 SUPER BATTLE DROIDS"] = {
        name = "B2 Super Battle Droids",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131430767/3830309294245496BAC8E0C74A0F2C7DD1253460/",
        size = "small",
        type = "Droid Trooper",
        points = 64,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Comms = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/775105953849586118/94F967F21EA7E390A200C4BDA5581D07DBB37AC2/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/775105953849585789/91A639AB9F57BE393683DA53212E395886307C52/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/775105953849586430/E5941CF7A3631E6D4A28832AE489A4340C96B0B9/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/775105953849585789/91A639AB9F57BE393683DA53212E395886307C52/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/775105953849586226/9326AD8D3EC80CC53F4BF2D156014978DCD715D9/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/775105953849585789/91A639AB9F57BE393683DA53212E395886307C52/",
          },        
        },
        rank = "Corps",
        faction = "Separatist",
      },
      ["PYKE SYNDICATE FOOT SOLDIERS"] = {
        name = "Pyke Syndicate Foot Soldiers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718821/EBC76B7A94A5F3C03B036C17E3C26E0319F1C6EB/",
        size = "small",
        type = "Trooper",
        points = 44,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845548/FD104F41509A53EA1C888862A3C5F0B98F609F1F/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845646/BE0DEED782F96BD44C389DEDEA41EBEA0C7A6D04/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845697/15B6DCCA8D8D76E1CB78219C58790E40DDD7CE8A/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845389/0D7DFE0C5BF5CDD527A619B75A25A2177D417BD0/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },        
        },
        rank = "Corps",
        faction = "Separatist",
      },
      ["BLACK SUN ENFORCERS"] = {
        name = "Black Sun Enforcers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718139/222491782E56EAECE8B93E78E946F308211DC049/",
        size = "small",
        type = "Trooper",
        points = 50,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845475/01738B0D52E2D9C2870D6E33A2D05ECD12201C85/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143724/48B5A35E10B4977E255D889A8FCAEA8C980A11A9/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143328/3D6F3C2E8DFB78B9B748FFC8F339B9C568D7408E/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143724/48B5A35E10B4977E255D889A8FCAEA8C980A11A9/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143328/3D6F3C2E8DFB78B9B748FFC8F339B9C568D7408E/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143724/48B5A35E10B4977E255D889A8FCAEA8C980A11A9/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143328/3D6F3C2E8DFB78B9B748FFC8F339B9C568D7408E/",
          },        
        },
        rank = "Corps",
        faction = "Separatist",
      },
      ["GEONOSIAN WARRIORS SOLDIERS OF THE HIVE"] = {
        name = "Geonosian Warriors",
        title = "Soldiers of the Hive",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131432412/D396E8DD6EEDD4AD239A43CCE45BBC28B720DD77/",
        size = "small",
        type = "Trooper",
        points = 45,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177202081/37F68E146C49B315AA46E15BE88DDB56AE97646C/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177195881/84020A8311904050DC9309FE9109D47BC41FE4AA/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177201554/7AEA5B0A98A298731F6BE51591401BBF095A5797/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177195881/84020A8311904050DC9309FE9109D47BC41FE4AA/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177201933/E0DBF0D812FFF4F7F3A77CF1E4EAB84F78B8C49E/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177195881/84020A8311904050DC9309FE9109D47BC41FE4AA/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177202012/76CB0371503304D5AAF562E5E2F04961CD206090/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177195881/84020A8311904050DC9309FE9109D47BC41FE4AA/",
          },        
        },
        rank = "Corps",
        faction = "Separatist",
      },
      ["BX-SERIES DROID COMMANDOS"] = {
        name = "BX-Series Droid Commandos",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131431998/46D37A7B1D195729C7E854687F0F287E5DD8DED2/",
        size = "small",
        type = "Droid Trooper",
        points = 64,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 1,
          Comms = 1,
          Armament = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1009315641457847081/F7D4E8D3EC85BAEEB5C1B5B913B7F484CC28FC10/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/773995528924546789/8774CBBDC3C4F18B11A444CC96EA5FE7F00DB48F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1009315641457845802/AE70766EAA85C875B023FB980A5A5CEEFB98B1D9/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/773995528924546789/8774CBBDC3C4F18B11A444CC96EA5FE7F00DB48F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1009315641457846188/D7F348E890430AA319DDDFA513D99DC2783ECF91/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/773995528924546789/8774CBBDC3C4F18B11A444CC96EA5FE7F00DB48F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1009315641457846574/F169D9E2E45B73D1E21B17E32D3B4B4D9AACB196/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/773995528924546789/8774CBBDC3C4F18B11A444CC96EA5FE7F00DB48F/",
          },        
        },
        rank = "Special Forces",
        faction = "Separatist",
      },
      ["BX-SERIES DROID COMMANDOS STRIKE TEAM"] = {
        name = "BX-Series Droid Commandos",
        title = "Strike Team",
        displayName = "BX-Series Commandos (Strike Team)",
        heavyWeaponTeam = true,
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131430807/F260EA4E79ACB29C3C635836A3EF7E7C632E4FB6/",
        size = "small",
        type = "Droid Trooper",
        points = 20,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 1,
          Comms = 1,
          Armament = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1009315641457847081/F7D4E8D3EC85BAEEB5C1B5B913B7F484CC28FC10/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/773995528924546789/8774CBBDC3C4F18B11A444CC96EA5FE7F00DB48F/",
          },        
        },
        rank = "Special Forces",
        faction = "Separatist",
      },
      ["DRK-1 SITH PROBE DROIDS"] = {
        name = "DRK-1 Sith Probe Droids",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131432071/495850F5BE28D1D1551D13D5B86F473D8EB154EC/",
        size = "small",
        type = "Droid Trooper",
        points = 35,
        speed = 2,
        upgrades = {
          Comms = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809185513/A794F69FD4F7FF6093A8E4564633AF49C95DE79D/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809185513/A794F69FD4F7FF6093A8E4564633AF49C95DE79D/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809185513/A794F69FD4F7FF6093A8E4564633AF49C95DE79D/",
          },        
        },
        rank = "Special Forces",
        faction = "Separatist",
      },
      ["IG-100 MAGNAGUARD"] = {
        name = "IG-100 MagnaGuard",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131432444/15103BB5D4C33479CCB11DE66465798D9F92AFAD/",
        size = "small",
        type = "Droid Trooper",
        points = 72,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 2,
          Comms = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1621849308236386731/FA50237A0BF717ED06EA3020D5F4089D452ADCD6/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1621849538641208262/A0E48F7D9C94617C81BAD4D649717BAC7A8B9B64/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1621849308236386470/4D5227051DEEED77303985CE6D34CDBFB27FD472/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1621849538641208262/A0E48F7D9C94617C81BAD4D649717BAC7A8B9B64/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1621849308236386513/AC53B9F503C0B353AE7AA797072F7EBA15A1214C/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1621849538641208262/A0E48F7D9C94617C81BAD4D649717BAC7A8B9B64/",
          },        
        },
        rank = "Special Forces",
        faction = "Separatist",
      },
      ["IG-100 MAGNAGUARD PROTOTYPE ASSASSIN DROIDS"] = {
        name = "IG-100 MagnaGuard",
        title = "Prototype Assassin Droids",
        displayName = "Prototype Assassin Droids",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131432434/A38C1603DC1173981D6AE179774F385B400DE073/",
        size = "small",
        type = "Droid Trooper",
        points = 56,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1621849308236386731/FA50237A0BF717ED06EA3020D5F4089D452ADCD6/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1621849538641208262/A0E48F7D9C94617C81BAD4D649717BAC7A8B9B64/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1621849308236386470/4D5227051DEEED77303985CE6D34CDBFB27FD472/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1621849538641208262/A0E48F7D9C94617C81BAD4D649717BAC7A8B9B64/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1621849308236386513/AC53B9F503C0B353AE7AA797072F7EBA15A1214C/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1621849538641208262/A0E48F7D9C94617C81BAD4D649717BAC7A8B9B64/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1621849308236386470/4D5227051DEEED77303985CE6D34CDBFB27FD472/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1621849538641208262/A0E48F7D9C94617C81BAD4D649717BAC7A8B9B64/",
          },        
        },
        rank = "Special Forces",
        faction = "Separatist",
      },
      ["DROIDEKAS"] = {
        name = "Droidekas",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131432109/A0B45534B85F46D38A4F372B04041A5193B31426/",
        size = "medium",
        type = "Ground Vehicle",
        points = 60,
        speed = 1,
        upgrades = {
          Comms = 1,        
        },
        silhouette = {
          height = 1.85,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1686023445067168845/FBADA8EDE2ED248CA7F50C1DB3BFF46215E0360B/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1686023445067146631/305531F34B6598A008F5925D828457DF1A8195F6/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1686023445067146269/A9189AC12193D3BD24624F7A5137C4E69FADDBBF/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1686023445067146631/305531F34B6598A008F5925D828457DF1A8195F6/",
          },        
        },
        rank = "Support",
        faction = "Separatist",
      },
      ["LM-432 CRAB DROID"] = {
        name = "LM-432 Crab Droid",
        image = "https://steamusercontent-a.akamaihd.net/ugc/2491139050708063278/ED3246E4E67C5213E1DDDA3064AFAB7213BDD737/",
        size = "large",
        type = "Ground Vehicle",
        points = 70,
        speed = 2,
        upgrades = {
          Comms = 1,
          Programming = 1,
          Hardpoint = 1,        
        },
        silhouette = {
          height = 1.453,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/16432158164944196/4594ADE002844CEEB6FB9A75E17AA802FCAE89FF/",
          },        
        },
        rank = "Support",
        faction = "Separatist",
      },
      ["STAP RIDERS"] = {
        name = "STAP Riders",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131433789/32FE5B587A5DD8D208101FCE74CD2BE690483F37/",
        size = "medium",
        type = "Repulsor Vehicle",
        points = 80,
        speed = 3,
        upgrades = {
          Comms = 1,        
        },
        silhouette = {
          height = 2.246,
          offset = 0,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/16431529699543053/6B293027828F96F5A6DF95E8E0D4238F13FF2520/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/16431529699543124/C68D34EDD49D80DF4CCD801A50C085BFDE59E13D/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/16431529699543293/DE945637F2A703763288FF04C08FF27A52F1BB62/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/16431529699543380/AB5C8DBAC327E95B4938F575EBFB88A340519A53/",
          },        
        },
        rank = "Support",
        faction = "Separatist",
      },
      ["DSD1 DWARF SPIDER DROID"] = {
        name = "DSD1 Dwarf Spider Droid",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131432141/809B747B4008E7D3CF6EFB9EE1A4E3330A8D7C50/",
        size = "large",
        type = "Ground Vehicle",
        points = 50,
        speed = 2,
        upgrades = {
          Programming = 1,
          Hardpoint = 1,
          Comms = 1,        
        },
        silhouette = {
          height = 1.756,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1621849538645161033/A69093521055BB5CA008D3DDE5F6EBEB990D0AF2/",
          },        
        },
        rank = "Support",
        faction = "Separatist",
      },
      ["AAT BATTLE TANK"] = {
        name = "AAT Battle Tank",
        displayName = "AAT Battle Tank",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131430642/9FCE0FB0F62A9381DF3CE2F786DBC749CB2A8FFF/",
        size = "epic",
        type = "Repulsor Vehicle",
        points = 165,
        speed = 1,
        upgrades = {
          Pilot = 1,
          Ordnance = 2,
          Comms = 1,        
        },
        silhouette = {
          height = 4.022,
          offset = 0,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/785235151813166538/2F32058DDD51C131547B66A3927041BDACDD9E72/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785235151813166725/2751E83472B0B6BD0559F5E77FAA3D62A0E17BB1/",
          },        
        },
        rank = "Heavy",
        faction = "Separatist",
      },
      ["PERSUADER-CLASS TANK DROID"] = {
        name = "Persuader-Class Tank Droid",
        displayName = "Persuader Tank",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131496505/E6D1491724153DE1BE82FA00B4630DC24E9877ED/",
        size = "snail",
        type = "Ground Vehicle",
        points = 130,
        speed = 1,
        upgrades = {
          Programming = 1,
          Ordnance = 2,
          Comms = 1,        
        },
        silhouette = {
          height = 3.323,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1924743543116068132/37BCE99DCF06BEFA1119FEA911188695F9C48079/",
          },        
        },
        rank = "Heavy",
        faction = "Separatist",
      },
      ["PERSUADER-CLASS TANK DROID PROTOTYPE TANK DROID"] = {
        name = "Persuader-Class Tank Droid",
        title = "Prototype Tank Droid",
        displayName = "Prototype Tank Droid",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131496505/E6D1491724153DE1BE82FA00B4630DC24E9877ED/",
        size = "snail",
        type = "Ground Vehicle",
        points = 130,
        speed = 1,
        upgrades = {
          Programming = 1,
          Ordnance = 2,
          Comms = 1,        
        },
        silhouette = {
          height = 3.323,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1924743543116068132/37BCE99DCF06BEFA1119FEA911188695F9C48079/",
          },        
        },
        rank = "Heavy",
        faction = "Separatist",
      },
      ["AQUA DROIDS"] = {
        name = "Aqua Droids",
        image = "https://steamusercontent-a.akamaihd.net/ugc/1794100632571587/D3308B09BB6167322BFFB83C1A7E420C431D2396/",
        size = "medium",
        type = "Ground Vehicle",
        points = 65,
        speed = 1,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Comms = 1,        
        },
        silhouette = {
          height = 1.85,
          offset = 0,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/16428277771257521/99A8ACEC9864DE29C7CE97006E86248BB2A89554/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/16428277771257705/0333921D3F7C247633D1ACF1E5D02817AD5033C5/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/16428277771264084/F6A007092091B31717175CB063F1E48538CF1AB5/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/16428277771264195/557F35AB163FBF0C51672567101157A8750C1DAD/",
          },
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/16428277771241462/FFE8D6B9DE310FE7BC3B01C8128264DB9A8B1DFE/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/16428277771241663/4DEF50D36EB484BB1BBD9FD6092708DEF89A28EA/",
          },        
        },
        rank = "Heavy",
        faction = "Separatist",
      },
    },
    ["SHADOWCOLLECTIVE"] = {
      ["GAR SAXON MILITANT COMMANDO"] = {
        name = "Gar Saxon",
        title = "Militant Commando",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139719525/A5642D0B10D7426AD751D9428A0C249D5F4BAF2F/",
        size = "small",
        type = "Trooper",
        points = 100,
        speed = 3,
        upgrades = {
          Training = 2,
          Comms = 1,
          Gear = 2,
          Armament = 2,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143862/CF491C11176E40BD786A89E1D0C20D3316448188/",
          },        
        },
        commands = {
          {
            name = "Marked for Elimination",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139734189/BFD230D0FDCC337658C60B4254D6718684F4EF21/",
            pip = 1,
          },
          {
            name = "Fight Another Day",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139727495/1DCDC03996549F05C8D84E79CCAAC22F9F22CA17/",
            pip = 2,
          },
          {
            name = "Victory or Death!",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139734267/BE465B62B232B7E2F2992497221C565D00B19CCF/",
            pip = 3,
          },        
        },
        rank = "Commander",
        faction = "ShadowCollective",
      },
      ["BLACK SUN VIGO"] = {
        name = "Black Sun Vigo",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718200/725F66281B4596ACF010C38A1E37D169B597D56C/",
        size = "small",
        type = "Trooper",
        points = 50,
        speed = 2,
        upgrades = {
          Command = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143763/E93BA6716A05CA95AE2EA3B7C0DFD8AF145D5C22/",
          },        
        },
        rank = "Commander",
        faction = "ShadowCollective",
      },
      ["PYKE SYNDICATE CAPO"] = {
        name = "Pyke Syndicate Capo",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718883/40D17DA044960A4A34979FBDEAE9296EB1E50346/",
        size = "small",
        type = "Trooper",
        points = 48,
        speed = 2,
        upgrades = {
          Command = 1,
          Gear = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420351237/706DEA645FEE2EC9787F05F4FF2926632E2C4894/",
          },        
        },
        rank = "Commander",
        faction = "ShadowCollective",
      },
      ["MAUL A RIVAL"] = {
        name = "Maul",
        title = "A Rival",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718510/46475D968DFF923C51695A46BB5A652D2194E600/",
        size = "small",
        type = "Trooper",
        points = 170,
        speed = 2,
        upgrades = {
          Force = 2,
          Command = 1,
          Training = 1,
          Armament = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1789640371719014130/7A59CCE5B8A8C87DD3952C15819FAA8921708A75/",
          },        
        },
        commands = {
          {
            name = "Witch Magick",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139732571/7409767511212BC5F60C749EED79FBE45BED8DF2/",
            pip = 1,
          },
          {
            name = "His Eminence",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139727459/C8F9934D8CB1396F2F88743AE2F39A8EFADA20F8/",
            pip = 2,
          },
          {
            name = "Seize What Power We Can",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139729567/6F123B5506E6F0DC1F04907A2C5285AF180DFD97/",
            pip = 3,
          },
          {
            name = "Duel of the Fates",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139727558/BA0C0A83F63DD13EC3A4CC073071CA2DB1BEA27E/",
            pip = 1,
          },
          {
            name = "The Phantom Menace",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139729626/683EBFF15A3FBAC43A1DE8EF508DE05ACFEBE1D1/",
            pip = 2,
          },
          {
            name = "At Last",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139727404/5C2C80FCCF13A12AB56614E633960DAC3648BCC3/",
            pip = 3,
          },        
        },
        rank = "Operative",
        faction = "ShadowCollective",
      },
      ["CAD BANE NEEDS NO INTRODUCTION"] = {
        name = "Cad Bane",
        title = "Needs No Introduction",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137007196/49655B5A32FFAB3CE31BFCCFEA9811CD4A51B748/",
        size = "small",
        type = "Trooper",
        points = 105,
        speed = 2,
        upgrades = {
          Training = 2,
          Comms = 1,
          Gear = 1,
          Armament = 1,
          Grenades = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/1003681674396400482/F8900CFC9EF2309C9F54AE33AE5444B2B09DB1CD/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/1003681674396400696/907F4310FEA7A7CD89EE64A1AF3A8CC77897CCAC/",
          },        
        },
        commands = {
          {
            name = "I'm Your Worst Nightmare",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137014543/33FE8591FAFD29F8BEAF13D64851772A7FD794FE/",
            pip = 1,
          },
          {
            name = "I'm In Control",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137014579/D2FC7AF724D1C7527CCDDABF18517E9CB99DF061/",
            pip = 2,
          },
          {
            name = "I Make The Rules Now",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137014560/4B6E8AF4CB10FFE7EC529D204390FC45291FC962/",
            pip = 3,
          },        
        },
        additionalObjects = {
          "Bane Token: Blank",
          "Bane Token: Bomb",
          "Bane Token: Bane",
          "Victory Token",        
        },
        rank = "Operative",
        faction = "ShadowCollective",
      },
      ["BOSSK TRANDOSHAN TERROR"] = {
        name = "Bossk",
        title = "Trandoshan Terror",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137006564/2C7F90FF127392A78F71B82EF4E69C35973824AD/",
        size = "small",
        type = "Trooper",
        points = 105,
        speed = 2,
        upgrades = {
          Training = 2,
          Gear = 1,        
        },
        minis = {
          {
            mesh = "https://steamusercontent-a.akamaihd.net/ugc/948474323838791181/6B9D77B77DF8FD7AFA19342AD687F0E15A2E21B7/",
            diffuse = "https://steamusercontent-a.akamaihd.net/ugc/948474323838791276/ABFCDD8C71D484E6B6050080BB80B79D0DE93178/",
          },        
        },
        commands = {
          {
            name = "Merciless Munitions",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137013809/1D7FCC2F2A12F6B09B07345330F840800A846F7C/",
            pip = 1,
          },
          {
            name = "Reptilian Rampage",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137013972/29F197704D74AF20E8954F2BE8AC5C9203F9A2E6/",
            pip = 2,
          },
          {
            name = "Lying In Wait",
            image = "https://steamusercontent-a.akamaihd.net/ugc/10804385137013903/60F4AC014F68998F8A3587BA0A5389301A0BAA7C/",
            pip = 3,
          },        
        },
        additionalObjects = {
          "Proton Charge Token",
          "Victory Token",        
        },
        rank = "Operative",
        faction = "ShadowCollective",
      },
      ["PYKE SYNDICATE FOOT SOLDIERS"] = {
        name = "Pyke Syndicate Foot Soldiers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718821/EBC76B7A94A5F3C03B036C17E3C26E0319F1C6EB/",
        size = "small",
        type = "Trooper",
        points = 44,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845548/FD104F41509A53EA1C888862A3C5F0B98F609F1F/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845646/BE0DEED782F96BD44C389DEDEA41EBEA0C7A6D04/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845697/15B6DCCA8D8D76E1CB78219C58790E40DDD7CE8A/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845389/0D7DFE0C5BF5CDD527A619B75A25A2177D417BD0/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",
          },        
        },
        rank = "Corps",
        faction = "ShadowCollective",
      },
      ["BLACK SUN ENFORCERS"] = {
        name = "Black Sun Enforcers",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139718139/222491782E56EAECE8B93E78E946F308211DC049/",
        size = "small",
        type = "Trooper",
        points = 50,
        speed = 2,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Personnel = 1,
          Gear = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845475/01738B0D52E2D9C2870D6E33A2D05ECD12201C85/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143724/48B5A35E10B4977E255D889A8FCAEA8C980A11A9/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143328/3D6F3C2E8DFB78B9B748FFC8F339B9C568D7408E/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143724/48B5A35E10B4977E255D889A8FCAEA8C980A11A9/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143328/3D6F3C2E8DFB78B9B748FFC8F339B9C568D7408E/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143724/48B5A35E10B4977E255D889A8FCAEA8C980A11A9/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143328/3D6F3C2E8DFB78B9B748FFC8F339B9C568D7408E/",
          },        
        },
        rank = "Corps",
        faction = "ShadowCollective",
      },
      ["MANDALORIAN SUPER COMMANDOS"] = {
        name = "Mandalorian Super Commandos",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139720568/C0F87A2E12C8AE493654F7F4E9F71E16D3FA8BEB/",
        size = "small",
        type = "Trooper",
        points = 70,
        speed = 3,
        upgrades = {
          ["Heavy Weapon"] = 1,
          Training = 1,
          Comms = 1,
          Gear = 1,
          Armament = 1,
          Grenades = 1,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143408/F4A88228E11334545EACA86B36E6B2008E76B0D3/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1789640371717200769/60353F40BAE6D92D6F6ED24E2883EB9CC2EA74C4/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143500/4BDEA7F5B523FC06641B3D71D1E112DC14BD7F81/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1789640371717200823/B886D3157AA2F2528F4E5F76F26DF44A41496615/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143285/F206D67AFF9379B68AD0795767DA378CE80D44AE/",
            secondary = "https://steamusercontent-a.akamaihd.net/ugc/1789640371717200823/B886D3157AA2F2528F4E5F76F26DF44A41496615/",
          },        
        },
        rank = "Special Forces",
        faction = "ShadowCollective",
      },
      ["SWOOP BIKE RIDERS"] = {
        name = "Swoop Bike Riders",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139721420/2BD490189FBB2AF2C7D6AA12EFA6EAA643EA2002/",
        size = "medium",
        type = "Repulsor Vehicle",
        points = 65,
        speed = 3,
        upgrades = {
          Comms = 1,        
        },
        silhouette = {
          height = 1.891,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1924743543116067434/0A068914BDD35AE6F63D7E29EBC7E0B5F712DA1F/",
          },
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1924743543116067490/87719312BE33C493B97B0915DB8C89FDC57D3F38/",
          },        
        },
        rank = "Support",
        faction = "ShadowCollective",
      },
      ["A-A5 SPEEDER TRUCK"] = {
        name = "A-A5 Speeder Truck",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139723206/223C60DDB2052576AE1CF777BE23675AA0FF8F2E/",
        size = "long",
        type = "Repulsor Vehicle",
        points = 65,
        speed = 1,
        upgrades = {
          Crew = 2,
          Pilot = 1,
          Hardpoint = 1,
          Comms = 1,        
        },
        silhouette = {
          height = 3.591,
          offset = 0,        
        },
        minis = {
          {
            bundle = "https://steamusercontent-a.akamaihd.net/ugc/1802024425338475527/29D3660FA84E5B9F804B840C18E68F5631EE6462/",
          },        
        },
        rank = "Heavy",
        faction = "ShadowCollective",
      },
    },
  },
  upgrades = {
    ["\"BOUNTY\" PROGRAMMING"] = {
      name = "\"Bounty\" Programming",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148639304/9F41559BA60B2818CC2EEF4A560273B136B987D0/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "IG-11",          
          },        
        },      
      },
      type = "Programming",
    },
    ["\"BUNKER BUSTER\" SHELLS"] = {
      name = "\"Bunker Buster\" Shells",
      image = "https://steamusercontent-a.akamaihd.net/ugc/9396219603588818774/E619EEF276816268108D1338C25AD01D6B6B7D5D/",
      points = 12,
      type = "Ordnance",
    },
    ["\"NANNY\" PROGRAMMING"] = {
      name = "\"Nanny\" Programming",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638679/4804577A9E8C3C865E84CEECED87D0E1E113316E/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "IG-11",          
          },
          faction = {
            "Rebel",          
          },        
        },      
      },
      type = "Programming",
    },
    ["2-1B MEDICAL DROID"] = {
      name = "2-1B Medical Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140081057/7B8C4C39468574A77EFF23E38A393B7E65D48867/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/949599512594268997/6248E4CAF3E978154106E7095E6984DCE6677CCA/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/949599512594282950/7A9A3E5518394273A507A64CCF7425A2E7EFC29B/",      
      },
      points = 18,
      restrictions = {
        include = {
          faction = {
            "Rebel",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["327TH STAR CORPS ELITE ARMOR PILOTS"] = {
      name = "327th Star Corps Elite Armor Pilots",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384854716/A1F69A11B6BDCD7BA7991C9A7BE8773855CFA20C/",
      points = 8,
      restrictions = {
        include = {
          unit = {
            "Infantry Support Platform",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["88I TWIN LIGHT BLASTER"] = {
      name = "88i Twin Light Blaster",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148691925/3E5BD15301BBACDB13D110B2284E17980F052601/",
      points = 10,
      restrictions = {
        include = {
          unit = {
            "AT-ST",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["A-180 PISTOL CONFIG"] = {
      name = "A-180 Pistol Config",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568137779/795B34FF0E53DA5355EA7952A034C6A4CFD003D0/",
      type = "Armament",
      points = 0,
      restrictions = {
        include = {
          unit = {
            "Jyn Erso",          
          },        
        },      
      },
      mini = undefined,
      flip = {
        name = "A-180 Rifle Config",
        image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568137807/208481F3DC8BE18ED10D2A17F12F35869213235C/",      
      },
    },
    ["A-180 RIFLE CONFIG"] = {
      name = "A-180 Rifle Config",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568137807/208481F3DC8BE18ED10D2A17F12F35869213235C/",
      flip = {
        name = "A-180 Pistol Config",
        image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568137779/795B34FF0E53DA5355EA7952A034C6A4CFD003D0/",      
      },
      points = 0,
      restrictions = {
        include = {
          unit = {
            "Jyn Erso",          
          },        
        },      
      },
      type = "Armament",
    },
    ["A-300 LONG RANGE CONFIG"] = {
      name = "A-300 Long Range Config",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568137867/156C35C00A49AC23AE84E5ACCF35ADD6D7CBD820/",
      flip = {
        name = "A-300 Short Range Config",
        image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568137938/8B2FA2C71505CA93AB086154658132C221BEBE1D/",      
      },
      points = 0,
      restrictions = {
        include = {
          unit = {
            "Rebel Pathfinders",          
          },        
        },      
      },
      type = "Armament",
    },
    ["A-300 RIFLE GUNNER"] = {
      name = "A-300 Rifle Gunner",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140081194/2DC1EEA962453DA3D345451038A56B1A9E6219E7/",
      points = 1,
      restrictions = {
        include = {
          unit = {
            "X-34 Landspeeder",          
          },        
        },      
      },
      type = "Crew",
    },
    ["A-300 SHORT RANGE CONFIG"] = {
      name = "A-300 Short Range Config",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568137938/8B2FA2C71505CA93AB086154658132C221BEBE1D/",
      type = "Armament",
      points = 0,
      restrictions = {
        include = {
          unit = {
            "Rebel Pathfinders",          
          },        
        },      
      },
      mini = undefined,
      flip = {
        name = "A-300 Long Range Config",
        image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568137867/156C35C00A49AC23AE84E5ACCF35ADD6D7CBD820/",      
      },
    },
    ["A280, PISTOL CONFIG"] = {
      name = "A280, Pistol Config",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140081077/A5B040BCD34352C6E5375640DE539E526067DBFE/",
      type = "Armament",
      points = 0,
      restrictions = {
        include = {
          unit = {
            "Cassian Andor",          
          },        
        },      
      },
      mini = undefined,
      flip = {
        name = "A280, Rifle Config",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140081159/19C93D73F4F86E9D7531E2CD784F5492772ED28F/",      
      },
    },
    ["A280, RIFLE CONFIG"] = {
      name = "A280, Rifle Config",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140081159/19C93D73F4F86E9D7531E2CD784F5492772ED28F/",
      flip = {
        name = "A280, Pistol Config",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140081077/A5B040BCD34352C6E5375640DE539E526067DBFE/",      
      },
      points = 0,
      restrictions = {
        include = {
          unit = {
            "Cassian Andor",          
          },        
        },      
      },
      type = "Armament",
    },
    ["AG-2G QUAD LASER"] = {
      name = "AG-2G Quad Laser",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148639560/6A39AE6CE8A42E8B04D4C5F128F5386A7DBF6CA8/",
      points = 28,
      restrictions = {
        include = {
          unit = {
            "A-A5 Speeder Truck",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["ARF TROOPER DUO"] = {
      name = "ARF Trooper Duo",
      image = "https://steamusercontent-a.akamaihd.net/ugc/16167615007606416168/E2F191BF04EE9A6AD8B59DFCC57739F95C3A5A12/",
      minis = {
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/16428815149932608/94AB8C15D97E81FF8040E81BC91F79A7105FF4B4/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/16428815149932637/F5D29AC3162A9D47B5440E5A3E3399FC12A594BE/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/16428815149932871/EE8DF333D45ED841E9C31625FB4A9385C16B2F49/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/16428815149933386/736E0CCF2ADE31D6A9F6BE172B20AEB5420B815E/",
        },      
      },
      points = 26,
      restrictions = {
        include = {
          unit = {
            "ARF Troopers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["AT-RT FLAMETHROWER"] = {
      name = "AT-RT Flamethrower",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140081769/07D4C1667BDEE090F39484775AEE7210086485B3/",
      points = 15,
      restrictions = {
        include = {
          unit = {
            "AT-RT",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["AT-RT LASER CANNON"] = {
      name = "AT-RT Laser Cannon",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140081788/A032FAAFF3DB96A0423D0691209C65FFCC272D32/",
      points = 10,
      restrictions = {
        include = {
          unit = {
            "AT-RT",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["AT-RT ROTARY BLASTER"] = {
      name = "AT-RT Rotary Blaster",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140081805/40CE85B06069C7ABA4D93C271976B49CD2ED57C1/",
      points = 20,
      restrictions = {
        include = {
          unit = {
            "AT-RT",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["AT-ST MORTAR LAUNCHER"] = {
      name = "AT-ST Mortar Launcher",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148692069/D79A2F7BF496B1EFCF593CB54F929F68B047A8F9/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "AT-ST",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["AX-108 \"GROUND BUZZER\""] = {
      name = "AX-108 \"Ground Buzzer\"",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140081842/2473F73E42DEF62BE49EA8789193A8AEDEECB097/",
      points = 10,
      restrictions = {
        include = {
          unit = {
            "T-47 Airspeeder",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["AAYLA SECURA"] = {
      name = "Aayla Secura",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13270315361837467006/57E535080404547F3055847340DF881544FE2E62/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "Saber-Class Tank",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["AGGRESSIVE TACTICS"] = {
      name = "Aggressive Tactics",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568138085/A9EF32E5D1F5E222B484A821ACDC6FED6EE5EDC3/",
      points = 15,
      type = "Command",
    },
    ["AHSOKA TANO, JEDI PADAWAN"] = {
      name = "Ahsoka Tano, Jedi Padawan",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59217531459831255/8A122988056B15729D1EBAB3F459B8AF5AA13113/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/16432616714054298/93B766A9FA311E199C2FCAF5BA29137B4FA12A9F/",      
      },
      points = 35,
      leader = true,
      restrictions = {
        include = {
          faction = {
            "Republic",          
          },        
        },      
      },
      type = "Squad Leader",
    },
    ["ANGER"] = {
      name = "Anger",
      image = "https://steamusercontent-a.akamaihd.net/ugc/15480929961350237792/459C25A6310A790CCD57B24B19BCEF4AC8A0F4AB/",
      points = 3,
      restrictions = {
        include = {
          alignment = {
            "Dark",          
          },        
        },      
      },
      type = "Force",
    },
    ["ARMOR-PIERCING SHELLS"] = {
      name = "Armor-Piercing Shells",
      image = "https://steamusercontent-a.akamaihd.net/ugc/9408502186349462134/5D735A7FAB7ECC984A0D591167B24FF02CE4133E/",
      points = 10,
      type = "Ordnance",
    },
    ["ASCENSION CABLES"] = {
      name = "Ascension Cables",
      image = "https://steamusercontent-a.akamaihd.net/ugc/17457507251375076663/CDA2350510DE5988DF0E4A5BF8929A2E75E3A498/",
      points = 4,
      type = "Gear",
    },
    ["ASTROMECH"] = {
      name = "Astromech",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140081721/9FBE2EBFF8A54C66DAC860A08E68AF4D108A09A2/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/2508033889680571476/57CF310CEE5CCDFE2F0769BE7BAF97A6A4104035/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/2508033889680571745/E93CBD4D8EBD90588639BCA658F36E208A58E465/",      
      },
      points = 9,
      restrictions = {
        include = {
          unit = {
            "Rebel Sleeper Cell",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["ASTROMECH DROID"] = {
      name = "Astromech Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140081288/0419F2D2F5D687DC9B927FE7C39AF89D52FD4ABD/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/949599512594428341/4AC5A309D701979A4B3E94725BC1E8745C598BCE/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/949599512594267684/F84F03E4A52F50EF5255A464FF85083CF4FB3D26/",      
      },
      points = 8,
      restrictions = {
        include = {
          faction = {
            "Rebel",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["ATTACK PROTOCOLS"] = {
      name = "Attack Protocols",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10231463032862954270/5569EEFD92CA844450DCFDF7BC652B4DDC055DD5/",
      points = 8,
      restrictions = {
        include = {
          type = {
            "Vehicle",          
          },        
        },      
      },
      type = "Programming",
    },
    ["AXE EWOK"] = {
      name = "Axe Ewok",
      image = "https://steamusercontent-a.akamaihd.net/ugc/9885217524913261667/1618CC576AAF98E0DA209802203DD03717CED738/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128895/152E8A0BE0A0FB98FAD48338552C6282DD8954B7/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",      
      },
      points = 15,
      restrictions = {
        include = {
          unit = {
            "Ewok Skirmishers",
            "Ewok Slingers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["B1 BATTLE DROID"] = {
      name = "B1 Battle Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139926619/12E85E2D56E590D6D718B15BDE100799D6F9D077/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780869167318/DBC7863706A08B96020D3BFBE7A0C2C5689B7B08/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166919/FE5AD3A71430C729735E3FF7023D9E546E12FEF1/",      
      },
      points = 4,
      restrictions = {
        include = {
          unit = {
            "B1 Battle Droids",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["B1 BATTLE DROID SQUAD"] = {
      name = "B1 Battle Droid Squad",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139926468/DB7AB15E9634E1EE003C27E65E33A67D9F2876CC/",
      minis = {
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780869167061/48F42C02EDD970E6DE8E59B8601EF3E7F11C1742/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166919/FE5AD3A71430C729735E3FF7023D9E546E12FEF1/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780869167318/DBC7863706A08B96020D3BFBE7A0C2C5689B7B08/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166919/FE5AD3A71430C729735E3FF7023D9E546E12FEF1/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166660/36AF6887F11FC70FF6AB75D0434EA79952C9E882/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166919/FE5AD3A71430C729735E3FF7023D9E546E12FEF1/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780869167194/9ADFFD9AD608CBE3E9F6F61AB416E699A4156109/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166919/FE5AD3A71430C729735E3FF7023D9E546E12FEF1/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780869167318/DBC7863706A08B96020D3BFBE7A0C2C5689B7B08/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166919/FE5AD3A71430C729735E3FF7023D9E546E12FEF1/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166660/36AF6887F11FC70FF6AB75D0434EA79952C9E882/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166919/FE5AD3A71430C729735E3FF7023D9E546E12FEF1/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780869167194/9ADFFD9AD608CBE3E9F6F61AB416E699A4156109/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780869166919/FE5AD3A71430C729735E3FF7023D9E546E12FEF1/",
        },      
      },
      points = 38,
      restrictions = {
        include = {
          unit = {
            "B1 Battle Droids",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["B1 SECURITY DROID"] = {
      name = "B1 Security Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139926745/A596D5C24CC8AFBA36C85A7307BFF2985BFCA2F5/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/766102173467517125/1BEF7A7795DF3F6DB91B84C1C82D8FBB24BF574B/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/766102173467517405/DC3A7F38CF3839B7C5F2FCCE85745041094ADA81/",      
      },
      points = 6,
      restrictions = {
        include = {
          unit = {
            "B1 Battle Droids",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["B2 SUPER BATTLE DROID"] = {
      name = "B2 Super Battle Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139926862/55D56B7AA8FC3FDC335499AC5DA66CD5A8DE3620/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/775105953849586324/B5D59E535AFA2BF99FCA3C584E28FA500ADB89BD/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/775105953849585789/91A639AB9F57BE393683DA53212E395886307C52/",      
      },
      points = 13,
      restrictions = {
        include = {
          unit = {
            "B2 Super Battle Droids",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["B2 SUPER BATTLE DROID SQUAD"] = {
      name = "B2 Super Battle Droid Squad",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139926806/AE2E14125DB171D14F95D09EB4D7530A1A22E2BA/",
      minis = {
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/775105953849586430/E5941CF7A3631E6D4A28832AE489A4340C96B0B9/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/775105953849585789/91A639AB9F57BE393683DA53212E395886307C52/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/775105953849586226/9326AD8D3EC80CC53F4BF2D156014978DCD715D9/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/775105953849585789/91A639AB9F57BE393683DA53212E395886307C52/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/775105953849586430/E5941CF7A3631E6D4A28832AE489A4340C96B0B9/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/775105953849585789/91A639AB9F57BE393683DA53212E395886307C52/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/775105953849586226/9326AD8D3EC80CC53F4BF2D156014978DCD715D9/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/775105953849585789/91A639AB9F57BE393683DA53212E395886307C52/",
        },      
      },
      points = 77,
      restrictions = {
        include = {
          unit = {
            "B2 Super Battle Droids",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["B2-ACM BATTLE DROID"] = {
      name = "B2-ACM Battle Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139926955/7598527939653076FB60A126D883BC9FCEFDD38C/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/775105953849585917/4D4047069796D1E0567BE9ABD836984FDF12E80E/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/775105953849585789/91A639AB9F57BE393683DA53212E395886307C52/",      
      },
      points = 24,
      restrictions = {
        include = {
          unit = {
            "B2 Super Battle Droids",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["B2-HA BATTLE DROID"] = {
      name = "B2-HA Battle Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139927358/329BE3BD01363997AED00F270306F36F9DD1C8C9/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/775105953849585631/7FF051E2079AB28A4FB77CCC739BCEB42F4CCFAA/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/775105953849585789/91A639AB9F57BE393683DA53212E395886307C52/",      
      },
      points = 32,
      restrictions = {
        include = {
          unit = {
            "B2 Super Battle Droids",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["BARC ION GUNNER"] = {
      name = "BARC Ion Gunner",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384855148/0ECDF8377C56E992005C396741BAA9CE7986222B/",
      points = 24,
      restrictions = {
        include = {
          unit = {
            "BARC Speeder",          
          },        
        },      
      },
      type = "Crew",
    },
    ["BARC RPS-6 GUNNER"] = {
      name = "BARC RPS-6 Gunner",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140038100/7C11EBB315EC571301B50C93DFD2004930FB5A91/",
      points = 21,
      restrictions = {
        include = {
          unit = {
            "BARC Speeder",          
          },        
        },      
      },
      type = "Crew",
    },
    ["BARC TWIN LASER GUNNER"] = {
      name = "BARC Twin Laser Gunner",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140038185/13E6A7A923E183A77BFC9704B86D6A36BD5921AD/",
      points = 18,
      restrictions = {
        include = {
          unit = {
            "BARC Speeder",          
          },        
        },      
      },
      type = "Crew",
    },
    ["BX DEFLECTOR SHIELDS"] = {
      name = "BX Deflector Shields",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139927385/CD3E586656B39D35246C84BAFD6ADB12B665E5E5/",
      points = 18,
      restrictions = {
        include = {
          unit = {
            "BX-Series Droid Commandos",          
          },        
        },      
      },
      type = "Armament",
    },
    ["BX VIBROSWORDS"] = {
      name = "BX Vibroswords",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139927392/0B4491CA615FAA34F7EFEDCE08BAD5A06571BE90/",
      points = 6,
      restrictions = {
        include = {
          unit = {
            "BX-Series Droid Commandos",          
          },        
        },      
      },
      type = "Armament",
    },
    ["BX-SERIES DROID SNIPER"] = {
      name = "BX-Series Droid Sniper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139927410/552314F29830D4A8A63F5B8238699336F17ECD92/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1009315641457847963/0EA6BE014DA494689FF32F9570C6A73CD88F1894/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/773995528924546789/8774CBBDC3C4F18B11A444CC96EA5FE7F00DB48F/",      
      },
      points = 40,
      restrictions = {
        include = {
          unit = {
            "BX-Series Droid Commandos",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["BACKWORLD MEDIC"] = {
      name = "Backworld Medic",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148639527/67E63647F6AA6084064CE8960AE4DD49094F213E/",
      points = 12,
      restrictions = {
        include = {
          unit = {
            "A-A5 Speeder Truck",          
          },        
        },      
      },
      type = "Crew",
    },
    ["BARON RUDOR"] = {
      name = "Baron Rudor",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148690870/A59A9EC3A2ED826D0BBE1CC6B2573483C238EB2E/",
      points = 8,
      restrictions = {
        include = {
          faction = {
            "Empire",          
          },
          type = {
            "Repulsor Vehicle",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["BARRAGE GENERATOR"] = {
      name = "Barrage Generator",
      image = "https://steamusercontent-a.akamaihd.net/ugc/12495820504141574252/66E55B65B1BC1B339B432F04AD0D130DFBC8D1BE/",
      points = 3,
      type = "Generator",
    },
    ["BATTLE MEDITATION"] = {
      name = "Battle Meditation",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568138926/6CA76E020914829864896AC19CB9532DDED05558/",
      points = 5,
      type = "Force",
    },
    ["BATTLE SHIELD WOOKIEE (DEFENSIVE)"] = {
      name = "Battle Shield Wookiee (Defensive)",
      displayName = "Shield Wookiee (Defensive)",
      image = "https://steamusercontent-a.akamaihd.net/ugc/12854197019477585426/9DCA829B612203A963C6A0C1B9B4CF1896D7CD1C/",
      type = "Heavy Weapon",
      points = 26,
      restrictions = {
        include = {
          unit = {
            "Wookiee Warriors",          
          },        
        },      
      },
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1621849308236386933/DCD62751F06157E85CE575C8BB1CCF86379BB7DE/",      
      },
      flip = {
        name = "Battle Shield Wookiee (Offensive)",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140084858/2608BF39F19557F71C8FF8D04314A0387DB7586C/",      
      },
    },
    ["BATTLE SHIELD WOOKIEE (OFFENSIVE)"] = {
      name = "Battle Shield Wookiee (Offensive)",
      displayName = "Shield Wookiee (Offensive)",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140084858/2608BF39F19557F71C8FF8D04314A0387DB7586C/",
      flip = {
        name = "Battle Shield Wookiee (Defensive)",
        displayName = "Shield Wookiee (Defensive)",
        image = "https://steamusercontent-a.akamaihd.net/ugc/12854197019477585426/9DCA829B612203A963C6A0C1B9B4CF1896D7CD1C/",      
      },
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1621849308236386933/DCD62751F06157E85CE575C8BB1CCF86379BB7DE/",      
      },
      points = 26,
      restrictions = {
        include = {
          unit = {
            "Wookiee Warriors",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["BEAM TURRET"] = {
      name = "Beam Turret",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135344116/6FA72AE219A115A5BA50033ECAF85464EE12FCA8/",
      points = 15,
      restrictions = {
        include = {
          unit = {
            "Saber-Class Tank",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["BESKAD DUELIST"] = {
      name = "Beskad Duelist",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140084887/6AE6E148D79D03A2A4C1B9B8D22DC0B9816222E0/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809252570/7F009B812ED06B7E45CFCE48142293A4B9C77991/",      
      },
      points = 24,
      restrictions = {
        include = {
          unit = {
            "Mandalorian Resistance",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["BESKAR SPEAR"] = {
      name = "Beskar Spear",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148639488/EDE8AA68D0589BFB956D68E2A08B31715C5F9D61/",
      points = 15,
      restrictions = {
        include = {
          unit = {
            "Din Djarin",          
          },        
        },      
      },
      type = "Armament",
    },
    ["BISTAN"] = {
      name = "Bistan",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384855202/3D20A35C96C91700E37106B18E3090FBE6C8E460/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/993513208355174951/467D917BF6BCABCC9F6DD17F5DEDB43A11DEA9A7/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/993513208355175183/AD143EC79EC2BA3E7B93B114CC8AFEAAD322D806/",      
      },
      points = 33,
      restrictions = {
        include = {
          unit = {
            "Rebel Pathfinders",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["BLACK SUN ENFORCER"] = {
      name = "Black Sun Enforcer",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148639440/31A3527F3D9D8579BDBD433D5F30F1EF973A47C8/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143724/48B5A35E10B4977E255D889A8FCAEA8C980A11A9/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143328/3D6F3C2E8DFB78B9B748FFC8F339B9C568D7408E/",      
      },
      points = 11,
      restrictions = {
        include = {
          unit = {
            "Black Sun Enforcers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["BLACK SUN VIGO"] = {
      name = "Black Sun Vigo",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148639389/E73718337CFAD8FD65CD341B6CF649BA181707AD/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143763/E93BA6716A05CA95AE2EA3B7C0DFD8AF145D5C22/",      
      },
      leader = true,
      points = 20,
      restrictions = {
        include = {
          unit = {
            "Black Sun Enforcers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["BOBA'S FLAME PROJECTOR"] = {
      name = "Boba's Flame Projector",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148639345/522E39430567071F6AB7C73BCC5C8270B3652384/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "Boba Fett",          
          },        
        },      
      },
      type = "Gear",
    },
    ["BOIL"] = {
      name = "Boil",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384855244/C0B4D4133262EB7AAA1DD3133545D5D4257ACE29/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446813135454/32F343B3295B563DF3041AF5F433E151F88C66B6/",      
      },
      leader = true,
      points = 15,
      restrictions = {
        include = {
          type = {
            "Clone Trooper",          
          },
          rank = {
            "Corps",          
          },        
        },      
      },
      type = "Squad Leader",
    },
    ["BOWCASTER WOOKIEE"] = {
      name = "Bowcaster Wookiee",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140084912/2AFB89610DC5DFDB593DC830F48E76682A5B78FA/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541174665/9E1AA98159F76E271185345E9D347D7453C05D4B/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541174034/90C4A124BB82CCE0B5E38E13860ED49BB9A4973B/",      
      },
      points = 31,
      restrictions = {
        include = {
          unit = {
            "Wookiee Warriors",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["BURST OF SPEED"] = {
      name = "Burst Of Speed",
      image = "https://steamusercontent-a.akamaihd.net/ugc/14427447140841744055/38C9A267DCB2BBD3F385EB1FBDA2A4D12687CC66/",
      points = 10,
      type = "Force",
    },
    ["C-3PO"] = {
      name = "C-3PO",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134141499/36DA30FD99788C7127DCADE11325FDBC09B16747/",
      points = 15,
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/776232727456807069/DE7E32B39455DB5111769436FD0C5BFDA3841268/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/777357228032306506/D60CB8A1159723917EF1831D4042318A67458A7A/",      
      },
      restrictions = {
        include = {
          unit = {
            "R2-D2",          
          },        
        },      
      },
      type = "Counterpart",
    },
    ["C-3PO HUMAN CYBORG RELATIONS"] = {
      name = "C-3PO Human Cyborg Relations",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134141499/36DA30FD99788C7127DCADE11325FDBC09B16747/",
      points = 15,
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/776232727456807069/DE7E32B39455DB5111769436FD0C5BFDA3841268/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/777357228032306506/D60CB8A1159723917EF1831D4042318A67458A7A/",      
      },
      restrictions = {
        include = {
          unit = {
            "R2-D2",          
          },        
        },      
      },
      type = "Counterpart",
    },
    ["C-3PO HUMAN CYBORG RELATIONS (GAR)"] = {
      name = "C-3PO Human Cyborg Relations (GAR)",
      image = "https://steamusercontent-a.akamaihd.net/ugc/11238494832346367985/1AAEB9F5359ADB9FA1C75D43A7F7FA087D5CD961/",
      points = 15,
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/776232727456807069/DE7E32B39455DB5111769436FD0C5BFDA3841268/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/777357228032306506/D60CB8A1159723917EF1831D4042318A67458A7A/",      
      },
      restrictions = {
        include = {
          unit = {
            "R2-D2",          
          },        
        },      
      },
      type = "Counterpart",
    },
    ["CM-0/93 TROOPER"] = {
      name = "CM-0/93 Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140084937/CFB33EA9EA5EECBC2AC894C172C560BEB13B6EAA/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687947/DCC60167A78C152DDAE932E699D7C70C5629008B/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192135/526538CE10AC6856578996BE6B8AB7263D32D5C7/",      
      },
      points = 26,
      restrictions = {
        include = {
          unit = {
            "Rebel Veterans",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["CR-24 FLAME RIFLE"] = {
      name = "CR-24 Flame Rifle",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140106922/DC1ED64816ECD4A7AB128F05D70EF97408305AAF/",
      points = 10,
      restrictions = {
        include = {
          unit = {
            "Dewback Rider",          
          },        
        },      
      },
      type = "Armament",
    },
    ["CALL TO ARMS"] = {
      name = "Call to Arms",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140099258/36B8495C43AD6C6CA175204A01096A05D647F70C/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "Ewok Slingers",
            "Ewok Skirmishers",          
          },        
        },      
      },
      type = "Training",
    },
    ["CLAIRVOYANCE"] = {
      name = "Clairvoyance",
      image = "https://steamusercontent-a.akamaihd.net/ugc/17229509976995559718/02821314DBA25F4938A6E51ED6F1BF2F79993A49/",
      points = 10,
      type = "Force",
    },
    ["CLONE CAPTAIN"] = {
      name = "Clone Captain",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384855290/1D4BC397E7FC6FD99DFE4A8B2B3799AB2CDDBC3D/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/767228764785646423/F890985F1B31042E0BC10996930089A3A22BE5C5/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/767228764785647603/8F9ADBD1429C1AF247858C877548E15E5996F4A9/",      
      },
      leader = true,
      points = 22,
      restrictions = {
        include = {
          unit = {
            "Clone Trooper Infantry",          
          },        
        },      
      },
      type = "Squad Leader",
    },
    ["CLONE COMMANDER"] = {
      name = "Clone Commander",
      image = "https://steamusercontent-a.akamaihd.net/ugc/16325670012605150200/01E77403F827CE48BBD0262024C39AEF2465B64A/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809186354/387C36C2BB545E6CC882A05C0D81F5BE164166B7/",      
      },
      leader = true,
      points = 18,
      restrictions = {
        include = {
          type = {
            "Clone Trooper",          
          },        
        },      
      },
      type = "Squad Leader",
    },
    ["CLONE COMMANDER FOX"] = {
      name = "Clone Commander Fox",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384855342/35C7734C8DE780B2B4691B2A3CEF5B54BAF1A3E5/",
      points = 10,
      restrictions = {
        include = {
          faction = {
            "Republic",          
          },
          unit = {
            "LAAT/LE Patrol Transport",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["CLONE COMMS TECHNICIAN"] = {
      name = "Clone Comms Technician",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384855468/B256FB44C0E0DF5D2B60342F59729EA6EEBB6083/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809184812/3A020CF4B5983E1AF55F65A3F8F7BDCBAAEAAACC/",      
      },
      points = 11,
      restrictions = {
        include = {
          type = {
            "Clone Trooper",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["CLONE ENGINEER"] = {
      name = "Clone Engineer",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384855564/E53C360CCC3830546485BC14F01E69A310BB0C52/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809184624/F2826DD52329584D1C3B3795B0E55948EA96B467/",      
      },
      points = 14,
      restrictions = {
        include = {
          type = {
            "Clone Trooper",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["CLONE MEDIC"] = {
      name = "Clone Medic",
      image = "https://steamusercontent-a.akamaihd.net/ugc/9547979006347114303/D43781CC9968425F51916493FAA615ACDE207B6B/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809184711/BC2EE95F62E043F83A352F825B6A041AC6D59959/",      
      },
      points = 20,
      restrictions = {
        include = {
          type = {
            "Clone Trooper",          
          },        
        },      
      },
      type = "Squad Leader",
    },
    ["CLONE SHOCK TROOPER PILOT"] = {
      name = "Clone Shock Trooper Pilot",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10111085862146477057/252EF202515CC108E593111B56718C2CD813870E/",
      points = 4,
      restrictions = {
        include = {
          faction = {
            "Republic",          
          },
          rank = {
            "Heavy",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["CLONE SPECIALIST"] = {
      name = "Clone Specialist",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384855831/107356D4CB0FDB6846C160FABB30EA9F11555849/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/767228764785643001/070425BBB2F0D33E71693679EEB72FEF790FE2F6/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393180/6359B491483DCD9B2641BA134DC4B92DE10E9D92/",      
      },
      points = 17,
      restrictions = {
        include = {
          unit = {
            "Clone Trooper Infantry",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["CLONE TROOPER INFANTRY"] = {
      name = "Clone Trooper Infantry",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384855969/DA00EC34480B2F8CB09BA1DC4DEF82042BEFC378/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785236717873394019/F7EDA9D80C35FADA3C000A88C8105823172123B8/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393180/6359B491483DCD9B2641BA134DC4B92DE10E9D92/",      
      },
      points = 13,
      restrictions = {
        include = {
          unit = {
            "Clone Trooper Infantry",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["CLONE TROOPER INFANTRY SQUAD"] = {
      name = "Clone Trooper Infantry Squad",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384855888/62C735B9B10A0BFC907D21AB6B29EF4F484F2DD3/",
      minis = {
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393589/6AF627688F36D2049C1307BCB67A755FB27D51C5/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393180/6359B491483DCD9B2641BA134DC4B92DE10E9D92/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393727/8C4030EF9FEEB32E048567DC2EC38A1985E7C8C0/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393180/6359B491483DCD9B2641BA134DC4B92DE10E9D92/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785236717873457225/6382F0EA6E2DB0BC65921C3F4E5C97A84B422187/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393180/6359B491483DCD9B2641BA134DC4B92DE10E9D92/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393727/8C4030EF9FEEB32E048567DC2EC38A1985E7C8C0/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393180/6359B491483DCD9B2641BA134DC4B92DE10E9D92/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393589/6AF627688F36D2049C1307BCB67A755FB27D51C5/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393180/6359B491483DCD9B2641BA134DC4B92DE10E9D92/",
        },      
      },
      points = 56,
      restrictions = {
        include = {
          unit = {
            "Clone Trooper Infantry",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["COMMAND CONTROL ARRAY"] = {
      name = "Command Control Array",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13152173042783439846/9068A2E707EA6AD6B201273F43B7A275E41ED1C0/",
      points = 2,
      restrictions = {
        include = {
          unit = {
            "Vehicle",          
          },        
        },      
      },
      type = "Comms",
    },
    ["COMMANDING PRESENCE"] = {
      name = "Commanding Presence",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568139512/84EE686E19B56453386F3929C01D0B71687488E4/",
      points = 5,
      type = "Command",
    },
    ["COMMS JAMMER"] = {
      name = "Comms Jammer",
      image = "https://steamusercontent-a.akamaihd.net/ugc/12840451931503255129/4E1CDC738ACDB452A4AE50E7358EDAA2C95E191F/",
      points = 5,
      type = "Comms",
    },
    ["COMMS RELAY"] = {
      name = "Comms Relay",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568139607/B139A1D9FCCEDFCF0751B6E96A6FE774C312AB26/",
      points = 5,
      restrictions = {
        exclude = {
          type = {
            "Emplacement Trooper",          
          },        
        },      
      },
      type = "Comms",
    },
    ["CONCUSSION GRENADES"] = {
      name = "Concussion Grenades",
      image = "https://steamusercontent-a.akamaihd.net/ugc/14360371654209496022/CE2625348FFF9EF0BB5DC55F43ADBBD742F3073B/",
      points = 3,
      type = "Grenades",
    },
    ["CROSSHAIR"] = {
      name = "Crosshair",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134145124/0F6E5EBD2C22692BF7E757F46293934D4552CA6A/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2475370743175244300/863B36B154CA2A32E4C36B9CFBC47984846ECE3C/",      
      },
      points = 0,
      restrictions = {
        include = {
          faction = {
            "Republic",          
          },
          unit = {
            "The Bad Batch",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["DC-15 CLONE TROOPER"] = {
      name = "DC-15 Clone Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568139741/18705CF14C8BD2D88CF1827FE171F64D919E03C6/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393393/915E79CA7D72B0DA950656C69F104A7BB586C0E0/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393180/6359B491483DCD9B2641BA134DC4B92DE10E9D92/",      
      },
      points = 24,
      restrictions = {
        include = {
          unit = {
            "Clone Trooper Infantry",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["DC-15X ARC TROOPER"] = {
      name = "DC-15X ARC Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/9724672671096889082/B22903B590FA5B6D2AAEC2988AA0F9826C9D1EB2/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1009315641457800878/34EC84D7ECD99E073417866A9BEC4288E00F5359/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/773995200348530664/5E248091F8CC37B1023257338D4947E4ADFE48AB/",      
      },
      points = 37,
      restrictions = {
        include = {
          unit = {
            "ARC Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["DC-17M ICWS CONFIG"] = {
      name = "DC-17m ICWS Config",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135386003/EB0729A53546B70CB9054BAF5306E3F5368FC9DF/",
      type = "Armament",
      points = 0,
      restrictions = {
        include = {
          unit = {
            "Clone Commandos",
            "Clone Commandos Delta Squad",          
          },        
        },      
      },
      mini = undefined,
      flip = {
        name = "DC-17m ICWS Config",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135385953/007D0426E485963714BCBE0B74B2B8AE5B7F1869/",      
      },
    },
    ["DC-17M ICWS CONFIG"] = {
      name = "DC-17m ICWS Config",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135385953/007D0426E485963714BCBE0B74B2B8AE5B7F1869/",
      flip = {
        name = "DC-17m ICWS Config",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135386003/EB0729A53546B70CB9054BAF5306E3F5368FC9DF/",      
      },
      points = 0,
      restrictions = {
        include = {
          unit = {
            "Clone Commandos",
            "Clone Commandos Delta Squad",          
          },        
        },      
      },
      type = "Armament",
    },
    ["DH-447 SNIPER"] = {
      name = "DH-447 Sniper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140084953/59EB5B5BADDFEACF7BA997C247F16A54080A6E31/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780862776611/B8222AA4A3B680E969DC106C8A281D11845994EB/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780862776974/21649563BC0CB84E12C0B249C720919F528596D3/",      
      },
      points = 38,
      restrictions = {
        include = {
          unit = {
            "Rebel Commandos",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["DLT-19 STORMTROOPER"] = {
      name = "DLT-19 Stormtrooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140097118/D6AB525C9958181EA70DE91A813AEB1CC758D896/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141001/FF62545FC3DEF499BA8A0C04F07917C6CAA9E30D/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141746/A8FD77EB51C50C64CD924BDAEEDB70D8839E0EF3/",      
      },
      points = 20,
      restrictions = {
        include = {
          unit = {
            "Stormtroopers",
            "Stormtroopers Heavy Response Unit",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["DLT-19D TROOPER"] = {
      name = "DLT-19D Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140102975/2A200DF9EF1BF00105CC7BA834090DB6E0C4EA12/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/770610077943650040/CDB9EFD9CB36DE0EB5AB78B22F2B334BDB1E6DFE/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/770610077942938053/6187B2D6848EC35010DE6C3EEBB5DF6125D02D45/",      
      },
      points = 30,
      restrictions = {
        include = {
          unit = {
            "Imperial Death Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["DLT-19X SNIPER"] = {
      name = "DLT-19X Sniper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140103101/607C9BEDEB2C3780F1AE58D72DEE649F941A7CAD/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/770610077943667377/92306C3BFB675310563691C3C582BF5B9FC9ACD4/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/770610077943667167/66F3188269E49FE5DAD649E771D799F2593263FF/",      
      },
      points = 28,
      restrictions = {
        include = {
          unit = {
            "Scout Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["DLT-20A RANGE TROOPER"] = {
      name = "DLT-20A Range Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148698292/C6A146809D4BE1EBF289B7217AA7995C4828A731/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682669844/3306C99E1B2A23502CA35EEB63FC842EA7FB4E3A/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682582649/F03C73249983DDC1178314FD61C7D53DA27840EE/",      
      },
      points = 25,
      restrictions = {
        include = {
          unit = {
            "Range Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["DLT-20A TROOPER"] = {
      name = "DLT-20A Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140084961/0EDA0871D597B44A55DBF3A3147E3A13D20691B2/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/766102173464888456/63604C016242E6F545F139BC46515E0A894EC6B2/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/766102173464889098/17A7BE90F158B80F88518F92EA4D211F16E14003/",      
      },
      points = 26,
      restrictions = {
        include = {
          unit = {
            "Rebel Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["DP-23 CLONE TROOPER"] = {
      name = "DP-23 Clone Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384856148/B3CE3E857FAEC52F4048EB9D1BA8935682D6B9D1/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/767228764785625549/5461468E09D086E4CF7E835AE69D6F4226690518/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/767228764785620873/E3B1226B0836CF579F16C490896D5E2DE95C31F5/",      
      },
      points = 22,
      restrictions = {
        include = {
          unit = {
            "Clone Trooper Infantry",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["DT-F16"] = {
      name = "DT-F16",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140103189/0A3AA902AA4ADB644B1D83840A96AB041EDE5849/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/993513208355174615/DD0DA9DFDBCA621CF297C9A9EB2356279A733158/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/951848302305474695/F076E77D0278B10EAE330BC9073B05BC9A3BCD57/",      
      },
      leader = true,
      points = 15,
      restrictions = {
        include = {
          unit = {
            "Imperial Death Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["DW-3 GRENADE LAUNCHER"] = {
      name = "DW-3 Grenade Launcher",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148690988/9E08D059DB9C6A383AFD15329511C04A96215DA1/",
      points = 8,
      restrictions = {
        include = {
          unit = {
            "AT-ST",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["DEFENSE PROTOCOLS"] = {
      name = "Defense Protocols",
      image = "https://steamusercontent-a.akamaihd.net/ugc/16109346406166037874/376653EF5683F1DBF5DCDFF7742530E1C357FBAA/",
      points = 8,
      restrictions = {
        include = {
          type = {
            "Vehicle",          
          },        
        },      
      },
      type = "Programming",
    },
    ["DEFENSIVE STANCE"] = {
      name = "Defensive Stance",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10394379497446642242/A484E8DE817DC612497E99A36F6D33FBA8E423C9/",
      flip = {
        name = "Offensive Stance",
        image = "https://steamusercontent-a.akamaihd.net/ugc/16537339389726247952/720B5E7A361CEEC36F674F1CF36298A5997DE2F5/",      
      },
      points = 5,
      restrictions = {
        include = {
          slot = {
            "Force",          
          },        
        },      
      },
      type = "Training",
    },
    ["DEL MEEKO"] = {
      name = "Del Meeko",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140102888/C41E1C0AEAE95F66AE9D450E0EA233B169E5C9EC/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1618437692581074585/1C74BEB92DC42D3585BFC1185A77DE14EC3249CA/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/1618438238123043414/B7E9660E470DC070545782406C29F1E1356A5685/",      
      },
      points = 25,
      restrictions = {
        include = {
          faction = {
            "Empire",          
          },
          unit = {
            "Imperial Special Forces",          
          },
          rank = {
            "Corps",          
          },        
        },
        exclude = {
          unit = {
            "Stormtroopers Heavy Response Unit",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["DEVELOPING SYMPATHIES"] = {
      name = "Developing Sympathies",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1616219505080628668/E7A23D34D591C5EF876B320534798142C0A460EE/",
      points = 0,
      type = "Flaw",
    },
    ["DIN'S AMBAN RIFLE"] = {
      name = "Din's Amban Rifle",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148639183/C2D75F184A5F66EA154C4DF44AADA7A9443A9468/",
      points = 10,
      restrictions = {
        include = {
          unit = {
            "Din Djarin",          
          },        
        },      
      },
      type = "Armament",
    },
    ["DIN'S FLAME PROJECTOR"] = {
      name = "Din's Flame Projector",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13750229648005754282/BBA7B66BB64E77DD6485518A99475DE0DC684BE8/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "Din Djarin",          
          },        
        },      
      },
      type = "Gear",
    },
    ["DIN'S JETPACK"] = {
      name = "Din's Jetpack",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148639132/7B4DCC45594881429C69D3D0AB70CEDF61F543B4/",
      points = 15,
      restrictions = {
        include = {
          unit = {
            "Din Djarin",          
          },        
        },      
      },
      type = "Gear",
    },
    ["DIOXIS MINE SABOTEUR"] = {
      name = "Dioxis Mine Saboteur",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139927460/BE9022FA696C172E68110895A9DDCDDD635E2AB3/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1009315641457847567/079157D001A1520085C6A30620750817C6C01BFF/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/773995528924546789/8774CBBDC3C4F18B11A444CC96EA5FE7F00DB48F/",      
      },
      points = 28,
      restrictions = {
        include = {
          unit = {
            "BX-Series Droid Commandos",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["DOOR GUNNERS"] = {
      name = "Door Gunners",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10380945357802391916/5D21C9620D0382828965E9FA8E1534BF067A4E7A/",
      points = 12,
      type = "Crew",
    },
    ["DUCK AND COVER"] = {
      name = "Duck And Cover",
      image = "https://steamusercontent-a.akamaihd.net/ugc/15529355718365557412/FFC51C64FA7773BCC25038D8D5D818D2AE5241BC/",
      points = 2,
      type = "Training",
    },
    ["DUG IN"] = {
      name = "Dug In",
      image = "https://steamusercontent-a.akamaihd.net/ugc/18249790041400631546/5B8E5A40CBC42DE4BE8A26F1576E8F8AD4690C12/",
      points = 6,
      type = "Training",
    },
    ["E-11D FOCUSED FIRE CONFIG"] = {
      name = "E-11D Focused Fire Config",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140103278/AC9A32D518E9E70AF6ABBA41F7E10DF58DADFF20/",
      flip = {
        name = "E-11D Grenade Launcher Config",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140103366/FB39C5636706702276566978A5EDD34907C1D8DB/",      
      },
      points = 0,
      restrictions = {
        include = {
          unit = {
            "Imperial Death Troopers",          
          },        
        },      
      },
      type = "Armament",
    },
    ["E-11D GRENADE LAUNCHER CONFIG"] = {
      name = "E-11D Grenade Launcher Config",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140103366/FB39C5636706702276566978A5EDD34907C1D8DB/",
      type = "Armament",
      points = 0,
      restrictions = {
        include = {
          unit = {
            "Imperial Death Troopers",          
          },        
        },      
      },
      mini = undefined,
      flip = {
        name = "E-11D Focused Fire Config",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140103278/AC9A32D518E9E70AF6ABBA41F7E10DF58DADFF20/",      
      },
    },
    ["E-5C B1 BATTLE DROID"] = {
      name = "E-5C B1 Battle Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139927471/01EFFA28B26ABFA90DE16CEEF694EBB083EB1F20/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780871782781/4DCE4780DE1CCDFB2996C28200A26C3B0696DD5A/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780871782881/ADC1DBC3987C84AF486F9CD0E19A0455F4C33291/",      
      },
      points = 16,
      restrictions = {
        include = {
          unit = {
            "B1 Battle Droids",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["E-5S B1 BATTLE DROID"] = {
      name = "E-5S B1 Battle Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139931066/BDF09AC95FA4C63AC25459B1636B8F0E6F0D7AFC/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/766102422959434489/60F05B7FC8544DFC640CB33DA55F19EB5F2CB55A/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/766102422959428835/10D3F8862BDECE8C0D7A874CC000F25CD6232168/",      
      },
      points = 18,
      restrictions = {
        include = {
          unit = {
            "B1 Battle Droids",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["E-60R B1 BATTLE DROID"] = {
      name = "E-60R B1 Battle Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139931091/2EF91BFA17C138987CC997C6A359AC948DB2D3BA/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780871782500/34D317CFE0BE32E4FFFB84567822CDF7AC4D4C98/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780871782620/9A9EA2B54691F42EA6D34762D33D523A836201B2/",      
      },
      points = 18,
      restrictions = {
        include = {
          unit = {
            "B1 Battle Droids",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["EMP \"DROID POPPERS\""] = {
      name = "EMP \"Droid Poppers\"",
      image = "https://steamusercontent-a.akamaihd.net/ugc/16979329673403509645/1A03673B650864D15B2500B83248522FFBABB2FB/",
      points = 3,
      type = "Grenades",
    },
    ["EV-SERIES MEDICAL DROID"] = {
      name = "EV-Series Medical Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139931203/4E82B1CC654C69E194324C5EF25525BD01BBA09A/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/1683750364035000354/6248E4CAF3E978154106E7095E6984DCE6677CCA/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/1683750364035001447/E6B6EC2DDAE8CEA46A1384161E789D76F8F296BA/",      
      },
      points = 14,
      restrictions = {
        include = {
          type = {
            "Droid Trooper",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["ECHO, ARC MARKSMAN"] = {
      name = "Echo, ARC Marksman",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139963016/7EFE284DE80081B2F8F535F53CB84469E2E2B1EF/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1009315641457801321/CED1CD80F307683E79B9A4ED87CECAED7C070EBF/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/773995200348530664/5E248091F8CC37B1023257338D4947E4ADFE48AB/",      
      },
      leader = true,
      points = 52,
      restrictions = {
        include = {
          faction = {
            "Republic",          
          },
          type = {
            "Clone Trooper",          
          },
          rank = {
            "Corps",
            "Special Forces",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["ECHO, CLONE FORCE 99"] = {
      name = "Echo, Clone Force 99",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139963062/CC0A09363EDC2A36A670D71ABCFA34048B44B32F/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2475370743175243825/0B07462AB1D02ACB64262C1E875E9DC5E3719850/",      
      },
      points = 0,
      restrictions = {
        include = {
          unit = {
            "The Bad Batch",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["ELECTRO GAUNTLETS"] = {
      name = "Electro Gauntlets",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148639059/89380FD599DD6819950BB21C5F940A9074C34A51/",
      points = 10,
      restrictions = {
        include = {
          unit = {
            "Cad Bane",          
          },        
        },      
      },
      type = "Armament",
    },
    ["ELECTRO GRAPPLING LINE"] = {
      name = "Electro Grappling Line",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140085250/238DDAD4ECD0F3A7307D08D40ABBA0A0529375F3/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "Sabine Wren",          
          },        
        },      
      },
      type = "Gear",
    },
    ["ELECTRO-WHIP MAGNAGUARD"] = {
      name = "Electro-Whip MagnaGuard",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139931140/87A4E668E6141DCF96DD8090761177033DDDD43C/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1621849308236386662/7ABB72B5A8A301611033E4A424FD61271024FB4C/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/1621849538641208262/A0E48F7D9C94617C81BAD4D649717BAC7A8B9B64/",      
      },
      points = 28,
      restrictions = {
        include = {
          unit = {
            "IG-100 MagnaGuard",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["ELECTRO-WHIP SOLDIER"] = {
      name = "Electro-Whip Soldier",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148639043/A6DFE4AD6FFFB452A302B6731A9F7667F7A0667E/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845513/BB3CD9624D6F43250D0406D099819E497A1A70BE/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",      
      },
      points = 10,
      restrictions = {
        include = {
          unit = {
            "Pyke Syndicate Foot Soldiers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["ELECTROBINOCULARS"] = {
      name = "Electrobinoculars",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10199441544306107703/133B792AACF4901AEA9F35EC0F8C2D7B17DA7866/",
      points = 8,
      restrictions = {
        override = {
          unit = {
            "B1 Battle Droids",          
          },        
        },      
      },
      type = "Gear",
    },
    ["ELECTROSTAFF GUARD"] = {
      name = "Electrostaff Guard",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568140779/14B23EE6749131636CF1A9D1507192F6870A32A1/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541912278/DC9D78CD5742236F9F272AC1F8AA1D59D07CF5A9/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541912060/182C0DD6D66EC8DEF075135B872DE26364010E27/",      
      },
      points = 21,
      restrictions = {
        include = {
          unit = {
            "Imperial Royal Guards",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["EMERGENCY STIMS"] = {
      name = "Emergency Stims",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13446832343829634893/9CF7AF6D397F06FB0D1A7205ED6139829D6F6E92/",
      points = 8,
      type = "Gear",
    },
    ["EMERGENCY TRANSPONDER"] = {
      name = "Emergency Transponder",
      image = "https://steamusercontent-a.akamaihd.net/ugc/9908400255536413440/38A6CDC80C3D7D0A2F9A9903EC1E0651380D8526/",
      points = 4,
      type = "Comms",
    },
    ["ENDURANCE"] = {
      name = "Endurance",
      image = "https://steamusercontent-a.akamaihd.net/ugc/9415595468930295182/7ACC3ED6894ECD1FDED41AC058BF318868605636/",
      points = 6,
      type = "Training",
    },
    ["ENGAGEMENT PROTOCOLS"] = {
      name = "Engagement Protocols",
      image = "https://steamusercontent-a.akamaihd.net/ugc/12618446894076894989/F2992658DAEDCD5F593270F3CF14EABFCD95019F/",
      points = 3,
      restrictions = {
        include = {
          type = {
            "Vehicle",          
          },        
        },      
      },
      type = "Programming",
    },
    ["ENVIRONMENTAL GEAR"] = {
      name = "Environmental Gear",
      image = "https://steamusercontent-a.akamaihd.net/ugc/16652798721637422056/91F7C8F27389BFDA9D9136B527122F23530B8501/",
      points = 2,
      type = "Gear",
    },
    ["ESTEEMED LEADER"] = {
      name = "Esteemed Leader",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568140964/439066821E561B2D148F432E1382CCE7E89C4195/",
      points = 5,
      type = "Command",
    },
    ["EWOK SKIRMISHER SQUAD"] = {
      name = "Ewok Skirmisher Squad",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384856338/3857B7DC883DF754409E8F4262459CC574DE5630/",
      minis = {
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129196/6EED0C8AAF8F50751EE4206471D1273B6C0F4B5A/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
        },
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129252/FC0A6247B6AB21A99919659C1F9069186C6D82ED/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
        },
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128356/9E8C70962F9D5BF853BD9310F2BB1E1A3F80DB5D/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
        },
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128445/EBB56734DB6527B3566C317F6F4F0E84471D6776/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
        },      
      },
      points = 28,
      restrictions = {
        include = {
          unit = {
            "Ewok Skirmishers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["EWOK SLINGER SQUAD"] = {
      name = "Ewok Slinger Squad",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384856396/086DF1555A9EC9B78C10A72F1154F9954670E9FA/",
      minis = {
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128565/24D88975D67E46B5FA9294EB6DCC146912D61F2F/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
        },
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128627/19AC5B05F3A355226EE783B9F239B3B285EA077A/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
        },
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128715/CB52DA6C0FC1DF3511C2A2D62CB2B3A13A9D4F8F/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
        },
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128778/1D5BCB551375F1A7988C434F0B52E18434BB4747/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",
        },      
      },
      points = 23,
      restrictions = {
        include = {
          unit = {
            "Ewok Slingers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["EWOK TRAPPER"] = {
      name = "Ewok Trapper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140103150/0A2C3B844131196AFD07DAEF9FE79F2CA1563234/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867128844/558E1277513B0AF48911A68B5FAAB981BC0A56A1/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867129049/686925E47D218727E1C79A25E0F44FC80FAEE43F/",      
      },
      points = 10,
      restrictions = {
        include = {
          unit = {
            "Ewok Skirmishers",
            "Ewok Slingers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["EXTRA SUPPLIES"] = {
      name = "Extra Supplies",
      image = "https://steamusercontent-a.akamaihd.net/ugc/15887924979159088662/7496D40446701B499092859A5230230BD24B51C4/",
      points = 5,
      type = "Gear",
    },
    ["FX-9 MEDICAL DROID"] = {
      name = "FX-9 Medical Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140097235/1B7C3623EF5EA7A2F7AB4123AF617CA73B851E05/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/949599512594268065/7B4874981CECB7BB80D5BC54F60F1939B9A9DAB1/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/949599512594268174/00246DE6DCE285206330C43B8049B19FFDF5BB41/",      
      },
      points = 19,
      restrictions = {
        include = {
          faction = {
            "Empire",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["FEAR"] = {
      name = "Fear",
      image = "https://steamusercontent-a.akamaihd.net/ugc/9673306764281530635/A29BF04A277C5491400B32B97D8FEA512722A7B3/",
      points = 3,
      restrictions = {
        include = {
          alignment = {
            "Dark",          
          },        
        },      
      },
      type = "Force",
    },
    ["FIRST SERGEANT ARBMAB"] = {
      name = "First Sergeant Arbmab",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148691104/395E3C391D3513EC8CCD4D6220372B8793EAA936/",
      points = 5,
      restrictions = {
        include = {
          faction = {
            "Empire",          
          },
          type = {
            "Ground Vehicle",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["FIVES"] = {
      name = "Fives",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384856467/9C8FFFD42DF5BCF0EE31E9CA9DABFE1B68235EE6/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1009315641457802221/506D704E232C1BFD85F063A24EBF24C5914C2C40/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/773995200348530664/5E248091F8CC37B1023257338D4947E4ADFE48AB/",      
      },
      leader = true,
      points = 40,
      restrictions = {
        include = {
          type = {
            "Clone Trooper",          
          },        
        },      
      },
      type = "Squad Leader",
    },
    ["FLAMETROOPER"] = {
      name = "Flametrooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140097285/FCD736B27C338F603E13D0B1FA8FA3E10D1CE1FA/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801931/BDE907EBE0BFC0DC4180C76AFEA3F8667013FF3B/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541802054/044AD0961CD1485A61AC3B6CB3669FD8AA5A0FEB/",      
      },
      points = 20,
      restrictions = {
        include = {
          unit = {
            "Snowtroopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["FLEET TROOPER"] = {
      name = "Fleet Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568141213/9844C89F6EFB3043914F0E7CA54F6089F46F7C5A/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670863/20FE73C6E9F8468BD468C820C88EAB9F697EC33E/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670760/47DF3E87B3F71E8EA42A89ECFE96E4FB3990D7ED/",      
      },
      points = 7,
      restrictions = {
        include = {
          unit = {
            "Fleet Troopers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["FLEET TROOPER SQUAD"] = {
      name = "Fleet Trooper Squad",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384856618/9DED8502636167A62F6D2AEEE5AE8B004D61F3CF/",
      minis = {
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670667/CB316B23D59F28C5EF22E94A43280D49DFFDD6AC/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670760/47DF3E87B3F71E8EA42A89ECFE96E4FB3990D7ED/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540540671182/A605D9D0DB356DC71473F5C9DF27DE1CADB4F320/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540540671278/9B94D359A61113F72EEB0435D70A1291431D737A/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670978/0642E99CB4E8CABA1AA10389F2387A1C70D9322D/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670760/47DF3E87B3F71E8EA42A89ECFE96E4FB3990D7ED/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540540671182/A605D9D0DB356DC71473F5C9DF27DE1CADB4F320/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540540671278/9B94D359A61113F72EEB0435D70A1291431D737A/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670978/0642E99CB4E8CABA1AA10389F2387A1C70D9322D/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670760/47DF3E87B3F71E8EA42A89ECFE96E4FB3990D7ED/",
        },      
      },
      points = 45,
      restrictions = {
        include = {
          unit = {
            "Fleet Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["FORCE BARRIER"] = {
      name = "Force Barrier",
      image = "https://steamusercontent-a.akamaihd.net/ugc/15143817809089088858/42064C6532794B58C1E96FF46E84ACE559FEC283/",
      points = 10,
      type = "Force",
    },
    ["FORCE CHOKE"] = {
      name = "Force Choke",
      image = "https://steamusercontent-a.akamaihd.net/ugc/14947659096167109315/5A48D7B33D304D35557DCC61D91BC6685583C78A/",
      points = 10,
      restrictions = {
        include = {
          alignment = {
            "Dark",          
          },        
        },      
      },
      type = "Force",
    },
    ["FORCE GUIDANCE"] = {
      name = "Force Guidance",
      image = "https://steamusercontent-a.akamaihd.net/ugc/17502599399888225537/5BCB94ABA69828E206589A9494A69496CD9BE1D9/",
      points = 5,
      type = "Force",
    },
    ["FORCE LIFT"] = {
      name = "Force Lift",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568226237/8E8024D98127B2963C56671A8BE0DCE41E487350/",
      points = 5,
      additionalObjects = {
        "Barricade",      
      },
      type = "Force",
    },
    ["FORCE PIKE WARRIOR"] = {
      name = "Force Pike Warrior",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139931290/4D91F65FD4C56E472083227DF40A98D978735E4B/",
      type = "Heavy Weapon",
      points = 15,
      restrictions = {
        include = {
          unit = {
            "Geonosian Warriors",          
          },        
        },      
      },
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177195807/C1E3DCF8DC0772F56B22E42E89DECC9F30110E8D/",      
      },
      flip = {
        name = "Force Pike Warrior",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139984742/4CBAEA0926D770481377C8C3556D0F4F55D403F4/",      
      },
    },
    ["FORCE PIKE WARRIOR"] = {
      name = "Force Pike Warrior",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139984742/4CBAEA0926D770481377C8C3556D0F4F55D403F4/",
      flip = {
        name = "Force Pike Warrior",
        image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139931290/4D91F65FD4C56E472083227DF40A98D978735E4B/",      
      },
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177195807/C1E3DCF8DC0772F56B22E42E89DECC9F30110E8D/",      
      },
      points = 15,
      restrictions = {
        include = {
          unit = {
            "Geonosian Warriors",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["FORCE PUSH"] = {
      name = "Force Push",
      image = "https://steamusercontent-a.akamaihd.net/ugc/15906597476264837051/ED34165894E2D37CF5194D7FDD51ADA7B3ED0596/",
      points = 10,
      type = "Force",
    },
    ["FORCE REFLEXES"] = {
      name = "Force Reflexes",
      image = "https://steamusercontent-a.akamaihd.net/ugc/16096715596179885171/664DA23B337498B297143163C2B92A87EF60F515/",
      points = 5,
      type = "Force",
    },
    ["FOREST DWELLERS"] = {
      name = "Forest Dwellers",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140100329/4F2A45ECABD3B325A456366332FF93683D6AA296/",
      points = 3,
      restrictions = {
        include = {
          unit = {
            "Ewok Slingers",
            "Ewok Skirmishers",
            "Wicket",
            "Logray",          
          },        
        },      
      },
      type = "Training",
    },
    ["FRAGMENTATION GRENADES"] = {
      name = "Fragmentation Grenades",
      image = "https://steamusercontent-a.akamaihd.net/ugc/17481227970231967061/040B13006EEBC5098CD852141C001CCE30B9A7F8/",
      points = 5,
      type = "Grenades",
    },
    ["FRENZIED GUNNER"] = {
      name = "Frenzied Gunner",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638994/BB7B0FF17AF90112CFE43A75F5762598858400DB/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "A-A5 Speeder Truck",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["GENERAL WEISS"] = {
      name = "General Weiss",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148691201/0F949459DDCA1EAFC03EC7145C7402A636C9C4BE/",
      points = 5,
      restrictions = {
        include = {
          faction = {
            "Empire",          
          },
          type = {
            "Ground Vehicle",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["GEONOSIAN WARRIOR"] = {
      name = "Geonosian Warrior",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139931935/2F3CADBA40F493D24A6AB5146FFF64A612C2398B/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177201933/E0DBF0D812FFF4F7F3A77CF1E4EAB84F78B8C49E/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177195881/84020A8311904050DC9309FE9109D47BC41FE4AA/",      
      },
      points = 11,
      restrictions = {
        include = {
          unit = {
            "Geonosian Warriors",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["GEONOSIAN WARRIOR SQUAD"] = {
      name = "Geonosian Warrior Squad",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139931345/26339BC464EC1009F100CC1BACFDC3F726B3CD27/",
      minis = {
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177201554/7AEA5B0A98A298731F6BE51591401BBF095A5797/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177195881/84020A8311904050DC9309FE9109D47BC41FE4AA/",
        },
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177201933/E0DBF0D812FFF4F7F3A77CF1E4EAB84F78B8C49E/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177195881/84020A8311904050DC9309FE9109D47BC41FE4AA/",
        },
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177202012/76CB0371503304D5AAF562E5E2F04961CD206090/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177195881/84020A8311904050DC9309FE9109D47BC41FE4AA/",
        },
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177201933/E0DBF0D812FFF4F7F3A77CF1E4EAB84F78B8C49E/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177195881/84020A8311904050DC9309FE9109D47BC41FE4AA/",
        },
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177202012/76CB0371503304D5AAF562E5E2F04961CD206090/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177195881/84020A8311904050DC9309FE9109D47BC41FE4AA/",
        },      
      },
      points = 51,
      restrictions = {
        include = {
          unit = {
            "Geonosian Warriors",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["GIDEON HASK"] = {
      name = "Gideon Hask",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140103438/D7D66F0CFEFC2658BF2FDB33899D5888448353F0/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1618437692581075349/6265F81E1BAA090FFA813270A8E3126CF8AD6CC5/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/1618438238123043414/B7E9660E470DC070545782406C29F1E1356A5685/",      
      },
      leader = true,
      points = 29,
      restrictions = {
        include = {
          faction = {
            "Empire",          
          },
          unit = {
            "Imperial Special Forces",          
          },
          rank = {
            "Corps",          
          },        
        },
        exclude = {
          unit = {
            "Stormtroopers Heavy Response Unit",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["GNASP BOMBARDIER"] = {
      name = "Gnasp Bombardier",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135343165/A3E8D964A08B453B9E015137A07E33D8387D1A64/",
      points = 20,
      restrictions = {
        include = {
          unit = {
            "Raddaugh Gnasp Fluttercraft",          
          },        
        },      
      },
      type = "Crew",
    },
    ["GNASP GUNNER"] = {
      name = "Gnasp Gunner",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135343200/DEFBD83A9EBBA99252AC71556D2B37557BF9B36B/",
      points = 15,
      restrictions = {
        include = {
          unit = {
            "Raddaugh Gnasp Fluttercraft",          
          },        
        },      
      },
      type = "Crew",
    },
    ["GOVERNOR PRYCE"] = {
      name = "Governor Pryce",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148691269/0E980DEE7A89F49805E303D9A4BD5D4CF4CC2CA5/",
      points = 5,
      restrictions = {
        include = {
          faction = {
            "Empire",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["GRAPPLING HOOKS"] = {
      name = "Grappling Hooks",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13745066816000738957/3B66D6274F0A9783C51378EF3C318D3DF82A2514/",
      points = 2,
      type = "Gear",
    },
    ["GROGU"] = {
      name = "Grogu",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10193011638909819730/8D53047BE6DF276528CA0FD2BB8283DF4AAD1377/",
      points = 17,
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1785135165610974498/47B1C8B92A0E945388F7773EAB2F73B0A81E761E/",      
      },
      restrictions = {
        include = {
          unit = {
            "Din Djarin",          
          },        
        },      
      },
      type = "Counterpart",
    },
    ["HH-12 STORMTROOPER"] = {
      name = "HH-12 Stormtrooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140097369/5299C4869B939C8673F1B0BD1A28398C4287BFF9/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141088/7342269A721DF49D0C38F1469E8463093734EF66/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141746/A8FD77EB51C50C64CD924BDAEEDB70D8839E0EF3/",      
      },
      points = 22,
      restrictions = {
        include = {
          unit = {
            "Stormtroopers",
            "Stormtroopers Heavy Response Unit",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["HQ UPLINK"] = {
      name = "HQ Uplink",
      image = "https://steamusercontent-a.akamaihd.net/ugc/12685640959616769169/065354E9812F61C36C60B9EFD08829CD70C51487/",
      points = 10,
      type = "Comms",
    },
    ["HACKED COMMS UNIT"] = {
      name = "Hacked Comms Unit",
      image = "https://steamusercontent-a.akamaihd.net/ugc/16875746628328702203/66EFD3995E6C5DDB8B687B86323884DFA50E767D/",
      points = 5,
      type = "Comms",
    },
    ["HEAVY AQUA DROID"] = {
      name = "Heavy Aqua Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1794100632571533/28837AF9D4578A64FDDBF1A1FBCF01B1B500C263/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/16428277771267782/F0A018E16296CA10D0E02E7F41DE82CE5E989B23/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/16428277771267882/F4CCED2C7C26C390BC2CA20D1BA1DAA27340FE57/",      
      },
      points = 28,
      restrictions = {
        include = {
          unit = {
            "Aqua Droids",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["HEAVY LASER CANNON"] = {
      name = "Heavy Laser Cannon",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2491139050708063813/02A958048D55355C0A3FECAADB08B690785AE4FF/",
      points = 10,
      restrictions = {
        include = {
          unit = {
            "LM-432 Crab Droid",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["HEAVY LASER RETROFIT"] = {
      name = "Heavy Laser Retrofit",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140085434/9779C6885402FF554F2CB4DEEDADEE725DE3C1A7/",
      points = 12,
      restrictions = {
        include = {
          unit = {
            "A-A5 Speeder Truck",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["HERBAL MEDICINE"] = {
      name = "Herbal Medicine",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140105386/419AA1B3264BA3ACD8243358E80630E91B11DBC9/",
      points = 10,
      restrictions = {
        include = {
          unit = {
            "Logray",          
          },        
        },      
      },
      type = "Training",
    },
    ["HIGH-ENERGY SHELLS"] = {
      name = "High-Energy Shells",
      image = "https://steamusercontent-a.akamaihd.net/ugc/17302862727198256496/5D94931ED170BE02B13FBA03D1F5894CF5FEF237/",
      points = 8,
      type = "Ordnance",
    },
    ["HOPE"] = {
      name = "Hope",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10760287538524062730/28C02EF23C693E082481D9AC02407542CDD79CC6/",
      points = 3,
      restrictions = {
        include = {
          alignment = {
            "Light",          
          },        
        },      
      },
      type = "Force",
    },
    ["HOTSHOT PILOT"] = {
      name = "Hotshot Pilot",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140085473/EFDD0076A93ED598B0D58CD718A765B2A56AE228/",
      points = 8,
      restrictions = {
        include = {
          faction = {
            "Rebel",          
          },
          type = {
            "Repulsor Vehicle",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["HOUND & GRIZZER"] = {
      name = "Hound & Grizzer",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13575491821704896451/EDE4AFDD9E9AEC222C4B8F7C91F124B3F32B8A73/",
      points = 8,
      restrictions = {
        include = {
          faction = {
            "Republic",          
          },
          unit = {
            "LAAT/LE Patrol Transport",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["HUNTER"] = {
      name = "Hunter",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134145162/59CF94272440AA250AFA7883ADC169BA9F1EDBEF/",
      leader = true,
      points = 0,
      restrictions = {
        include = {
          unit = {
            "The Bad Batch",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["I'VE ALTERED THE DEAL"] = {
      name = "I've Altered The Deal",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1616219505080628591/9F5E8A23795A68A3AA5FE82B933F4BDA78084207/",
      points = 0,
      type = "Flaw",
    },
    ["IG-100 MAGNAGUARD"] = {
      name = "IG-100 MagnaGuard",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139931971/525A56FA820F4B27F1C1E46AAA5ED5FA8AA86EB5/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1621849308236386555/F47418A458CF12C80756A80B842817EA1CCC62CF/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/1621849538641208262/A0E48F7D9C94617C81BAD4D649717BAC7A8B9B64/",      
      },
      points = 22,
      restrictions = {
        include = {
          unit = {
            "IG-100 MagnaGuard",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["IDEN'S DLT-20A RIFLE"] = {
      name = "Iden's DLT-20A Rifle",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568142679/5583B4B2E96BA55F3A4D2DE46EBF31B130AAA757/",
      points = 15,
      restrictions = {
        include = {
          unit = {
            "Iden Versio",          
          },        
        },      
      },
      type = "Armament",
    },
    ["IDEN'S ID10 SEEKER DROID"] = {
      name = "Iden's ID10 Seeker Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135447894/8F1310249DB7B03175CFEEE485B966D2E228C623/",
      points = 15,
      mini = {
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/770611889399999868/37F150131345FF1F47592A96239395A583AAE5EA/",
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/773996263557020821/1E2319EBFD85D7748450F40689A1315696052EFC/",      
      },
      restrictions = {
        include = {
          unit = {
            "Iden Versio",          
          },        
        },      
      },
      type = "Counterpart",
    },
    ["IDEN'S TL-50 REPEATER"] = {
      name = "Iden's TL-50 Repeater",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568142734/E13169C3DF9153C7196A29DB82578DE1FD659F6D/",
      points = 15,
      restrictions = {
        include = {
          unit = {
            "Iden Versio",          
          },        
        },      
      },
      type = "Armament",
    },
    ["IMPACT GRENADES"] = {
      name = "Impact Grenades",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13262048397259590169/3F4068C180970A83C3676C515AADEDC561B243CA/",
      points = 3,
      type = "Grenades",
    },
    ["IMPERIAL COMMS TECHNICIAN"] = {
      name = "Imperial Comms Technician",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140097427/A759E82138BD75F9641E42316D314BCA9D70CF33/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/949599512594268417/62CC1D5BCBD1EE294C72781B03AB972B3ED5AD12/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/949599512594268526/CA2596C0B2D7DF68D794B2A7880F34B5459F1206/",      
      },
      points = 10,
      restrictions = {
        include = {
          faction = {
            "Empire",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["IMPERIAL DARK TROOPER"] = {
      name = "Imperial Dark Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148691379/518F04086F72215062FDD24016FE412B7F0F9106/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1785135125810942938/E77EC5970DA310A2E1D96F796E98D82813AE0891/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2004698291313176203/E77892ADB668EA0CB548F6ED71BE44CA3FB730E7/",      
      },
      points = 32,
      restrictions = {
        include = {
          unit = {
            "Imperial Dark Troopers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["IMPERIAL HAMMERS ELITE ARMOR PILOT"] = {
      name = "Imperial Hammers Elite Armor Pilot",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148691474/7EFEFFFDE5EF5899C5E3F3F06C855D794B67E7F7/",
      points = 10,
      restrictions = {
        include = {
          faction = {
            "Empire",          
          },
          type = {
            "Ground Vehicle",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["IMPERIAL MARCH"] = {
      name = "Imperial March",
      image = "https://steamusercontent-a.akamaihd.net/ugc/14337942722120063044/BA09967A3C8A7F4E5A38815E4C7812EB00DA3B3D/",
      points = 6,
      restrictions = {
        include = {
          rank = {
            "Corps",          
          },
          faction = {
            "Empire",          
          },        
        },      
      },
      type = "Training",
    },
    ["IMPERIAL OFFICER"] = {
      name = "Imperial Officer",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140097483/145E74D65EDF1283F5CD01FA06655B2974624922/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541565898/F06AB6731446249164D34ACA208E4FAE70C6FE00/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541566011/A7A84EBF79DA5E1D5BCE71E863FC16EC40937F6F/",      
      },
      leader = true,
      points = 17,
      restrictions = {
        include = {
          faction = {
            "Empire",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["IMPERIAL TIE PILOT"] = {
      name = "Imperial TIE Pilot",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148691580/FB3F0FA888AD2792554DBEBC95A8509790A299BD/",
      points = 8,
      restrictions = {
        include = {
          faction = {
            "Empire",          
          },
          type = {
            "Repulsor Vehicle",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["IMPROVISED ORDERS"] = {
      name = "Improvised Orders",
      image = "https://steamusercontent-a.akamaihd.net/ugc/9869682046426627943/152512DE2EE5592159A7D5A4E9BB7111A0C729B5/",
      points = 5,
      type = "Command",
    },
    ["INQUISITORIUS TRAINING"] = {
      name = "Inquisitorius Training",
      image = "https://steamusercontent-a.akamaihd.net/ugc/16029402244249243117/D61B7E9D4163D96847488E7EA80B3C6A60672238/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "Fifth Brother",
            "Seventh Sister",          
          },        
        },      
      },
      type = "Training",
    },
    ["INSATIABLE CURIOSITY"] = {
      name = "Insatiable Curiosity",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140100414/E3E6C5563CD533DC0560C50590B8A989E382E7BC/",
      points = 8,
      restrictions = {
        include = {
          unit = {
            "Ewok Skirmishers",
            "Ewok Slingers",          
          },        
        },      
      },
      type = "Training",
    },
    ["INSPIRING PRESENCE"] = {
      name = "Inspiring Presence",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13424493991629241458/67E4A2FA7A3C475FC2936C5029591460B190FC1F/",
      points = 5,
      type = "Command",
    },
    ["INTEGRATED COMMS ANTENNA"] = {
      name = "Integrated Comms Antenna",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568143206/40A5FABD690D6741D18996F7896AF1AC8931EA56/",
      points = 3,
      restrictions = {
        include = {
          type = {
            "Droid Trooper",          
          },        
        },      
      },
      type = "Comms",
    },
    ["INTO THE FRAY"] = {
      name = "Into The Fray",
      image = "https://steamusercontent-a.akamaihd.net/ugc/14109187506581343144/00287D0E98E6349774A91B470804179CCBFE529E/",
      points = 4,
      type = "Training",
    },
    ["J-19 BO-RIFLE BLASTER"] = {
      name = "J-19 Bo-Rifle Blaster",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568143236/93E8E40BBA0157ACB1CC8492BFB7BCB58913BF28/",
      flip = {
        name = "J-19 Bo-Rifle Staff",
        image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568143309/544D8E7915CDDF661A0F75AD56BD3C4AF023108F/",      
      },
      points = 5,
      restrictions = {
        include = {
          unit = {
            "Agent Kallus",          
          },        
        },      
      },
      type = "Armament",
    },
    ["J-19 BO-RIFLE STAFF"] = {
      name = "J-19 Bo-Rifle Staff",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568143309/544D8E7915CDDF661A0F75AD56BD3C4AF023108F/",
      type = "Armament",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "Agent Kallus",          
          },        
        },      
      },
      mini = undefined,
      flip = {
        name = "J-19 Bo-Rifle Blaster",
        image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568143236/93E8E40BBA0157ACB1CC8492BFB7BCB58913BF28/",      
      },
    },
    ["JEDI GUARDIAN"] = {
      name = "Jedi Guardian",
      image = "https://steamusercontent-a.akamaihd.net/ugc/11522429422550427771/2AE47A46390BAC96C6EAE879130F4F01D738E37D/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/16426912929621400/CC4D94EDC24D933D7333F5A35308606846A9B550/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/16426912929621469/4B200440B54994D37A5B3667E04769CD92DE4F32/",      
      },
      points = 22,
      leader = true,
      restrictions = {
        include = {
          faction = {
            "Republic",          
          },        
        },      
      },
      type = "Squad Leader",
    },
    ["JEDI MIND TRICK"] = {
      name = "Jedi Mind Trick",
      image = "https://steamusercontent-a.akamaihd.net/ugc/16576180526883700218/91A8C17FBF0B3D84BC8ED5CB727BABB1AB69790A/",
      points = 5,
      restrictions = {
        include = {
          alignment = {
            "Light",          
          },        
        },      
      },
      type = "Force",
    },
    ["JETPACK ROCKETS"] = {
      name = "Jetpack Rockets",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140085567/31DBF8DD50EC6DAC02522908B9E8D0D3B2A37925/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "Mandalorian Resistance",          
          },        
        },      
      },
      type = "Armament",
    },
    ["JYN'S SE-14 BLASTER"] = {
      name = "Jyn's SE-14 Blaster",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140086376/D2D709BDACCC6415CBC5786450D1BFDFBDF34ED9/",
      points = 10,
      restrictions = {
        include = {
          unit = {
            "Jyn Erso",
            "K-2SO",          
          },        
        },      
      },
      type = "Armament",
    },
    ["KX-SERIES SECURITY DROIDS"] = {
      name = "KX-Series Security Droids",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140176950/CCE38141C12BFD65899FE18BF929C8BF0E2E1C57/",
      minis = {
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/773996263557000439/C9EA2A27264C73E42C016FE26E665CBB75F8E7DE/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/770611701143471855/26BE70BB475D8B61122C8954CCA2EC79C1ED4C25/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/773996263557000439/C9EA2A27264C73E42C016FE26E665CBB75F8E7DE/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/770611701143471855/26BE70BB475D8B61122C8954CCA2EC79C1ED4C25/",
        },      
      },
      points = 30,
      restrictions = {
        include = {
          unit = {
            "Stormtrooper Riot Squad",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["KATARN PATTERN ARMOR"] = {
      name = "Katarn Pattern Armor",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135343697/9294A833C65D6D3721327C68A057F71D8D920AD7/",
      points = 0,
      type = "Gear",
    },
    ["LEAD BY EXAMPLE"] = {
      name = "Lead by Example",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13953261892853714692/D7C43A7643D1580E6B7859A468734D1784D046EA/",
      points = 8,
      type = "Command",
    },
    ["LINKED TARGETING ARRAY"] = {
      name = "Linked Targeting Array",
      image = "https://steamusercontent-a.akamaihd.net/ugc/14619952568753696955/4661936FB9F23F26D08151D8D8F82CC3140F9B5A/",
      points = 5,
      restrictions = {
        include = {
          type = {
            "Emplacement Trooper",
            "Vehicle",          
          },        
        },      
      },
      type = "Comms",
    },
    ["LOK DURD"] = {
      name = "Lok Durd",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139932011/B3D3CF2244185894532A6D27D795AAA947DBD2C0/",
      points = 9,
      restrictions = {
        include = {
          unit = {
            "AAT Battle Tank",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["LONG GUN WOOKIEE"] = {
      name = "Long Gun Wookiee",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140086434/5583DF53D29E565AFACC0B9535B7B5798B4183F6/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1619598366708042667/2DABB5788E51006EDB3FCB03400ACD4CE07755F3/",      
      },
      points = 26,
      restrictions = {
        include = {
          unit = {
            "Wookiee Warriors",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["LONG-RANGE COMLINK"] = {
      name = "Long-Range Comlink",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568143528/99CEF391C6D9986657DE1CFF42306EAC06958A0B/",
      points = 5,
      type = "Comms",
    },
    ["LOOTED E-5 BLASTER"] = {
      name = "Looted E-5 Blaster",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568143554/AAE0C21ACF5E130BCCD15B21BDC1027613DC26BA/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "Padme Amidala",          
          },        
        },      
      },
      type = "Armament",
    },
    ["M-45 ION BLASTER"] = {
      name = "M-45 Ion Blaster",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140086470/7B7DF79267F695621DFF1C1D68859F71CBE521C5/",
      points = 28,
      restrictions = {
        include = {
          unit = {
            "X-34 Landspeeder",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["MO/DK POWER HARPOON"] = {
      name = "MO/DK Power Harpoon",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140086620/85D8AFAE73115CB7E7F35C5167E442B97CD1B01E/",
      points = 0,
      restrictions = {
        include = {
          unit = {
            "T-47 Airspeeder",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["MPL-57 BARRAGE TROOPER"] = {
      name = "MPL-57 Barrage Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384857286/60AC7BEDA003F95429F6312717EBAB9488C51852/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670338/28625FDF1F56EF08F0DB236C4ECFF67A54083B2B/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780862750426/2563904D7561144EE85EBCD3E07D68F48D8DD034/",      
      },
      points = 22,
      restrictions = {
        include = {
          unit = {
            "Fleet Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["MPL-57 ION TROOPER"] = {
      name = "MPL-57 Ion Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140087234/0D66FAAED4DDC12FFC8A8473BAF114066354BCFB/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670338/28625FDF1F56EF08F0DB236C4ECFF67A54083B2B/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780862750426/2563904D7561144EE85EBCD3E07D68F48D8DD034/",      
      },
      points = 27,
      restrictions = {
        include = {
          unit = {
            "Rebel Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["MAG-DET ENFORCER"] = {
      name = "Mag-Det Enforcer",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638823/D41C1DD1A9B63A173D667167C2CA1E79D0BA2F1E/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143649/BBBA0D26FB46EAD96421C4B77FE779B5F0F848AA/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143328/3D6F3C2E8DFB78B9B748FFC8F339B9C568D7408E/",      
      },
      points = 16,
      restrictions = {
        include = {
          unit = {
            "Black Sun Enforcers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["MANDALORIAN COMBAT SHIELDS"] = {
      name = "Mandalorian Combat Shields",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140086515/C2224F26DF942CEFA38BE94C5BF16355539139DA/",
      points = 10,
      restrictions = {
        include = {
          unit = {
            "Mandalorian Resistance",          
          },        
        },      
      },
      type = "Gear",
    },
    ["MANDALORIAN SUPER COMMANDO"] = {
      name = "Mandalorian Super Commando",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638743/16D7B984EB6DA1BE6AF202D902459EE20DD03050/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143500/4BDEA7F5B523FC06641B3D71D1E112DC14BD7F81/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/1789640371717200823/B886D3157AA2F2528F4E5F76F26DF44A41496615/",      
      },
      points = 24,
      restrictions = {
        include = {
          unit = {
            "Mandalorian Super Commandos",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["MARK II MEDIUM BLASTER"] = {
      name = "Mark II Medium Blaster",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140086552/D1D6D09E2363DE1AD638A6516E6272CACB2B7A23/",
      points = 21,
      restrictions = {
        include = {
          unit = {
            "X-34 Landspeeder",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["MERTALIZER"] = {
      name = "Mertalizer",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148691701/24C8FA07250A2FF8E6E94EC79E6B3F87145E7D5A/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2004698291313161066/7BD340C7AAB594CDA1644D900F606FEC8A0165A1/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2004698291313176203/E77892ADB668EA0CB548F6ED71BE44CA3FB730E7/",      
      },
      points = 36,
      restrictions = {
        include = {
          unit = {
            "Imperial Dark Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["MISSION OBJECTIVE"] = {
      name = "Mission Objective",
      image = "https://steamusercontent-a.akamaihd.net/ugc/17334019965207943741/029ACD82FDA36426721B25B435731D78D4470689/",
      points = 6,
      type = "Training",
    },
    ["MORTAR CLONE TROOPER"] = {
      name = "Mortar Clone Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384857192/CF4DF5C1BB0C410B79E2F7EE0B658D2C9F4B8DE3/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809185328/4A6DA42CDB70EF979D5B8B675CEFA5459FA60D4E/",      
      },
      points = 20,
      restrictions = {
        include = {
          unit = {
            "Clone Trooper Infantry",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["NOSE-MOUNTED FLAMETHROWER"] = {
      name = "Nose-Mounted Flamethrower",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139932109/2E0AB29034B53D4523B5370D1EF77159460BB222/",
      points = 15,
      restrictions = {
        include = {
          unit = {
            "DSD1 Dwarf Spider Droid",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["NOSE-MOUNTED ION BLASTER"] = {
      name = "Nose-Mounted Ion Blaster",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139932171/BC04BFC46285EB872E4B7A65DF2E6A2C8DC5EBA9/",
      points = 30,
      restrictions = {
        include = {
          unit = {
            "DSD1 Dwarf Spider Droid",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["NOSE-MOUNTED LASER CANNON"] = {
      name = "Nose-Mounted Laser Cannon",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139932245/3F68293534A56C2DAF62AC227A3F271F1C201610/",
      points = 15,
      restrictions = {
        include = {
          unit = {
            "DSD1 Dwarf Spider Droid",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["NOT A STORY THE JEDI WOULD TELL"] = {
      name = "Not A Story The Jedi Would Tell",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1616219505080628743/9BF0AAE54D0CF62B22871F7E99B1DCD5617E05DA/",
      points = 0,
      type = "Flaw",
    },
    ["OOM-SERIES BATTLE DROID"] = {
      name = "OOM-Series Battle Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139933383/26696A10589DBF5D8D9FC3E389F9C9F74CE2AE27/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/767228764785018348/F0B0C50757F4043A6C9B8746A73F8EC4342CA7DA/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/767228764785012711/4DF65424F7D5400F0DC8A4DE7A028B373143CE6E/",      
      },
      points = 8,
      restrictions = {
        include = {
          unit = {
            "B1 Battle Droids",          
          },        
        },      
      },
      leader = true,
      type = "Personnel",
    },
    ["OOM-SERIES DROID PILOT"] = {
      name = "OOM-Series Droid Pilot",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140015474/EBD6D1C9D3C7DBCB66C1C5976D7F6B2A7303655D/",
      points = 7,
      restrictions = {
        include = {
          unit = {
            "AAT Battle Tank",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["OFFENSIVE PUSH"] = {
      name = "Offensive Push",
      image = "https://steamusercontent-a.akamaihd.net/ugc/16907375567208427027/88097E66EB0822A2A2956F6BDCC92A37E9E3E464/",
      points = 6,
      type = "Training",
    },
    ["OFFENSIVE STANCE"] = {
      name = "Offensive Stance",
      image = "https://steamusercontent-a.akamaihd.net/ugc/16537339389726247952/720B5E7A361CEEC36F674F1CF36298A5997DE2F5/",
      type = "Training",
      points = 5,
      restrictions = {
        include = {
          slot = {
            "Force",          
          },        
        },      
      },
      mini = undefined,
      flip = {
        name = "Defensive Stance",
        image = "https://steamusercontent-a.akamaihd.net/ugc/10394379497446642242/A484E8DE817DC612497E99A36F6D33FBA8E423C9/",      
      },
    },
    ["OMEGA MASCOT OF THE 99TH"] = {
      name = "Omega Mascot of the 99th",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13052279450458785925/C7B345E1DDA2DA424D48B784B9211314F16BA062/",
      points = 10,
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2475370743175243961/93E8549BC0F1F88228D651FAE226459945DC6651/",      
      },
      restrictions = {
        include = {
          faction = {
            "Rebel",          
          },
          unit = {
            "The Bad Batch",          
          },        
        },      
      },
      type = "Counterpart",
    },
    ["ON THE HUNT"] = {
      name = "On the Hunt",
      image = "https://steamusercontent-a.akamaihd.net/ugc/11536628804561707799/CE3417E31989D043648719A766916DF1A91B9228/",
      points = 6,
      type = "Training",
    },
    ["ONBOARD COMMS CHANNEL"] = {
      name = "Onboard Comms Channel",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13942732418073164981/DF52655D5DBDA266A9A0F3609B151FEC449ACE22/",
      points = 10,
      restrictions = {
        include = {
          type = {
            "Vehicle",          
          },        
        },      
      },
      type = "Comms",
    },
    ["ONWARD TO VICTORY"] = {
      name = "Onward to Victory",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140105386/419AA1B3264BA3ACD8243358E80630E91B11DBC9/",
      points = 10,
      restrictions = {
        include = {
          unit = {
            "Logray",          
          },        
        },      
      },
      type = "Training",
    },
    ["OUTER RIM SPEEDER JOCKEY"] = {
      name = "Outer Rim Speeder Jockey",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140087292/9D5546C2AC5D1B59952078E53AF7E83003DFB912/",
      points = 10,
      restrictions = {
        include = {
          faction = {
            "Rebel",          
          },
          type = {
            "Repulsor Vehicle",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["OVERCHARGED GENERATOR"] = {
      name = "Overcharged Generator",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10994758540793540020/A06F99541DB44F59DCDE885471D4F9E77A37DA08/",
      points = 3,
      type = "Generator",
    },
    ["OVERWATCH"] = {
      name = "Overwatch",
      image = "https://steamusercontent-a.akamaihd.net/ugc/15085498882065075341/D3305FB0E1D762750532A11CDCB3195A3587F987/",
      points = 4,
      type = "Training",
    },
    ["P13-M DISRUPTOR SOLDIER"] = {
      name = "P13-M Disruptor Soldier",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638629/3C20733912FB63D65394756509211C5CF6C39CDA/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845607/4B1530CF96F9DB8F172B02676F1D8B347CFD862A/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",      
      },
      points = 24,
      restrictions = {
        include = {
          unit = {
            "Pyke Syndicate Foot Soldiers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["PK-SERIES WORKER DROID"] = {
      name = "PK-Series Worker Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139933460/B95170257A3FA060A1A39CB5927F72FA40D8F821/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809185654/E58BE2AB7BC859E1A896FF9B9909B6976E69CF4B/",      
      },
      points = 12,
      restrictions = {
        include = {
          type = {
            "Droid Trooper",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["PAO"] = {
      name = "Pao",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568144174/A692F2A518931AA6E08AAF8C4641D8972ECDB267/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/993513208355174746/6F5A50CE6D4E23C6278AE868FD359A49E1C80179/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/993513208355174858/CCC2B3862F1FEB611B03317594F6F0E761750C70/",      
      },
      leader = true,
      points = 20,
      restrictions = {
        include = {
          unit = {
            "Rebel Pathfinders",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["PINTLE-MOUNTED DLT-19"] = {
      name = "Pintle-Mounted DLT-19",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148691806/1D3A6A70D19D4C84286B171457623AA3119A2C03/",
      points = 18,
      restrictions = {
        include = {
          unit = {
            "TX-225 GAVw Occupier Tank",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["PINTLE-MOUNTED RT-97C"] = {
      name = "Pintle-Mounted RT-97C",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148692381/4CDBE4E62F256CAFC40FEBE392F64789B73B5BC1/",
      points = 14,
      restrictions = {
        include = {
          unit = {
            "TX-225 GAVw Occupier Tank",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["PLO KOON"] = {
      name = "Plo Koon",
      image = "https://steamusercontent-a.akamaihd.net/ugc/12076372952085384369/7AAAC90F9DEA02181CD279217BEE86A4F4846ACF/",
      points = 9,
      restrictions = {
        include = {
          unit = {
            "Saber-Class Tank",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["PORTABLE SCANNER"] = {
      name = "Portable Scanner",
      image = "https://steamusercontent-a.akamaihd.net/ugc/9364238650847600159/DC2666F9D8630D77DF25B6ACD52083D350CD926D/",
      points = 6,
      restrictions = {
        override = {
          unit = {
            "B1 Battle Droids",          
          },        
        },      
      },
      type = "Gear",
    },
    ["PREPARED SUPPLIES"] = {
      name = "Prepared Supplies",
      image = "https://steamusercontent-a.akamaihd.net/ugc/15123875138493055282/186AF8D3483E44991F4BF5405DE6A84C4BF9664B/",
      points = 5,
      type = "Gear",
    },
    ["PROGRAMMED LOYALTY"] = {
      name = "Programmed Loyalty",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148692470/2BD6DDB57A0387833FB43044131859D281EBD909/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "Imperial Dark Troopers",          
          },        
        },      
      },
      type = "Programming",
    },
    ["PROTECTOR"] = {
      name = "Protector",
      image = "https://steamusercontent-a.akamaihd.net/ugc/16502499181280123877/013B5483D56B59EC250FE6A45B2DED594E1BF45F/",
      points = 5,
      type = "Training",
    },
    ["PROTON CHARGE SABOTEUR"] = {
      name = "Proton Charge Saboteur",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384857685/BBFA286A722F4FD50AB0DADDBF343A6CBC9EB79F/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541173465/8193FD1F0862270CD23BA9243679840BE6324DC6/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541173570/3C100E92F0DEDEF117D3A0392D3271951BC90DD0/",      
      },
      points = 20,
      restrictions = {
        include = {
          unit = {
            "Rebel Commandos",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["PYKE SYNDICATE CAPO"] = {
      name = "Pyke Syndicate Capo",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638580/65166B7E91103AD7B1F26E197338FD01B98E7591/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420351237/706DEA645FEE2EC9787F05F4FF2926632E2C4894/",      
      },
      leader = true,
      points = 18,
      restrictions = {
        include = {
          unit = {
            "Pyke Syndicate Foot Soldiers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["PYKE SYNDICATE FOOT SOLDIER"] = {
      name = "Pyke Syndicate Foot Soldier",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638523/E0BF45AC2918D78E53F39A4EB61372E0FBD24AF5/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1745728387706845389/0D7DFE0C5BF5CDD527A619B75A25A2177D417BD0/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143543/CBAC94E0D1731CB8D1034D24F58987E854A8596A/",      
      },
      points = 9,
      restrictions = {
        include = {
          unit = {
            "Pyke Syndicate Foot Soldiers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["R4 ASTROMECH"] = {
      name = "R4 Astromech",
      image = "https://steamusercontent-a.akamaihd.net/ugc/14559987992750624971/2375A1517931DC8EED5B089C148489744B81A868/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/949599512594492173/DDA1CC3AEEC3D5ADB3B04F35125EE8A6FB7EB93A/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/949599512594267919/F44B2C3C810757626C7A4A61DAA7F2BC2BEECFC6/",      
      },
      points = 9,
      restrictions = {
        include = {
          faction = {
            "Empire",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["RPS-6 ARF TROOPER"] = {
      name = "RPS-6 ARF Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/12717002306739299639/3A8542FCC457C05E120FB9E59AD8BA4D1551DFE6/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/16428815149645590/1B9C028584B5A7DCD488AE1E9C57D33A1B93C92E/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/16428815149646251/ADB16A6BF3CADD49D0237A4AB51FB4D7AF0AB521/",      
      },
      points = 24,
      restrictions = {
        include = {
          unit = {
            "ARF Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["RPS-6 CLONE TROOPER"] = {
      name = "RPS-6 Clone Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384857930/2CEB66226D92B8B803D3654A7F59977A0D0B6BA2/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/767228764785603568/BB31C6873BD81E6B5B6F6D41B907DA95421063F0/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/767228764785565294/2AA6ABC62F52DCD30C56D5DED210C35E7B4FD526/",      
      },
      points = 21,
      restrictions = {
        include = {
          unit = {
            "Clone Trooper Infantry",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["RPS-6 MAGNAGUARD"] = {
      name = "RPS-6 MagnaGuard",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139933591/76EA9AB16AFB8FD6B3DA57A31F40EEF7150F38E1/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1621849308236386787/E93D6E65A61C9262B5934C5A419736B45B50D75B/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/1621849538641208262/A0E48F7D9C94617C81BAD4D649717BAC7A8B9B64/",      
      },
      points = 40,
      restrictions = {
        include = {
          unit = {
            "IG-100 MagnaGuard",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["RPS-6 ROCKET GUNNER"] = {
      name = "RPS-6 Rocket Gunner",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140089557/0F4A5F58A50BD239C6C28FD362B36112B2E3BA40/",
      points = 21,
      restrictions = {
        include = {
          unit = {
            "X-34 Landspeeder",          
          },        
        },      
      },
      type = "Crew",
    },
    ["RT-97C BLASTER RIFLE"] = {
      name = "RT-97C Blaster Rifle",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140107008/1524B081B7155F22B18F85E7789813478AE6EA3C/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "Dewback Rider",          
          },        
        },      
      },
      type = "Armament",
    },
    ["RT-97C STORMTROOPER"] = {
      name = "RT-97C Stormtrooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140097529/6BD2F13FA6AB3A56E258254420005E9EB38C7C0B/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141221/5D4DAEED517F52EE2ECBC631301C97422F519AB9/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141746/A8FD77EB51C50C64CD924BDAEEDB70D8839E0EF3/",      
      },
      points = 24,
      restrictions = {
        include = {
          unit = {
            "Stormtroopers",
            "Stormtroopers Heavy Response Unit",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["RADIATION CANNON B1 BATTLE DROID"] = {
      name = "Radiation Cannon B1 Battle Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139933524/FFF766FA4F641B413DF8E7BC37DB6088B7F31358/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/767228764785008444/482C29486FD00312B2C7848D26A82793BCDF7D7F/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/767228764784997566/39300970854603B1F1539C46D70CC21280E278FF/",      
      },
      points = 16,
      restrictions = {
        include = {
          unit = {
            "B1 Battle Droids",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["RAIDING PARTY LEADER"] = {
      name = "Raiding Party Leader",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638497/FA19544838EC45188131DAA0750684C57267D3B9/",
      points = 10,
      restrictions = {
        include = {
          unit = {
            "A-A5 Speeder Truck",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["RANGE TROOPER"] = {
      name = "Range Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140107049/41E44A7B3EEAA1EAC25BB17B1565C80E1C84C1D9/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682669758/7E6C79BDA776AD0618FF66FCD961C59DD6B0F4F1/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682582649/F03C73249983DDC1178314FD61C7D53DA27840EE/",      
      },
      points = 15,
      restrictions = {
        include = {
          unit = {
            "Range Troopers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["REBEL COMMS TECHNICIAN"] = {
      name = "Rebel Comms Technician",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140087441/1E88F5C5944887DA1471BA18283D3373A1CFD68A/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/949599512594474909/F8F049D7F88171ADBA83AF3EAF819495053C2873/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/949599512594268734/CF3C536F7B068020A99C5E3EE11CA9C54438E250/",      
      },
      points = 9,
      restrictions = {
        include = {
          faction = {
            "Rebel",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["REBEL MARKSMAN"] = {
      name = "Rebel Marksman",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140087495/6457AE581E595160FCFCADFED8B8B6F19F25A68E/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/2508033889680570051/845658287FF6EADD0F2B31B94ABC4899A09475EE/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/2508033889680570231/D122EECC159E02264D024421EB7767BEA8E70F21/",      
      },
      points = 28,
      restrictions = {
        include = {
          unit = {
            "Rebel Sleeper Cell",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["REBEL OFFICER"] = {
      name = "Rebel Officer",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140088186/0366C06A9E09B953E9B8557F671300731E83A209/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780862726770/62FECAB3FED284E098751CC3BBC70C4CFF828A58/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780862727097/DE589901F66E4079D82BA2C819672F622A5D7240/",      
      },
      leader = true,
      points = 16,
      restrictions = {
        include = {
          faction = {
            "Rebel",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["REBEL TROOPER"] = {
      name = "Rebel Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140088390/D15BD2F8088BB8162C050F2D1DB26CCEBA5E9CBB/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780862761532/2FB3D83FC2BD077F4ADE619382382B9A59CD0ABE/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780862750426/2563904D7561144EE85EBCD3E07D68F48D8DD034/",      
      },
      points = 7,
      restrictions = {
        include = {
          unit = {
            "Rebel Troopers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["REBEL TROOPER CAPTAIN"] = {
      name = "Rebel Trooper Captain",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140088271/76AF8576BFC2E7EED7B065DB76A83688C13BD43A/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/766102173464670173/ECC18FB91315A55181F38A6899122E005460C688/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/766102173464683373/FE0A29CF1A46E7F97FEAE0C9FD665AB192A8D9A8/",      
      },
      leader = true,
      points = 9,
      restrictions = {
        include = {
          unit = {
            "Rebel Troopers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["REBEL TROOPER SPECIALIST"] = {
      name = "Rebel Trooper Specialist",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140088307/7C272AB0828A4D728C3D1C0E487F686817D5B542/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/766102173464719285/839B79B3594F31585EB38763EDF43AD32E46F37F/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/766102173464692456/FD09533718942CE5B08526B2CD1A00D5D38CB734/",      
      },
      points = 8,
      restrictions = {
        include = {
          unit = {
            "Rebel Troopers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["REBEL TROOPER SQUAD"] = {
      name = "Rebel Trooper Squad",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140088345/8469135908290D4083FD268CA0E02EEB5B69A81F/",
      minis = {
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780862752262/41BD6AB8B17AB7449226A3D80EF186EB8ABA3952/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780862750426/2563904D7561144EE85EBCD3E07D68F48D8DD034/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780862764799/98CBD8B4DD0C08CFA01A8E6C8B5A70A137804EAB/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780862750426/2563904D7561144EE85EBCD3E07D68F48D8DD034/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780862755846/CD522BCA5D6E918E13A3FF593D7212FF4B0E79CA/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780862750426/2563904D7561144EE85EBCD3E07D68F48D8DD034/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780862764799/98CBD8B4DD0C08CFA01A8E6C8B5A70A137804EAB/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780862750426/2563904D7561144EE85EBCD3E07D68F48D8DD034/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780862755846/CD522BCA5D6E918E13A3FF593D7212FF4B0E79CA/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780862750426/2563904D7561144EE85EBCD3E07D68F48D8DD034/",
        },      
      },
      points = 45,
      restrictions = {
        include = {
          unit = {
            "Rebel Troopers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["REBEL VETERAN"] = {
      name = "Rebel Veteran",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140089489/88E830A8F6CC5CC3F6589C7F5D6680AF2006DC5F/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192589/466305BFF474DBAB11F58FA13B3F4ACC9BB7127C/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192135/526538CE10AC6856578996BE6B8AB7263D32D5C7/",      
      },
      points = 9,
      restrictions = {
        include = {
          unit = {
            "Rebel Veterans",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["REBEL VETERAN SQUAD"] = {
      name = "Rebel Veteran Squad",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140088439/DAD81738594065C60010622C47AC9FC71021F2E9/",
      minis = {
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192232/D15615AF2A0F4F4887E9BD3DFFA141C8ACCCEC78/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192135/526538CE10AC6856578996BE6B8AB7263D32D5C7/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192402/4D1858AA566FEEE91774E40B10C233AAD8C381D5/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192135/526538CE10AC6856578996BE6B8AB7263D32D5C7/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192498/BF583EA43B457E816CDE323C172B2F4558B7A8BD/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192135/526538CE10AC6856578996BE6B8AB7263D32D5C7/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192402/4D1858AA566FEEE91774E40B10C233AAD8C381D5/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192135/526538CE10AC6856578996BE6B8AB7263D32D5C7/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192498/BF583EA43B457E816CDE323C172B2F4558B7A8BD/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/788608699499192135/526538CE10AC6856578996BE6B8AB7263D32D5C7/",
        },      
      },
      points = 63,
      restrictions = {
        include = {
          unit = {
            "Rebel Veterans",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["RECKLESS DRIVER"] = {
      name = "Reckless Driver",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568144930/910352F2AA646B8E97628B4DF56C364805ABD906/",
      points = 12,
      restrictions = {
        include = {
          unit = {
            "A-A5 Speeder Truck",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["RECON INTEL"] = {
      name = "Recon Intel",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13884509065011813667/94DC6344FD7E9D9860530CA21D7F80375C9D19C7/",
      points = 2,
      type = "Gear",
    },
    ["REFURBISHED \"GONK\" DROID"] = {
      name = "Refurbished \"Gonk\" Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865568144996/C187B41FE3AE53493F4A9AA23B0F74B795F9B2C3/",
      points = 14,
      restrictions = {
        include = {
          unit = {
            "A-A5 Speeder Truck",
            "X-34 Landspeeder",          
          },        
        },      
      },
      type = "Crew",
    },
    ["ROOK KAST"] = {
      name = "Rook Kast",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638438/ECEE74FD265762CEC44438C9D0C5FF263009C3F2/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1789640371719006177/3A456EB29012BFBE4322E020CBC08CF6F915BBF3/",      
      },
      leader = true,
      points = 35,
      restrictions = {
        include = {
          unit = {
            "Mandalorian Super Commandos",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["RYDER AZADI"] = {
      name = "Ryder Azadi",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140089640/792212C26B25488AA9E9CED4F8772D8549162630/",
      points = 5,
      restrictions = {
        include = {
          faction = {
            "Rebel",          
          },
          type = {
            "Repulsor Vehicle",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["SM-9 FRAG LAUNCHER"] = {
      name = "SM-9 Frag Launcher",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148692274/A56AA57889F61A9BDE9C1C7338B023C30BF7108B/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2004698291313161010/1873BCD554A553BC2FF25A2BE16116EDEBFDCEF4/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2004698291313176203/E77892ADB668EA0CB548F6ED71BE44CA3FB730E7/",      
      },
      points = 45,
      restrictions = {
        include = {
          unit = {
            "Imperial Dark Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["SX-21 TROOPER"] = {
      name = "SX-21 Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140090364/742815B4FE24A223EC893A9697A6CA8C284A7377/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/766102173464725382/9DADA91B7A5BE8DEEC1BDE838B3140A350D661A4/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/766102173464726852/2ABBCC6938695708489FB87C27C6B7481A1D294A/",      
      },
      points = 15,
      restrictions = {
        include = {
          unit = {
            "Rebel Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["SABER THROW"] = {
      name = "Saber Throw",
      image = "https://steamusercontent-a.akamaihd.net/ugc/14367574201845804889/D5DB44897C38C9633AC5168A038FFEA4F7119A0E/",
      points = 5,
      type = "Force",
    },
    ["SABINE'S COMBAT SHIELD"] = {
      name = "Sabine's Combat Shield",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140089761/CCEBC0B6763DAA8C50AFA2DDA8E17AACD0A0F147/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "Sabine Wren",          
          },        
        },      
      },
      type = "Gear",
    },
    ["SAXON'S COMBAT SHIELD"] = {
      name = "Saxon's Combat Shield",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638398/E7F27B6FC186179E16B72827C7E7C6B67C53E233/",
      points = 10,
      restrictions = {
        include = {
          unit = {
            "Gar Saxon",          
          },        
        },      
      },
      type = "Gear",
    },
    ["SAXON'S GALAR-90 RIFLE"] = {
      name = "Saxon's Galar-90 Rifle",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638360/9640DCEEFC8C952C5828F120F9527886B6AD1AEB/",
      points = 15,
      restrictions = {
        include = {
          unit = {
            "Gar Saxon",          
          },        
        },      
      },
      type = "Armament",
    },
    ["SAXON'S JETPACK ROCKETS"] = {
      name = "Saxon's Jetpack Rockets",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638324/2B2554057A17324B946ADF61B44CFB94081A770D/",
      points = 10,
      restrictions = {
        include = {
          unit = {
            "Gar Saxon",          
          },        
        },      
      },
      type = "Armament",
    },
    ["SAXON'S ZX FLAME PROJECTOR"] = {
      name = "Saxon's ZX Flame Projector",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638292/3120A41DA39C3D76C2B2584CB20390E4D8FE90D4/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "Gar Saxon",          
          },        
        },      
      },
      type = "Armament",
    },
    ["SCATTER GUN ENFORCER"] = {
      name = "Scatter Gun Enforcer",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638229/542B7031B727D74585CE7FA38EEA086252152001/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143685/C75388115AFCF42ACC79E2C16FEF36755C975AA0/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143328/3D6F3C2E8DFB78B9B748FFC8F339B9C568D7408E/",      
      },
      points = 28,
      restrictions = {
        include = {
          unit = {
            "Black Sun Enforcers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["SCATTER GUN TROOPER"] = {
      name = "Scatter Gun Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140089843/7386BFA25F833C0D475BDF1DC2C4089A9E533457/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540540671094/4A4BCE6286ACB413B661F827BB00B920617F3E91/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540540670760/47DF3E87B3F71E8EA42A89ECFE96E4FB3990D7ED/",      
      },
      points = 22,
      restrictions = {
        include = {
          unit = {
            "Fleet Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["SECRET INGREDIENTS"] = {
      name = "Secret Ingredients",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140104858/F33E3DEECEB2996128560B29C8E41C38B84EB371/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "Logray",          
          },        
        },      
      },
      type = "Training",
    },
    ["SEIZE THE INITIATIVE"] = {
      name = "Seize The Initiative",
      image = "https://steamusercontent-a.akamaihd.net/ugc/15625749152448275367/CF9CACC1FA903168B23F5EACE6E091603EF4D0BA/",
      points = 5,
      restrictions = {
        include = {
          rank = {
            "Commander",
            "Operative",          
          },        
        },      
      },
      type = "Training",
    },
    ["SHORETROOPER"] = {
      name = "Shoretrooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13031343564930773334/77BF73703B9A90783AF7E3EDFF92D9E4D0BEC1B4/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359682702688256/B266465186713632AE14D6B4B473AB4E94814685/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687694/C12AAE8B7F487BE4C1545E253AB3C026E0426AA1/",      
      },
      points = 10,
      restrictions = {
        include = {
          unit = {
            "Shoretroopers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["SHORETROOPER SQUAD"] = {
      name = "Shoretrooper Squad",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384858102/00DDE771662593B3F43BC45184C018F11A5966BF/",
      minis = {
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687570/0D2A602282BAACDCE665EF9D1D65CEA413944083/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687694/C12AAE8B7F487BE4C1545E253AB3C026E0426AA1/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359682702688133/C8D721D29D711045A27EEC3868D4B7A111C86F20/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687694/C12AAE8B7F487BE4C1545E253AB3C026E0426AA1/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687282/B02342FDEEE7DDE82DF96EB434B1D033B0A4C899/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687694/C12AAE8B7F487BE4C1545E253AB3C026E0426AA1/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359682702688133/C8D721D29D711045A27EEC3868D4B7A111C86F20/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687694/C12AAE8B7F487BE4C1545E253AB3C026E0426AA1/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687282/B02342FDEEE7DDE82DF96EB434B1D033B0A4C899/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687694/C12AAE8B7F487BE4C1545E253AB3C026E0426AA1/",
        },      
      },
      points = 70,
      restrictions = {
        include = {
          unit = {
            "Shoretroopers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["SHRIV SUURGAV"] = {
      name = "Shriv Suurgav",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140089939/0B2428B8D00A6B3DED4916E7AA55D7940CB1DFA9/",
      points = 10,
      restrictions = {
        include = {
          faction = {
            "Rebel",          
          },
          rank = {
            "Heavy",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["SITUATIONAL AWARENESS"] = {
      name = "Situational Awareness",
      image = "https://steamusercontent-a.akamaihd.net/ugc/17536138674603170323/AE86A4AB47B30D6BBC2DAFCC1E760AF8CCCB0F8E/",
      points = 4,
      type = "Training",
    },
    ["SMOKE GRENADES"] = {
      name = "Smoke Grenades",
      image = "https://steamusercontent-a.akamaihd.net/ugc/15223973175401373403/AB9C869FE463738878D0DFE6EF14529452DD08DD/",
      points = 3,
      type = "Grenades",
    },
    ["SNOWTROOPER"] = {
      name = "Snowtrooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140097669/E2D49A07E0E56FD07EC247313240A3D7C6ABE50D/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801717/EDEA1301FC55A6970D5FBCF0A9F10456E4C2EE40/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801215/595165C57A67BF2BD505BE6F0DF8F11AD4EA55D2/",      
      },
      points = 8,
      restrictions = {
        include = {
          unit = {
            "Snowtroopers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["SNOWTROOPER SQUAD"] = {
      name = "Snowtrooper Squad",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140097587/A54CEC5E18DF9FB2F3C6A5B01DD6D2043D4BE27B/",
      minis = {
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801837/D52F333945BF667A37E06611977C36186CEFC7B6/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801215/595165C57A67BF2BD505BE6F0DF8F11AD4EA55D2/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801500/728C586E21D0A4EBD8DE54EEF4E097EFEEECE871/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801215/595165C57A67BF2BD505BE6F0DF8F11AD4EA55D2/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801363/743D9E272367ABB1F6296D5EFB6010637C58D5E4/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801215/595165C57A67BF2BD505BE6F0DF8F11AD4EA55D2/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801500/728C586E21D0A4EBD8DE54EEF4E097EFEEECE871/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801215/595165C57A67BF2BD505BE6F0DF8F11AD4EA55D2/",
        },
        {
          mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801363/743D9E272367ABB1F6296D5EFB6010637C58D5E4/",
          diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541801215/595165C57A67BF2BD505BE6F0DF8F11AD4EA55D2/",
        },      
      },
      points = 46,
      restrictions = {
        include = {
          unit = {
            "Snowtroopers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["SONIC CANNON WARRIOR"] = {
      name = "Sonic Cannon Warrior",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139933665/6D7AF85CB42A453D1AAD2B1B4DD03F00BD9C66CF/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2058763770177195589/5E52A1E47746FF179ED6327F681D51D92C47D1D5/",      
      },
      points = 25,
      restrictions = {
        include = {
          unit = {
            "Geonosian Warriors",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["SONIC CHARGE SABOTEUR"] = {
      name = "Sonic Charge Saboteur",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140103507/922568C5FAACC25FCE80574BE5459CB511022824/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/950714557093539716/6A0D63306F505A074395AFA61EB990280DB8995D/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/950714557093539899/FF7A535E91BF79D4C3E0D55E874C1ACEB6FBF434/",      
      },
      points = 23,
      restrictions = {
        include = {
          unit = {
            "Scout Troopers",          
          },        
        },      
      },
      additionalObjects = {
        "Proton Charge Token",      
      },
      type = "Heavy Weapon",
    },
    ["SONIC IMPLODERS"] = {
      name = "Sonic Imploders",
      image = "https://steamusercontent-a.akamaihd.net/ugc/9365292732961081475/6E1280991DDA4A40FD4B58948CCCEB2FBDD23C1A/",
      points = 3,
      type = "Grenades",
    },
    ["SPOTTER UPLINK"] = {
      name = "Spotter Uplink",
      image = "https://steamusercontent-a.akamaihd.net/ugc/14924322567155862762/F2A27A192FD49D879842AF20650351B03ACB0AFB/",
      points = 3,
      type = "Comms",
    },
    ["STORMTROOPER"] = {
      name = "Stormtrooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140097931/DB288D0B28104E95465A3ED5D12C65D527876F54/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650140825/D8AE1D1F27B97F359916236DA163DA7EC4B517C1/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141746/A8FD77EB51C50C64CD924BDAEEDB70D8839E0EF3/",      
      },
      points = 8,
      restrictions = {
        include = {
          unit = {
            "Stormtroopers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["STORMTROOPER CAPTAIN"] = {
      name = "Stormtrooper Captain",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140097752/7B066902F66EB65B14B17D9170987270B5C9B0BA/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650140913/ADEED3994E6F70777B939A89B18FF520765DCDC4/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141746/A8FD77EB51C50C64CD924BDAEEDB70D8839E0EF3/",      
      },
      leader = true,
      points = 10,
      restrictions = {
        include = {
          unit = {
            "Stormtroopers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["STORMTROOPER MARKSMAN"] = {
      name = "Stormtrooper Marksman",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140177027/4884AC61C97A4ACD22A03F85D95CA468DE75886E/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2491137781649838294/7197479F9D7ADF9DB1287E740A469A0E5C28F2ED/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2491137781649821736/A6557A52AB579A320023B7028C55A38815DC566E/",      
      },
      points = 30,
      restrictions = {
        include = {
          unit = {
            "Stormtrooper Riot Squad",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["STORMTROOPER SPECIALIST"] = {
      name = "Stormtrooper Specialist",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140097824/D6788FE32981247191B9A68F92DA96DAFDC3B47E/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141284/6D59924E68B2B1640C0AC479B8DE95F434056650/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141746/A8FD77EB51C50C64CD924BDAEEDB70D8839E0EF3/",      
      },
      points = 9,
      restrictions = {
        include = {
          unit = {
            "Stormtroopers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["STORMTROOPER SQUAD"] = {
      name = "Stormtrooper Squad",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140097883/0F0DF0E194F55384AE82D7F9A1CEA4EC7597CF42/",
      minis = {
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141545/30BEFE4E87E379AA361AFF5FD24A8F5D3F0BA4C0/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141746/A8FD77EB51C50C64CD924BDAEEDB70D8839E0EF3/",
        },
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141624/1366A6A4D84D9FE597EEA2736AFC187F392418DA/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141746/A8FD77EB51C50C64CD924BDAEEDB70D8839E0EF3/",
        },
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141692/8E06789B4D2003055108ED85D76E875729254757/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141746/A8FD77EB51C50C64CD924BDAEEDB70D8839E0EF3/",
        },
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141624/1366A6A4D84D9FE597EEA2736AFC187F392418DA/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141746/A8FD77EB51C50C64CD924BDAEEDB70D8839E0EF3/",
        },
        {
          bundle = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141692/8E06789B4D2003055108ED85D76E875729254757/",
          secondary = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141746/A8FD77EB51C50C64CD924BDAEEDB70D8839E0EF3/",
        },      
      },
      points = 46,
      restrictions = {
        include = {
          unit = {
            "Stormtroopers",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["STRICT ORDERS"] = {
      name = "Strict Orders",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13144615001636608131/4F2C4FF797BFB30D3FA835BE743C20EF7A1D333A/",
      points = 5,
      type = "Command",
    },
    ["STRIKE TEAM LEADER"] = {
      name = "Strike Team Leader",
      image = "https://steamusercontent-a.akamaihd.net/ugc/11456350745801770677/274AAA3D006877A45E7B114490584831707AB694/",
      points = 5,
      restrictions = {
        include = {
          rank = {
            "Operative",          
          },        
        },      
      },
      type = "Training",
    },
    ["STRIKE AND FADE"] = {
      name = "Strike and Fade",
      image = "https://steamusercontent-a.akamaihd.net/ugc/12387238698929923109/8DC11627ECA9A969FEBA8E2741FA455AA20FF62C/",
      points = 5,
      restrictions = {
        include = {
          type = {
            "Repulsor Vehicle",          
          },        
        },      
      },
      type = "Training",
    },
    ["SUPER COMMANDO COMBAT SHIELDS"] = {
      name = "Super Commando Combat Shields",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638051/2EB1F2BA6DC3BB022D0E9D04FAA77BEF7DE474E9/",
      points = 10,
      restrictions = {
        include = {
          unit = {
            "Mandalorian Super Commandos",          
          },        
        },      
      },
      type = "Gear",
    },
    ["SUPER COMMANDO GUNSLINGER"] = {
      name = "Super Commando Gunslinger",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638185/062D34CA1E85F91921AE17FA20FADC622E3F1591/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143366/41AB7DFFD2FCF20E2BCC3F899F728863C30F6343/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/1789640371717200823/B886D3157AA2F2528F4E5F76F26DF44A41496615/",      
      },
      points = 38,
      restrictions = {
        include = {
          unit = {
            "Mandalorian Super Commandos",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["SUPER COMMANDO JETPACK ROCKETS"] = {
      name = "Super Commando Jetpack Rockets",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148638126/810C46F8A1B873A7CFFBDC1DDDEE400DFC3AF388/",
      points = 8,
      restrictions = {
        include = {
          unit = {
            "Mandalorian Super Commandos",          
          },        
        },      
      },
      type = "Armament",
    },
    ["SUPER COMMANDO MARKSMAN"] = {
      name = "Super Commando Marksman",
      image = "https://steamusercontent-a.akamaihd.net/ugc/15709592670795104171/ACE59DD60752ACF052681409AEBE159D7C400AFE/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1856061112420143451/3DFD9C8BD5D504D3A2F7934678D1A0A7C2285863/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/1789640371717200769/60353F40BAE6D92D6F6ED24E2883EB9CC2EA74C4/",      
      },
      points = 28,
      restrictions = {
        include = {
          unit = {
            "Mandalorian Super Commandos",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["T-21 BLASTER RIFLE"] = {
      name = "T-21 Blaster Rifle",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140107073/9B787B4695966A18D0659B28A979EBEFFA1C29BD/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "Dewback Rider",          
          },        
        },      
      },
      type = "Armament",
    },
    ["T-21 SPECIAL FORCES TROOPER"] = {
      name = "T-21 Special Forces Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140103559/F3FC1C02320B5F60D4A041140E0637BD0C0EE86A/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/1618438238123000906/C64EAD02CA22F8BFB59320925DAD7D89BA1E7AD6/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/1618438238123043414/B7E9660E470DC070545782406C29F1E1356A5685/",      
      },
      points = 27,
      restrictions = {
        include = {
          unit = {
            "Imperial Special Forces",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["T-21 STORMTROOPER"] = {
      name = "T-21 Stormtrooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140098050/4A82E8EF8A7B04EFF91757E70C88282919912093/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141339/1EB723D5FCF6655CFFF7EF700EE7108274E1A6C7/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2017090166650141746/A8FD77EB51C50C64CD924BDAEEDB70D8839E0EF3/",      
      },
      points = 22,
      restrictions = {
        include = {
          unit = {
            "Stormtroopers",
            "Stormtroopers Heavy Response Unit",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["T-21A RANGE TROOPER"] = {
      name = "T-21A Range Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148701863/275BF33D3FD2CC6BCE759757AB74CEB8C940788F/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682669896/C2F5892D64B3B5CE33A83A3F874C1A66594F6412/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2495630600682582649/F03C73249983DDC1178314FD61C7D53DA27840EE/",      
      },
      points = 28,
      restrictions = {
        include = {
          unit = {
            "Range Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["T-21B SHORETROOPER"] = {
      name = "T-21B Shoretrooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/15356402076507157215/7BFF6CA98FAB03189CEA985CA8A892BDF7207BEC/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687816/8C17AF1D2344B7E8B1C8D34A0F2228E9ADC2FFAA/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359682702687407/D5B685EA41E9C664F2D16381474B5F08DF9CFAE5/",      
      },
      points = 32,
      restrictions = {
        include = {
          unit = {
            "Shoretroopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["T-7 ION SNOWTROOPER"] = {
      name = "T-7 Ion Snowtrooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385140097979/9F3CCF24FCF1D8F02F5B9CEEF9B8B4B157295F2F/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540541802160/69A03779E6B67F6F547C2FBD70ACDFC39281387D/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540541802252/037749C730FACCA3361B041BCB3C68E7E19DCDF8/",      
      },
      points = 24,
      restrictions = {
        include = {
          unit = {
            "Snowtroopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["T-SERIES TACTICAL DROID"] = {
      name = "T-Series Tactical Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139934011/3AA1AB05A592268E4C08E2CEAFB6B9B143105470/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809185719/FF120BC2FA5DC8258021E2849C2B81591CCA36B9/",      
      },
      leader = true,
      points = 18,
      restrictions = {
        include = {
          type = {
            "Droid Trooper",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["T-SERIES TACTICAL DROID PILOT"] = {
      name = "T-Series Tactical Droid Pilot",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139933742/5DA785FEB16866F613EF45A9998324B648F28026/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "AAT Battle Tank",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["TARGETING SCOPES"] = {
      name = "Targeting Scopes",
      image = "https://steamusercontent-a.akamaihd.net/ugc/17003971957433179861/711F8AAE5EAC0E70AF2B911805EFE33CA2E2A97C/",
      points = 4,
      type = "Gear",
    },
    ["TECH"] = {
      name = "Tech",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134145194/EA026AF5A84A9F1E34CCC601A39DF61B36D664CA/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2475370743175244098/67CBDAB9CA48B24940FC743CEB778A526C990993/",      
      },
      points = 0,
      restrictions = {
        include = {
          unit = {
            "The Bad Batch",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["TENACITY"] = {
      name = "Tenacity",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13667627159132611482/8C1C77825EEAB8D7099989FAF8A583725D8D9127/",
      points = 6,
      type = "Training",
    },
    ["TERROR"] = {
      name = "Terror",
      image = "https://steamusercontent-a.akamaihd.net/ugc/9638503798572904032/DD40B411FE4834EA82A7355EAF3EE268084977FA/",
      points = 6,
      restrictions = {
        include = {
          alignment = {
            "Dark",          
          },        
        },      
      },
      type = "Force",
    },
    ["THE DARKSABER"] = {
      name = "The Darksaber",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140090412/816EE4F5B469EC8334D0E84042E5C008FC67B04B/",
      points = 15,
      restrictions = {
        include = {
          unit = {
            "Sabine Wren",          
          },        
        },      
      },
      type = "Armament",
    },
    ["THE DARKSABER (GIDEON)"] = {
      name = "The Darksaber (Gideon)",
      image = "https://steamusercontent-a.akamaihd.net/ugc/16625983135926386325/491ADB4AF793015C774CBB05E327DFBB53A59E7B/",
      points = 15,
      restrictions = {
        include = {
          unit = {
            "Moff Gideon",          
          },        
        },      
      },
      type = "Armament",
    },
    ["THE DARKSABER (MAUL)"] = {
      name = "The Darksaber (Maul)",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148637945/3B49E86E68EBCB65154B12ECD4336463F7400B95/",
      points = 10,
      restrictions = {
        include = {
          unit = {
            "Maul",          
          },        
        },      
      },
      type = "Armament",
    },
    ["TRANQUILITY"] = {
      name = "Tranquility",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13728641352656300834/760A9CB4F241747DDB209C777746D41774518994/",
      points = 10,
      type = "Force",
    },
    ["TRISTAN WREN"] = {
      name = "Tristan Wren",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140090454/E3ADEFEA3EA70EEA160F391208AA8EE822DF1278/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809185988/83F7A4664576B192905C6393A6D9A5DAA776E01A/",      
      },
      points = 34,
      restrictions = {
        include = {
          unit = {
            "Mandalorian Resistance",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["TRUSTED AGENT"] = {
      name = "Trusted Agent",
      image = "https://steamusercontent-a.akamaihd.net/ugc/17954061666704112600/9401A70D88A98BA9FC5B5D8E56B0FA7F3B95961B/",
      points = 5,
      type = "Command",
    },
    ["TWIN BEAM CANNONS"] = {
      name = "Twin Beam Cannons",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135344651/FF1F346F4BC8D5A517747C10951F216DBF84A034/",
      points = 25,
      restrictions = {
        include = {
          unit = {
            "Infantry Support Platform",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["TWIN BLASTER CANNONS"] = {
      name = "Twin Blaster Cannons",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2491139050708067017/3B8BBCCFB6181F624CFF09DA5C4F762815CA4983/",
      points = 5,
      restrictions = {
        include = {
          unit = {
            "LM-432 Crab Droid",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["TWIN BLASTER CANNONS (ISP)"] = {
      name = "Twin Blaster Cannons (ISP)",
      image = "https://steamusercontent-a.akamaihd.net/ugc/14131708632610337124/66E8516A5E6EB1D1F90B8A835EB006A7EAB7F075/",
      points = 25,
      restrictions = {
        include = {
          unit = {
            "Infantry Support Platform",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["TWIN LASER TURRET"] = {
      name = "Twin Laser Turret",
      image = "https://steamusercontent-a.akamaihd.net/ugc/17399295105221231233/E6CA41DE7BAF2D58F8D86953FD25B3D431CFB80E/",
      points = 14,
      restrictions = {
        include = {
          unit = {
            "Saber-Class Tank",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["TWIN MISSILE PODS"] = {
      name = "Twin Missile Pods",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13940347858969613016/FC2F44AA892930B09D58A1259D9DABAC7CAB9488/",
      points = 25,
      restrictions = {
        include = {
          unit = {
            "Infantry Support Platform",          
          },        
        },      
      },
      type = "Hardpoint",
    },
    ["UNDERWORLD CONNECTIONS"] = {
      name = "Underworld Connections",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13075491375596331661/7404D8A06A3E978E3729E9D32EE0EBA855FA18FF/",
      points = 5,
      type = "Command",
    },
    ["UNORTHODOX TACTICIAN"] = {
      name = "Unorthodox Tactician",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148637911/5E0AD27637C0A160099F5D36889082BD84E94BB1/",
      points = 16,
      restrictions = {
        include = {
          unit = {
            "A-A5 Speeder Truck",          
          },        
        },      
      },
      type = "Crew",
    },
    ["UNSTABLE R5 ASTROMECH"] = {
      name = "Unstable R5 Astromech",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148637860/93B0991DD63C226FA855DA5D2320F2372792BD7C/",
      points = 6,
      restrictions = {
        include = {
          unit = {
            "A-A5 Speeder Truck",
            "X-34 Landspeeder",          
          },        
        },      
      },
      type = "Crew",
    },
    ["UP CLOSE AND PERSONAL"] = {
      name = "Up Close and Personal",
      image = "https://steamusercontent-a.akamaihd.net/ugc/9232863277993940777/071132D1F5F4BF88B379A1BF94EB78ED4D9559BA/",
      points = 8,
      type = "Training",
    },
    ["URSA WREN"] = {
      name = "Ursa Wren",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140090523/750235F212F45721D81F9776FD957A26D40B3AC5/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809186071/A6DB57CF6BA2EEDAB6EB8A719DB8D0702708C759/",      
      },
      leader = true,
      points = 34,
      restrictions = {
        include = {
          unit = {
            "Mandalorian Resistance",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["VETERAN CLONE PILOT"] = {
      name = "Veteran Clone Pilot",
      image = "https://steamusercontent-a.akamaihd.net/ugc/14161188831430230944/D58989E46F93F8F783C9305E8056941DD27C449E/",
      points = 7,
      restrictions = {
        include = {
          faction = {
            "Republic",          
          },
          rank = {
            "Heavy",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["VIGILANCE"] = {
      name = "Vigilance",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10166497509018197631/139646D733278E6B4FDD81AC4AC6D4A9CEE967C0/",
      points = 12,
      type = "Command",
    },
    ["VIPER RECON DROID"] = {
      name = "Viper Recon Droid",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081139934033/79C8D8FEC5E44ACAE43E0679E50A3B517ABD33A2/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446809185784/C7B137C19E24986DBE1E9A2712676AB320E4B2A9/",      
      },
      points = 9,
      restrictions = {
        include = {
          type = {
            "Droid Trooper",          
          },        
        },      
      },
      type = "Personnel",
    },
    ["WAXER"] = {
      name = "Waxer",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384858645/C13E3786197044E433A4CB9852C603CD7B4FC206/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2174736446813135349/81275DD398B659088A018A09394B7FD6E5C3B279/",      
      },
      leader = true,
      points = 20,
      restrictions = {
        include = {
          type = {
            "Clone Trooper",          
          },
          rank = {
            "Corps",          
          },        
        },      
      },
      type = "Squad Leader",
    },
    ["WEDGE ANTILLES"] = {
      name = "Wedge Antilles",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140091023/B1341EA467EFD4D50C2D7C677E1422B2FC84A4AD/",
      points = 5,
      restrictions = {
        include = {
          faction = {
            "Rebel",          
          },
          type = {
            "Repulsor Vehicle",          
          },        
        },      
      },
      type = "Pilot",
    },
    ["WRECKER"] = {
      name = "Wrecker",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134145231/9FC3E238C50C89E5B4036AC1275370BAEF3B3944/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2475370743175244156/4986205CB2289E6CF72269D9A17E6B2D405968DA/",      
      },
      points = 0,
      restrictions = {
        include = {
          unit = {
            "The Bad Batch",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["XS-IV ASSAULT CANNON"] = {
      name = "XS-IV Assault Cannon",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148692176/FE7C110B78061106AA1471FE6B6EE3BD5F645AE2/",
      mini = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2004698291313160948/23CA698C8F2AF1C08D2DED3564B138E72E2ABCBF/",
        secondary = "https://steamusercontent-a.akamaihd.net/ugc/2004698291313176203/E77892ADB668EA0CB548F6ED71BE44CA3FB730E7/",      
      },
      points = 45,
      restrictions = {
        include = {
          unit = {
            "Imperial Dark Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["Z-6 CLONE TROOPER"] = {
      name = "Z-6 Clone Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384858721/8DC71D0C54F4EC65A776B9E62F2F1E7263CA8724/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393876/DEDAF52B0D07E0F2A2BCB54DE9A56E4FA437A3E4/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717873393180/6359B491483DCD9B2641BA134DC4B92DE10E9D92/",      
      },
      points = 22,
      restrictions = {
        include = {
          unit = {
            "Clone Trooper Infantry",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
    ["Z-6 TROOPER"] = {
      name = "Z-6 Trooper",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081140091094/420B06E5C9EB605F3CF37DB609BE1961F8861B66/",
      mini = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780862734756/1F48FA301357905B28DA35A03658DFA39154DBFE/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234780862736228/22D1A1ACC79493FE82165CC95A5E23170A4FBC5B/",      
      },
      points = 20,
      restrictions = {
        include = {
          unit = {
            "Rebel Troopers",          
          },        
        },      
      },
      type = "Heavy Weapon",
    },
  },
  commands = {
    ["AI COORDINATION"] = {
      name = "AI Coordination",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131524713/997729685C3711220AD15A620B602F572C0D83E7/",
      pip = 1,
      faction = "Separatist",
    },
    ["AGGRESSION"] = {
      name = "Aggression",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139727645/6DE7757843A4090ABC83D7A4A2A69526B8FEEA5D/",
      pip = 2,
      faction = "Generic",
    },
    ["AIR SUPPORT"] = {
      name = "Air Support",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134030778/90E5CEF9833FED1C5F926FB8878BDBCD5B5099F6/",
      pip = 2,
      faction = "Republic",
    },
    ["AMBUSH"] = {
      name = "Ambush",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865564037146/9E4C2F5453A9016854F388BB078666B71AC794B6/",
      pip = 1,
      faction = "Generic",
    },
    ["ARBOREAL ASSAULT"] = {
      name = "Arboreal Assault",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133750252/A4F22646BC91929E2F3E36D040C0A4D0F27F033D/",
      pip = 1,
      faction = "Rebel",
    },
    ["ASSAULT"] = {
      name = "Assault",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865564034224/40364C1DDCF973A233C4A8F7AD43734067014C06/",
      pip = 3,
      faction = "Generic",
    },
    ["ATTACK OF THE CLONES"] = {
      name = "Attack Of the Clones",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385134033797/3AA33B36A7B9EAAC8444A6CAC176F2130EE30E6C/",
      pip = 3,
      faction = "Republic",
    },
    ["CONSTANTLY ALERT"] = {
      name = "Constantly Alert",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384868501/99A8C4CE7856BD520F6B2E6AC72B50B58C05C7A7/",
      pip = 3,
      faction = "Empire",
    },
    ["COORDINATED FIRE"] = {
      name = "Coordinated Fire",
      image = "https://steamusercontent-a.akamaihd.net/ugc/11160049064172830842/F5BA2BA3243EE715B976CFF0CF6645D9B34563D3/",
      pip = 3,
      faction = "Empire",
    },
    ["COURAGE OF THE REBELLION"] = {
      name = "Courage of the Rebellion",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133709102/E61A46B9D30667B88527057B1A64B625F3BACAC9/",
      pip = 2,
      faction = "Rebel",
    },
    ["COVERING FIRE"] = {
      name = "Covering Fire",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133709439/D3EB5EB8A70E3BD95C4FE7EDAB952C2A9830159F/",
      pip = 3,
      faction = "Rebel",
    },
    ["COVERT OBSERVATION"] = {
      name = "Covert Observation",
      image = "https://steamusercontent-a.akamaihd.net/ugc/11077054665663790039/843089A1DD7F8F54FE9CE60752F15FFC586B1DB2/",
      pip = 1,
      faction = "Empire",
    },
    ["DARING DEFENSE"] = {
      name = "Daring Defense",
      image = "https://steamusercontent-a.akamaihd.net/ugc/12871643868680759199/5CC33092968E7DE16416344B01D7BC76211DB23E/",
      pip = 3,
      faction = "Republic",
    },
    ["DEBARK FOR GROUND ASSAULT"] = {
      name = "Debark for Ground Assault",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384868777/F190CCA4D8E0732DDDC0C2BF6B14650B03C6DAA1/",
      pip = 3,
      faction = "Empire",
    },
    ["DEFIANCE"] = {
      name = "Defiance",
      image = "https://steamusercontent-a.akamaihd.net/ugc/14615871148955326200/5C4A46932D48C89AC97B650847429D97701993D7/",
      pip = 1,
      faction = "Republic",
    },
    ["DELAYING TACTICS"] = {
      name = "Delaying Tactics",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133709526/A9486B47C4C1BED73083F4069E794A86E0FF708D/",
      pip = 1,
      faction = "Rebel",
    },
    ["DISCRETION"] = {
      name = "Discretion",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385139727608/7FBDB2A3BEECFA85A5AB92E6D6DEC029E779DB31/",
      pip = 3,
      faction = "Generic",
    },
    ["DRIVE THEM OUT"] = {
      name = "Drive Them Out",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384885638/0E4718AEA75A6E87988B03768F30D55BBAF150C6/",
      pip = 1,
      faction = "Empire",
    },
    ["FOR THE TRIBE"] = {
      name = "For the Tribe",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133750350/A56DBAF5154B106C429885A598899D03A3A37525/",
      pip = 3,
      faction = "Rebel",
    },
    ["GET IN POSITION"] = {
      name = "Get In Position",
      image = "https://steamusercontent-a.akamaihd.net/ugc/17056187462617014571/3898DDC0BF25F87D73C3F40CDA7AA52DDB6CD765/",
      pip = 2,
      faction = "Republic",
    },
    ["GRROOOOGRRRAAAAWRRRRRRRRMPH"] = {
      name = "Grroooogrrraaaawrrrrrrrrmph",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865564036626/BA48B6895086D9FA7DA76D6CC2CB6D625CD1B7C6/",
      pip = 1,
      faction = "Republic",
    },
    ["HIDING IN PLAIN SIGHT"] = {
      name = "Hiding in Plain Sight",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133750416/5EF67EC8B9A28231AA10411A62FF5DDD0A95EF51/",
      pip = 2,
      faction = "Rebel",
    },
    ["HOLD AT ANY COST"] = {
      name = "Hold at Any Cost",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133710068/45014708453E80B4389733FE14A889B5C99496EB/",
      pip = 3,
      faction = "Rebel",
    },
    ["LEAD FROM THE FRONT"] = {
      name = "Lead from the Front",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384886540/66FE45A7B081F95DE3DAD94BD3F419013A77A733/",
      pip = 2,
      faction = "Republic",
    },
    ["LEADERS OF THE 501ST"] = {
      name = "Leaders of the 501st",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384886698/41DC9E2547F47EEA11B6DEC9AE7AC677CF1FBAAD/",
      pip = 3,
      faction = "Republic",
    },
    ["LOG TRAPS"] = {
      name = "Log Traps",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133752458/BF28419A06690AC846A210B34221AC931BC890B6/",
      pip = 1,
      faction = "Rebel",
    },
    ["MROWGH GHRRMROWRIG!"] = {
      name = "MROWGH GHRRMROWRIG!",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865564035071/5DAC9F1B36A1D6CCF3DB6BF0CB95D9D548A79F30/",
      pip = 2,
      faction = "Republic",
    },
    ["MECHANIZED INCURSION"] = {
      name = "Mechanized Incursion",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131525764/985E35D1F4C14B36C2DDE31CD8426CD3F9499744/",
      pip = 1,
      faction = "Separatist",
    },
    ["ORBITAL STRIKE"] = {
      name = "Orbital Strike",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131525802/A728666B0EE576499983022E283BD20396880699/",
      pip = 2,
      faction = "Separatist",
    },
    ["OVERWHELMING BARRAGE"] = {
      name = "Overwhelming Barrage",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384886936/A2D77342B1EE6DD9E4413C3F2344E37694BD7CFB/",
      pip = 2,
      faction = "Empire",
    },
    ["PINNED DOWN"] = {
      name = "Pinned Down",
      image = "https://steamusercontent-a.akamaihd.net/ugc/13986899663843994273/C86535A24E53CB437CF5E6DFB02A6FCF21E1EC63/",
      pip = 2,
      faction = "Empire",
    },
    ["PLOY"] = {
      name = "Ploy",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385148677058/419EFF83F969C131102CF0C1B4407F7F9920EF30/",
      pip = 1,
      faction = "Generic",
    },
    ["PUSH"] = {
      name = "Push",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865564034819/0E3D77E869D24AD638EB438F92577F44368487D3/",
      pip = 2,
      faction = "Generic",
    },
    ["ROGER, ROGER!"] = {
      name = "Roger, Roger!",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131525839/61442FE7510A1E55554FABC1937020A1143104F1/",
      pip = 3,
      faction = "Separatist",
    },
    ["SABOTAGED COMMUNICATIONS"] = {
      name = "Sabotaged Communications",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133712792/1E85BFDAD9BED16CED509629CF66A9E4A24A208A/",
      pip = 1,
      faction = "Rebel",
    },
    ["STANDING ORDERS"] = {
      name = "Standing Orders",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865564032760/662157DB1D462926F585301B5D6003D6B8172F14/",
      pip = 4,
      faction = "Generic",
    },
    ["SYNCHRONIZED OFFENSIVE"] = {
      name = "Synchronized Offensive",
      image = "https://steamusercontent-a.akamaihd.net/ugc/10804385135269254/75501E93209B73709745D7E629DBE9389A2984A8/",
      pip = 1,
      faction = "Republic",
    },
    ["TACTICAL PLANNING"] = {
      name = "Tactical Planning",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384887489/3F2A0B433374DA6A7F3EAF67C27E112900C0621B/",
      pip = 2,
      faction = "Republic",
    },
    ["TURNING THE TIDE"] = {
      name = "Turning The Tide",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081133714141/B32483DB97F481A24CA78CB828326E29DCBDFBB4/",
      pip = 2,
      faction = "Rebel",
    },
    ["UNRELENTING ASSAULT"] = {
      name = "Unrelenting Assault",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131527688/D4BA941B65A6BB4EB1F08EE5D23C987317D50D8C/",
      pip = 2,
      faction = "Separatist",
    },
    ["UNRELENTING FIRE"] = {
      name = "Unrelenting Fire",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384887817/303CF3E31F3AB63B96FD87FB72AB3371F2BA3B2A/",
      pip = 1,
      faction = "Empire",
    },
    ["UNSTOPPABLE ADVANCE"] = {
      name = "Unstoppable Advance",
      image = "https://steamusercontent-a.akamaihd.net/ugc/59218081131527719/02ACE80E8D14CF7DC017156A128F34A09F725CF2/",
      pip = 3,
      faction = "Separatist",
    },
    ["WE NEED REINFORCEMENTS"] = {
      name = "We Need Reinforcements",
      image = "https://steamusercontent-a.akamaihd.net/ugc/2495640747384887939/7411A8717918A7824BA095188603EC11D9275FBE/",
      pip = 2,
      faction = "Empire",
    },
    ["YHWARGGHHHHHHHHHH!"] = {
      name = "YHWARGGHHHHHHHHHH!",
      image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865564032878/3AE933EA5F364FC236D8502BA96FF1FC6AA9FA27/",
      pip = 3,
      faction = "Republic",
    },
  },
  battlefield = {
    standard = {
      objective = {
        ["MARKED TARGETS"] = {
          name = "Marked Targets",
          image = "https://steamusercontent-a.akamaihd.net/ugc/11843919298206935699/A3B1D5201F36075D53E0ACE69E0C1ED6AFB4DD22/",
          type = "vertical",
          additionalObjects = {
            "Victory Token",
            "Victory Token",
            "Victory Token",
            "Victory Token",
            "Victory Token",
            "Victory Token",
            "Victory Token",
            "Victory Token",          
          },
        },
        ["SWEEP AND CLEAR"] = {
          name = "Sweep and Clear",
          image = "https://steamusercontent-a.akamaihd.net/ugc/12307394332451477333/DF65C02CC017BD25A960FC2A737AE28829325CD2/",
          type = "vertical",
        },
        ["BRING THEM TO HEEL"] = {
          name = "Bring Them to Heel",
          image = "https://steamusercontent-a.akamaihd.net/ugc/16790576095549234351/278EA3877E97AD155ADA4602D42DF023B7CEB78B/",
          type = "vertical",
        },
        ["SURFACE SCAN"] = {
          name = "Surface Scan",
          image = "https://steamusercontent-a.akamaihd.net/ugc/16343945853969639984/24ABD9DF34B74E343BD4F79D9461385D76C0CD88/",
          type = "vertical",
          additionalObjects = {
            "Objective Token",
            "Objective Token",
            "Objective Token",
            "Objective Token",          
          },
        },
        ["DESTROY ENEMY BASE"] = {
          name = "Destroy Enemy Base",
          image = "https://steamusercontent-a.akamaihd.net/ugc/15702722297992072119/D6071563AAC98F86DDD790E6DE034350EEF17F5F/",
          type = "vertical",
          additionalObjects = {
            "Objective Token",
            "Objective Token",
            "POI Token",
            "POI Token",          
          },
        },
        ["RECON MISSION"] = {
          name = "Recon Mission",
          image = "https://steamusercontent-a.akamaihd.net/ugc/18385343105541227063/7F990BB73C8675734EB02873157F392EA265DC20/",
          type = "vertical",
          additionalObjects = {
            "Objective Token",
            "Objective Token",          
          },
        },
      },
      deployment = {
        ["CLOSE THE POCKET"] = {
          name = "Close the Pocket",
          image = "https://steamusercontent-a.akamaihd.net/ugc/17314598212129638590/62EB33594611850FEBF0567D57ABA8CFB8077091/",
          type = "vertical",
          zone = {
            {
              "r",
              "r",
              "r",
              "rs",
              " ",
              " ",
              " ",
              " ",
              "rss",
              "r",
              "r",
              "r",
            },
            {
              "rh",
              "rh",
              "rh",
              "rc",
              " ",
              " ",
              " ",
              " ",
              "rcc",
              "rh",
              "rh",
              "rh",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              "bh",
              "bh",
              "bh",
              "bcc",
              " ",
              " ",
              " ",
              " ",
              "bc",
              "bh",
              "bh",
              "bh",
            },
            {
              "b",
              "b",
              "b",
              "bss",
              " ",
              " ",
              " ",
              " ",
              "bs",
              "b",
              "b",
              "b",
            },          
          },
          additionalObjects = {
            "Close the Pocket Map",
            "POI Token",
            "POI Token",
            "POI Token",          
          },
        },
        ["BUNKER ASSAULT"] = {
          name = "Bunker Assault",
          image = "https://steamusercontent-a.akamaihd.net/ugc/16995954044322736468/0D0086DE04A57350DF77F62FDEC94F5148B7C4D5/",
          type = "vertical",
          zone = {
            {
              " ",
              " ",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              " ",
              " ",
            },
            {
              " ",
              " ",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              " ",
              " ",
            },
            {
              " ",
              " ",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              " ",
              " ",
            },          
          },
          additionalObjects = {
            "Bunker Assault Map",
            "POI Token",
            "POI Token",
            "POI Token",
            "POI Token",          
          },
        },
        ["BREAKTHROUGH"] = {
          name = "Breakthrough",
          image = "https://steamusercontent-a.akamaihd.net/ugc/9648599321290140597/26C606119E07DCACAAF07B1F5429CB9A03EC59F3/",
          type = "vertical",
          zone = {
            {
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              " ",
              " ",
              " ",
            },
            {
              "r",
              "rl",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              " ",
              " ",
              " ",
            },
            {
              "r",
              "rs",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "bc",
              "bh",
            },
            {
              "rh",
              "rc",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "bs",
              "b",
            },
            {
              " ",
              " ",
              " ",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bl",
              "b",
            },
            {
              " ",
              " ",
              " ",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
            },          
          },
          additionalObjects = {
            "Breakthrough Map",
            "POI Token",
            "POI Token",
            "POI Token",
            "POI Token",          
          },
        },
        ["INTERCEPT SIGNALS"] = {
          name = "Intercept Signals",
          image = "https://steamusercontent-a.akamaihd.net/ugc/13661793580985225615/BB706B264CE5C71456271DE54E765EC27EA6F786/",
          type = "vertical",
          zone = {
            {
              " ",
              " ",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              " ",
              " ",
            },
            {
              " ",
              " ",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              " ",
              " ",
            },
            {
              " ",
              " ",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              " ",
              " ",
            },          
          },
          additionalObjects = {
            "Intercept Signals Map",
            "POI Token",
            "POI Token",
            "POI Token",
            "POI Token",          
          },
        },
        ["RECOVER THE RESEARCH"] = {
          name = "Recover the Research",
          image = "https://steamusercontent-a.akamaihd.net/ugc/16282482143036636007/FD7F429F82E2F61B9EC390C9FBAB6782B26D8507/",
          type = "vertical",
          zone = {
            {
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              " ",
              " ",
              " ",
            },
            {
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
            },
            {
              " ",
              " ",
              " ",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
            },          
          },
          additionalObjects = {
            "Recover the Research Map",
            "POI Token",
            "POI Token",
            "POI Token",
            "POI Token",
            "POI Token",
            "POI Token",          
          },
        },
        ["SHIFTING PRIORITIES"] = {
          name = "Shifting Priorities",
          image = "https://steamusercontent-a.akamaihd.net/ugc/16497333789704302385/06FFACF38887F17BF4E0351DA7ED0D22CE26AEC7/",
          type = "vertical",
          zone = {
            {
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              " ",
              " ",
              " ",
            },
            {
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              "rh",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
              "bh",
            },
            {
              " ",
              " ",
              " ",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
            },          
          },
          additionalObjects = {
            "Shifting Priorities Map",
            "POI Token",
            "POI Token",
            "POI Token",
            "POI Token",
            "POI Token",          
          },
        },
      },
      condition = {
        ["ADVANCED INTEL"] = {
          name = "Advanced Intel",
          image = "https://steamusercontent-a.akamaihd.net/ugc/13272907091260444770/243391B61F192F53AA7CF0360D3F846C7A7A0A97/",
          type = "vertical",
          additionalObjects = {
            "Condition Token",          
          },
        },
        ["FORTIFIED POSITION"] = {
          name = "Fortified Position",
          image = "https://steamusercontent-a.akamaihd.net/ugc/16927846453234643948/97D5A7F0E4C9D3DAB14C3754AC3A484C15CE3567/",
          type = "vertical",
          additionalObjects = {
            "Barricade",
            "Barricade",
            "Barricade",          
          },
        },
        ["CUNNING DEPLOYMENT"] = {
          name = "Cunning Deployment",
          image = "https://steamusercontent-a.akamaihd.net/ugc/14925552919945327142/06659E9120D6246C6048165ECDE9F5F5AEA7A5EB/",
          type = "vertical",
          additionalObjects = {
            "Dodge Token",
            "Dodge Token",
            "Dodge Token",          
          },
        },
        ["GARRISON"] = {
          name = "Garrison",
          image = "https://steamusercontent-a.akamaihd.net/ugc/11060842461995269445/3EC4678860C9AD82F7912D3FC3A56A519BCA3CEE/",
          type = "vertical",
          additionalObjects = {
            "Condition Token",          
          },
        },
        ["ORDNANCE"] = {
          name = "Ordnance",
          image = "https://steamusercontent-a.akamaihd.net/ugc/12637307440348267234/446B8F97B7C1EF2452E5B4DD6AF36FC1BAAD7FA2/",
          type = "vertical",
          additionalObjects = {
            "Objective Token",          
          },
        },
        ["STRAFING RUN"] = {
          name = "Strafing Run",
          image = "https://steamusercontent-a.akamaihd.net/ugc/16276132125547808705/8A61415CDD0F2E20417F6D8371858B206FA0A775/",
          type = "vertical",
          additionalObjects = {
            "Objective Token",          
          },
        },
      },
    },
    blitz = {
      objective = {
        ["BOMBING RUN"] = {
          name = "Bombing Run",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865566152284/34FB45C5D924F9975C35E307B36C42AD2F8153DB/",
          type = "horizontal",
          additionalObjects = {
            "Objective Token",
            "Objective Token",
            "Objective Token",
            "Objective Token",
            "Objective Token",
            "Objective Token",          
          },
        },
        ["BREAKTHROUGH"] = {
          name = "Breakthrough",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865566152228/97E7C41CF4591B0909E9F8A5692193FDE83D4756/",
          type = "horizontal",
        },
        ["HOSTAGE EXCHANGE"] = {
          name = "Hostage Exchange",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865566152166/E56E902183803EC15BFA3E84548C9F85B3EF5DC2/",
          type = "horizontal",
          additionalObjects = {
            "Hostage Deck",
            "Objective Token",
            "Objective Token",          
          },
        },
        ["INTERCEPT THE TRANSMISSIONS"] = {
          name = "Intercept The Transmissions",
          image = "https://steamusercontent-a.akamaihd.net/ugc/2094796397712554781/B6AD631AEEC48E4473426C34888E1A1B79A011C6/",
          type = "horizontal",
          additionalObjects = {
            "Objective Token",
            "Objective Token",
            "Objective Token",          
          },
        },
        ["KEY POSITIONS"] = {
          name = "Key Positions",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865566152103/6BF1CD3BC8EA028CA31C3EE21FA87E28AC992873/",
          type = "horizontal",
          additionalObjects = {
            "Objective Token",
            "Objective Token",
            "Objective Token",          
          },
        },
        ["PAYLOAD"] = {
          name = "Payload",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865566152051/1D6BFDBA0D76170AE1EB3129C5B589DE5426EB14/",
          type = "horizontal",
          additionalObjects = {
            "Bomb Cart",
            "Bomb Cart",          
          },
        },
        ["RECOVER THE SUPPLIES"] = {
          name = "Recover The Supplies",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865566152002/C2C470607C4006FD51F83854CEA2093BA206222D/",
          type = "horizontal",
          additionalObjects = {
            "Objective Token",
            "Objective Token",
            "Objective Token",
            "Objective Token",
            "Objective Token",          
          },
        },
        ["SABOTAGE THE MOISTURE VAPORATORS"] = {
          name = "Sabotage The Moisture Vaporators",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865566151946/368BA0B7F0BBD659B37D6BE6781E01FECCDCB5E6/",
          type = "horizontal",
          additionalObjects = {
            "Objective Token",
            "Objective Token",
            "Objective Token",
            "Objective Token",          
          },
        },
      },
      deployment = {
        ["ADVANCED POSITIONS"] = {
          name = "Advanced Positions",
          image = "https://steamusercontent-a.akamaihd.net/ugc/2094796397702918693/AE8363351402BC55707F1DD2A589650E19B0263B/",
          type = "horizontal",
          zone = {
            {
              " ",
              " ",
              " ",
              "r",
              "r",
              "r",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              "b",
              "b",
              " ",
              " ",
              " ",
            },          
          },
        },
        ["BATTLE LINES"] = {
          name = "Battle Lines",
          image = "https://steamusercontent-a.akamaihd.net/ugc/2094796397702918815/139CE233ACEFA51872404741852721F076C47B0F/",
          type = "horizontal",
          zone = {
            {
              " ",
              " ",
              " ",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              " ",
              " ",
              " ",
            },          
          },
        },
        ["DANGER CLOSE"] = {
          name = "Danger Close",
          image = "https://steamusercontent-a.akamaihd.net/ugc/2094796397702918918/BA6FDAF4E07773CCD202073C9C5451C39955AF77/",
          type = "horizontal",
          zone = {
            {
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              "b",
              "b",
              "b",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
              " ",
              "b",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
              " ",
              "b",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
              " ",
              "b",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
              " ",
              "b",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              "r",
              "r",
              " ",
              " ",
              "b",
              " ",
              " ",
              " ",
            },          
          },
        },
        ["DISARRAY"] = {
          name = "Disarray",
          image = "https://steamusercontent-a.akamaihd.net/ugc/2094796397702919022/BDC2741D424E582027A471BA7D46CA3640ADC274/",
          type = "horizontal",
          zone = {
            {
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
              "b",
              "b",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "b",
              "b",
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
            },          
          },
        },
        ["HEMMED IN"] = {
          name = "Hemmed In",
          image = "https://steamusercontent-a.akamaihd.net/ugc/2094796397702919191/28C57E7D8E553AB4F725F17C93CEBDAC806D9C78/",
          type = "horizontal",
          zone = {
            {
              " ",
              " ",
              " ",
              "r",
              "r",
              " ",
              " ",
              "r",
              "r",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              "b",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              "b",
              " ",
              " ",
              " ",
              " ",
              " ",
            },          
          },
        },
        ["THE LONG MARCH"] = {
          name = "The Long March",
          image = "https://steamusercontent-a.akamaihd.net/ugc/2474241114697108468/BAA15960E591B3B68E1E121A374C9C379BD9D4AF/",
          type = "horizontal",
          zone = {
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              "b",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              "r",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },          
          },
        },
        ["MAJOR OFFENSIVE"] = {
          name = "Major Offensive",
          image = "https://steamusercontent-a.akamaihd.net/ugc/2094796397702919381/AD7188D6FC9D337BC83F23CC482EB374F5021115/",
          type = "horizontal",
          zone = {
            {
              " ",
              " ",
              " ",
              "r",
              "r",
              "r",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              "b",
              "b",
              " ",
              " ",
              " ",
            },          
          },
        },
        ["ROLL OUT"] = {
          name = "Roll Out",
          image = "https://steamusercontent-a.akamaihd.net/ugc/2094796397702919479/0B6DF3A3F6CD3339F39F655CF770E9C783F48440/",
          type = "horizontal",
          zone = {
            {
              " ",
              " ",
              " ",
              "r",
              "r",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              "r",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              "b",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              "b",
              " ",
              " ",
              " ",
            },          
          },
        },
      },
      condition = {
        ["CLEAR CONDITIONS"] = {
          name = "Clear Conditions",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865566151419/955CCA2E7134CBE4FEF69C62F148FFFCCAE1A577/",
          type = "horizontal",
        },
        ["FORTIFIED POSITIONS"] = {
          name = "Fortified Positions",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865566151371/BAA93356D59B37199A3C468013F6A5E0CD0413FB/",
          type = "horizontal",
          additionalObjects = {
            "Barricade",
            "Barricade",
            "Barricade",
            "Barricade",
            "Barricade",
            "Barricade",
            "Barricade",
            "Barricade",          
          },
        },
        ["HOSTILE ENVIRONMENT"] = {
          name = "Hostile Environment",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865566151285/4B44EC69671E90D90000BB99A45500D85196E92C/",
          type = "horizontal",
        },
        ["LIMITED VISIBILITY"] = {
          name = "Limited Visibility",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865566151238/46E6A35C7DBC3956A042707ADED4D3E7999D1792/",
          type = "horizontal",
        },
        ["MINEFIELD"] = {
          name = "Minefield",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865566151174/7BF21B789BA2A715EE474286DBB98A30D7FED51A/",
          type = "horizontal",
          additionalObjects = {
            "Condition Token",
            "Condition Token",
            "Condition Token",
            "Condition Token",          
          },
        },
        ["RAPID REINFORCEMENTS"] = {
          name = "Rapid Reinforcements",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865566151116/18451A85E7201070C4E0D96F72FD5D8BE4377B80/",
          type = "horizontal",
          additionalObjects = {
            "Condition Token",
            "Condition Token",
            "Condition Token",
            "Condition Token",          
          },
        },
        ["SUPPLY DROP"] = {
          name = "Supply Drop",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1680393865566151068/9801B093E60171C3AC7E5F4D447ADF27D7E9DC1F/",
          type = "horizontal",
          additionalObjects = {
            "Supply Deck",
            "Condition Token",
            "Condition Token",
            "Condition Token",
            "Condition Token",
            "Condition Token",
            "Condition Token",          
          },
        },
        ["WAR WEARY"] = {
          name = "War Weary",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1860546411028298787/A02438F159B74E38AAC0F8906EDB3EB356438228/",
          type = "horizontal",
        },
      },
    },
    skirmish = {
      objective = {
        ["BREACH"] = {
          name = "Breach",
          image = "https://steamusercontent-a.akamaihd.net/ugc/4112341331071279492/85477A894623DDA23BC182995DAF396671A0C007/",
          type = "vertical",
        },
        ["CONTROL"] = {
          name = "Control",
          image = "https://steamusercontent-a.akamaihd.net/ugc/4112341331071279456/10F29ECE1579A06D7DC564A6480F2BE27CC6EF04/",
          type = "vertical",
          additionalObjects = {
            "Objective Token",          
          },
        },
        ["ELIMINATION"] = {
          name = "Elimination",
          image = "https://steamusercontent-a.akamaihd.net/ugc/4112341331071279416/6160501F308751CB9266FF991FF62E1409058C4B/",
          type = "vertical",
        },
        ["PIVOTAL POSITIONS"] = {
          name = "Pivotal Positions",
          image = "https://steamusercontent-a.akamaihd.net/ugc/4112341331071279382/6E006F31C9D5200AAA94392D94C2AE78EE4D73C7/",
          type = "vertical",
          additionalObjects = {
            "Objective Token",
            "Objective Token",
            "Objective Token",          
          },
        },
      },
      deployment = {
        ["BATTLE LINES"] = {
          name = "Battle Lines",
          image = "https://steamusercontent-a.akamaihd.net/ugc/4112341331071279345/8A96884057E13BF488E89177C2B9CCB0ADDDFFE0/",
          type = "vertical",
          zone = {
            {
              " ",
              " ",
              " ",
              "r",
              "r",
              "r",
              "r",
              "r",
              "r",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "b",
              "b",
              "b",
              "b",
              "b",
              "b",
              " ",
              " ",
              " ",
            },          
          },
        },
        ["FACEOFF"] = {
          name = "Faceoff",
          image = "https://steamusercontent-a.akamaihd.net/ugc/4112341331071279307/F41700690107CC7398BD5B95CDED30B041538517/",
          type = "vertical",
          zone = {
          
          },
        },
        ["FLANKING POSITIONS"] = {
          name = "Flanking Positions",
          image = "https://steamusercontent-a.akamaihd.net/ugc/4112341331071279273/0D6B1CF6762E532AA4C0D039C2CC96F0E25A419F/",
          type = "vertical",
          zone = {
            {
              " ",
              " ",
              " ",
              "r",
              "r",
              "r",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              "b",
              "b",
              " ",
              " ",
              " ",
            },          
          },
        },
        ["MEETING ENGAGEMENT"] = {
          name = "Meeting Engagement",
          image = "https://steamusercontent-a.akamaihd.net/ugc/4112341331071279232/4F4C1C54E5DCE9FD1E9C46BB75379AEF60E2DAFC/",
          type = "vertical",
          zone = {
            {
              " ",
              " ",
              " ",
              "r",
              "r",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              "r",
              "r",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              "b",
              " ",
              " ",
              " ",
            },
            {
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              " ",
              "b",
              "b",
              " ",
              " ",
              " ",
            },          
          },
        },
      },
      condition = {
        ["WAR WEARY"] = {
          name = "War Weary",
          image = "https://steamusercontent-a.akamaihd.net/ugc/4112341331071279193/052C3637BE4F31FAA691235E186CC73B1CE928F7/",
          type = "vertical",
        },
        ["IMPROVISED DEFENSES"] = {
          name = "Improvised Defenses",
          image = "https://steamusercontent-a.akamaihd.net/ugc/4112341331071279155/3F72099B06947F23231D8B2228D25C63E01FED92/",
          type = "vertical",
          additionalObjects = {
            "Barricade",
            "Barricade",
            "Barricade",
            "Barricade",          
          },
        },
        ["DAWN"] = {
          name = "Dawn",
          image = "https://steamusercontent-a.akamaihd.net/ugc/4112341331071279122/1952ADAEF00EAAF039C3D0C160AABF3BD4F7B0E1/",
          type = "vertical",
        },
        ["CLEAR CONDITIONS"] = {
          name = "Clear Conditions",
          image = "https://steamusercontent-a.akamaihd.net/ugc/4112341331071279082/F2116A3FBAB46DAD85EE43AB1CBF9497C567B2A8/",
          type = "vertical",
        },
      },
    },
    scenario = {
    },
    community = {
    },
  },
  objects = {
    ["Aim Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314442508/5CF014A3E962C6116B3B910C8BE44FE1C8FCA1D2/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359883314442626/A2574B5726D1DE612FF4F2464A2315C7C85759D1/",      
      },
      target = "unit",    
    },
    ["Bane Token: Blank"] = {
      token = {
        name = "Bane Token",
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314441337/A0DD41660FEC7E450F2EDF38191AF3C26E826C49/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/1055478574362401130/E1FA2715959E37138C25B4B36FB963149643DAA6/",      
      },
      target = "table",
      scripted = "toggle-range-1",    
    },
    ["Bane Token: Bomb"] = {
      token = {
        name = "Bane Token",
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314441337/A0DD41660FEC7E450F2EDF38191AF3C26E826C49/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/1055478574362399079/B91760D0E7895797EBF0320BFC752F5DC04A5962/",      
      },
      target = "table",
      scripted = "toggle-range-1",    
    },
    ["Bane Token: Bane"] = {
      token = {
        name = "Bane Token",
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314441337/A0DD41660FEC7E450F2EDF38191AF3C26E826C49/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/1055478574362319474/84ACA1633B9C944D709B8770A251A629FF05ACBA/",      
      },
      target = "table",
      scripted = "toggle-range-1",    
    },
    Barricade = {
      model = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785234540542429589/F10F499F8D061EFA2C4C696641235D706E4C0974/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785234540542379040/149A4BEBD1F20D82737DB21773B93C52BC30DF78/",
        collider = "https://steamusercontent-a.akamaihd.net/ugc/785234540542430072/AA329530B252DDE7329AC70F9A98502F7875400C/",      
      },
      type = "terrain",    
    },
    ["Bomb Cart"] = {
      model = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/1002556529493751157/9D26DC64BAAB57A2EC4CCB04016AFEC660256685/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/1002556529493751537/4CC48BB4450924701366C8EDED262930F423E4AB/",
        collider = "https://steamusercontent-a.akamaihd.net/ugc/785234540540671597/B477FDC4D3200384E974945C2974ABFEFA566166/",      
      },
      type = "custom",
      scripted = "bomb-cart",    
    },
    ["Commander Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314443431/097A439FFEDF419BAA723FB00918F6A8188D390D/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359883314443535/51A0B4A9A3A230825DFAB81B6AA97ED36C85E420/",      
      },
      target = "unit",
      stacks = false,    
    },
    ["Complete the Mission Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314441337/A0DD41660FEC7E450F2EDF38191AF3C26E826C49/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/59217531460146495/B6325E11EB42C5840441BFE640F913BD3C57A832/",      
      },
      target = "table",
      stacks = false,
      scripted = "toggle-range-1",    
    },
    ["Condition Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314441337/A0DD41660FEC7E450F2EDF38191AF3C26E826C49/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786360308354563594/D7CA9A23D1F8610544A092594F1CFF19C8C0A578/",      
      },
      target = "table",
      stacks = false,
      scripted = "toggle-range-1",    
    },
    ["Damaged Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314442142/E2BBDA84DFF104080284F15909B71C8F125DA50F/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359883314442381/27F7A3A2E3687E52F3576BF9A1E1A12CFD0267FD/",      
      },
      target = "unit",
      stacks = false,    
    },
    ["Disabled Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314442142/E2BBDA84DFF104080284F15909B71C8F125DA50F/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359883314442275/B66CD8AB21D41AAE360DCF69A8F58E418CE0FBF3/",      
      },
      target = "unit",
      stacks = false,    
    },
    ["Dodge Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314442740/91C08C293B53CCF3D104B0472B60ECF7BF4B613E/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359883314442875/553BAF41BE032BCE7282C4DECB180B5410AC7226/",      
      },
      target = "unit",    
    },
    ["Graffiti Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314441337/A0DD41660FEC7E450F2EDF38191AF3C26E826C49/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717874061240/B449ED876CF0B2455BBCEE1E22CDEFFC12EDCBF8/",      
      },
      target = "terrain",
      stacks = false,    
    },
    ["Hostage Deck"] = {
      cards = {
        {
          name = "Hostage",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1773847942315486174/6A01D6080A44D121D4DFCFFAD82EC4F9073C79AF/",
        },
        {
          name = "Hostage",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1773847942315486113/545C3FA50BADD14C160FA3DA555E2DEB8DA87E68/",
        },      
      },    
    },
    ["Immobilize Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314442992/DD893F407D50F2D029305A2F181989F90E3FA46A/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359883314446126/CCD2483A716B81931D26829BF205D6C0CB0196CD/",      
      },
      target = "unit",    
    },
    ["Incognito Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314441337/A0DD41660FEC7E450F2EDF38191AF3C26E826C49/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/1777200555359102353/86DFA2C0B4428415B5765DE845A19BC78EC70050/",      
      },
      target = "unit",
      stacks = false,    
    },
    ["Ion Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314442992/DD893F407D50F2D029305A2F181989F90E3FA46A/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359883314443114/1C858EEC4B7A2247AA506EC699FF65D7C72E5484/",      
      },
      target = "unit",    
    },
    ["Observation Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314442992/DD893F407D50F2D029305A2F181989F90E3FA46A/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/1777200555359034130/1D014D75BCE30D49638FC9C0CA5E1BDC9B4DFAE0/",      
      },
      target = "unit",    
    },
    ["Objective Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314441337/A0DD41660FEC7E450F2EDF38191AF3C26E826C49/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359883314441567/9502856DC8B0CEDD3D8316346FAD22C7BB8ADBF7/",      
      },
      target = "table",
      stacks = false,
      scripted = "toggle-range-1",    
    },
    ["Operative Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314441337/A0DD41660FEC7E450F2EDF38191AF3C26E826C49/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/1019446639705431555/05F948CC883AFC3BDBDA8F8485957731EE29AF03/",      
      },
      target = "unit",
      stacks = false,    
    },
    ["Panic Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314442142/E2BBDA84DFF104080284F15909B71C8F125DA50F/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359883314444049/7A5C1C3F824FDE5C14596782B4DCC628F9846334/",      
      },
      target = "unit",
      stacks = false,    
    },
    ["Poison Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314442992/DD893F407D50F2D029305A2F181989F90E3FA46A/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717874061462/2C7252E4C3030E3640741560C7C24E55950EF332/",      
      },
      target = "unit",    
    },
    ["Proton Charge Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314441337/A0DD41660FEC7E450F2EDF38191AF3C26E826C49/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359883314446398/425766A72D25CEB4F0E9C8BED9FCFDD68109D4B7/",      
      },
      target = "table",
      stacks = false,
      scripted = "toggle-range-1",    
    },
    ["Shield Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314441337/A0DD41660FEC7E450F2EDF38191AF3C26E826C49/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717874061363/FC8A9E131548DC42D21D9748015A67D8235BDA93/",      
      },
      target = "unit",    
    },
    ["Smoke Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314441337/A0DD41660FEC7E450F2EDF38191AF3C26E826C49/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717874061016/BB4832A82AEEA19EE9B1E9498380E7D3850DB0B6/",      
      },
      target = "table",
      stacks = false,
      scripted = "toggle-range-1",    
    },
    ["Standby Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314441910/ED14AA37D66E5E75EA5D6790A50546B1FC105DAC/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359883314442019/EF36C682BC69BB9239DC15B0C52EE6FFACEE19C0/",      
      },
      target = "unit",    
    },
    ["Supply Deck"] = {
      back = "https://steamusercontent-a.akamaihd.net/ugc/1773847942315485602/925B9FA7B35FE1478BAFC4E7314C60288C8819AB/",
      multiples = 2,
      cards = {
        {
          name = "Arc Welder",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1773847942315485990/C3F3B1B5B459DCA2B73598B2CBB178B4C7EE6DC5/",
        },
        {
          name = "Bacta Capsules",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1773847942315486053/CA14B9CD49FD92428F0B2D5050EA5DD25797DB33/",
        },
        {
          name = "Camoflauge",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1773847942315485930/9D9EDF3108F222D53AF43EB41EDD5005FF20ABDE/",
        },
        {
          name = "Field Scanner",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1773847942315485652/63D35175DBB6FC01579253CE0386B30C6D76B796/",
        },
        {
          name = "Grapnel Harpoon",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1773847942315485870/99B837BC86196C56118132AF3B36B710F9FFD87B/",
        },
        {
          name = "Holoprojector",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1773847942315485706/DD7D68FDCAB31B1BD344FE8196A8B21E8FB098D9/",
        },
        {
          name = "Precision Scopes",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1773847942315485814/B5F5B7B897E1C13EFA45120F854D762364BF9DC9/",
        },
        {
          name = "Targeting Rangefinder",
          image = "https://steamusercontent-a.akamaihd.net/ugc/1773847942315485757/734B12CDF6B61ED03B40E35759400C1EB916D3D5/",
        },      
      },    
    },
    ["Suppression Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314443213/E353EC3098CC94615DE0BA5CEF4CE8B298CF7777/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359883314443321/002CBBCACEB0F7497BEA744B8D7B17736A5FF65E/",      
      },
      target = "unit",    
    },
    ["Surge Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/785236717874060749/314173062C289E83F826F78FC7FD0FF0D2E6E418/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/785236717874060915/75B609A561604CAF66D7BD2868211D40F18B74E3/",      
      },
      target = "unit",    
    },
    ["Victory Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314441337/A0DD41660FEC7E450F2EDF38191AF3C26E826C49/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786360308354563474/D727C55A73EC48FBF56D78D188A731FEDDC2635B/",      
      },
      target = "unit",    
    },
    ["Weapon Disrupted Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314442142/E2BBDA84DFF104080284F15909B71C8F125DA50F/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359883314443730/B474A9A42C93151761AFE01AB45DBE5CABA1F451/",      
      },
      target = "unit",
      stacks = false,    
    },
    ["Wheel Mode Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314441337/A0DD41660FEC7E450F2EDF38191AF3C26E826C49/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/780734328492115080/57765C267CCBA4F177CF4C7FBED9B6BA242FB49B/",      
      },
      target = "unit",
      stacks = false,    
    },
    ["Wound Token"] = {
      token = {
        mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314443832/CC490842F0159459C8D5C252BE7225E9D2581951/",
        diffuse = "https://steamusercontent-a.akamaihd.net/ugc/786359883314443935/0F8A37E8CD128D5644B391E4EFEC50656D558FF7/",      
      },
      target = "mini",    
    },
    ["POI Token"] = {
      token = {
        bundle = "https://steamusercontent-a.akamaihd.net/ugc/2482129948495931625/A14C0E047A0C7C8D12B96B34A16D2DAAA3A5E9E3/",      
      },
      target = "table",
      stacks = false,
      scripted = "poi-token",    
    },
    ["Breakthrough Map"] = {
      card = {
        image = "https://steamusercontent-a.akamaihd.net/ugc/16613435332891317382/334404D722726ECE56866DBBF444836E8AC2F3A3/",
        back = "https://steamusercontent-a.akamaihd.net/ugc/2482129948501051192/5A19D255E47E80FF3CCE0EBFA095CB8677C4188D/",      
      },    
    },
    ["Bunker Assault Map"] = {
      card = {
        image = "https://steamusercontent-a.akamaihd.net/ugc/12304553798171400164/69AB4EB2BA8A39D91996852580DCA1AB783913C4/",
        back = "https://steamusercontent-a.akamaihd.net/ugc/2482129948501051483/82F1D1EAA55C5794FD0301E5FADB5EEA3DAEFE49/",      
      },    
    },
    ["Close the Pocket Map"] = {
      card = {
        image = "https://steamusercontent-a.akamaihd.net/ugc/14769093936620373412/BC975CBADAEBD9AA231D83443BE9EDB59FF4308A/",
        back = "https://steamusercontent-a.akamaihd.net/ugc/2482129948501051694/8B05A05A5B24115F84B0A13F6FD392BB5C00E527/",      
      },    
    },
    ["Intercept Signals"] = {
      card = {
        image = "https://steamusercontent-a.akamaihd.net/ugc/12020228019721678387/E635199A7837BC89D679A0D848FB4EA7D7677239/",
        back = "https://steamusercontent-a.akamaihd.net/ugc/2482129948501052240/E4DFCE250EAB2459C05A7C73ED2C47B78DB5D467/",      
      },    
    },
    ["Recover the Research Map"] = {
      card = {
        image = "https://steamusercontent-a.akamaihd.net/ugc/15862931608322641380/4C8D35B94855B94A233EBF9D01FB0D1A0EEE3B32/",
        back = "https://steamusercontent-a.akamaihd.net/ugc/2482129948501052886/30E5BFA96EBC5AFA4197AE40882EC3B576420F51/",      
      },    
    },
    ["Shifting Priorities Map"] = {
      card = {
        image = "https://steamusercontent-a.akamaihd.net/ugc/12429316638634710380/005746FFEA77696118B237B650C7628F9089B946/",
        back = "https://steamusercontent-a.akamaihd.net/ugc/2482129948501052974/0D4D7ECABE727D484B8ECDF44DBA664BBF7E609D/",      
      },    
    },
  },
}

----#include !/generated/cards
----#include !/UI
function initUI()
  UI.setValue("welcomeDialogTitle", "Star Wars Regiment for TTS " .. VERSION)
end

function _toggleDialog(name)
  if UI.getAttribute(name, "active") == "true" then
    UI.hide(name)
  else
    UI.show(name)
  end
end

function toggleWelcomeDialog()
  _toggleDialog("welcomeDialog")
end

function toggleChessClockUI()
  if UI.getAttribute("floatingChessClockUI", "active") == "true" then
    UI.hide("floatingChessClockUI")
    getObjectFromGUID(clockGUIDs.blue).setScale({0, 0, 0})
    getObjectFromGUID(clockGUIDs.red).setScale({0, 0, 0})
  else
    UI.show("floatingChessClockUI")
    getObjectFromGUID(clockGUIDs.blue).setScale({0.7, 0.7, 0.7})
    getObjectFromGUID(clockGUIDs.red).setScale({0.7, 0.7, 0.7})
  end
end

local sideLoadUrl = "https://raw.githubusercontent.com/swlegion/tts/main/contrib/cards/homebrew.json"

function sideLoadUrlChanged(_player, newValue)
  sideLoadUrl = newValue
end

function experimentalSideLoad()
  WebRequest.get(sideLoadUrl, function(data)
    local json = JSON.decode(data.text)
    if json.units then
      local loaded = 0
      for faction, ranks in pairs(json.units) do
        for rank, units in pairs(ranks) do
          for _, unit in ipairs(units) do
            local key = unit.name
            if unit.title then
              key = key .. " " .. unit.title
            end
            unit.rank = rank
            unit.faction = faction
            Global.call("sideLoadUnit", {
              faction = faction,
              key     = key,
              unit    = unit,
            })
            loaded = loaded + 1
          end
        end
      end
      print("Injected " .. tostring(loaded) .. " unit card(s).")
    end
    if json.upgrades then
      local loaded = 0
      for type, upgrades in pairs(json.upgrades) do
        for _, upgrade in ipairs(upgrades) do
          upgrade.type = type
          Global.call("sideLoadUpgrade", {
            name = upgrade.name,
            data = upgrade,
          })
          loaded = loaded + 1
        end
      end
      print("Injected " .. tostring(loaded) .. " upgrades card(s).")
    end
    if json.commands then
      local loaded = 0
      for faction, commands in pairs(json.commands) do
        for _, command in ipairs(commands) do
          command.faction = faction
          Global.call("sideLoadCommand", {
            name = command.name,
            data = command,
          })
          loaded = loaded + 1
        end
      end
      print("Injected " .. tostring(loaded) .. " generic command card(s).")
    end
    if json.battlefield then
      local loaded = 0
      for type, kinds in pairs(json.battlefield) do
        for kind, cards in pairs(kinds) do
          for _, card in ipairs(cards) do
            Global.call("sideLoadBattlefield", {
              name = card.name,
              data = card,
              type = type,
              kind = kind,
            })
            loaded = loaded + 1
          end
        end
      end
      print("Injected " .. tostring(loaded) .. " battlefield card(s).")
    end
    if json.objects then
      local loaded = 0
      for name, data in pairs(json.objects) do
        Global.call("sideLoadObject", {
          name = name,
          data = data,
        })
      end
    end
  end)
end

function showWelcomeTab1()
  UI.show("welcomeTab1")
  UI.hide("welcomeTab2")
  UI.hide("welcomeTab3")
end

function showWelcomeTab2()
  UI.hide("welcomeTab1")
  UI.show("welcomeTab2")
  UI.hide("welcomeTab3")
end

function showWelcomeTab3()
  UI.hide("welcomeTab1")
  UI.hide("welcomeTab2")
  UI.show("welcomeTab3")
end

----#include !/UI
----#include !/RangeRulers
----#include !/data/RangeRulerLinks
function getRangeRulerLinks()
    local rangeRulers  = {}
        -- 27mm
        rangeRulers.small = "https://steamusercontent-a.akamaihd.net/ugc/1848161512056393064/133FD5E0FD2801C320C6F4D271E9860A9383A2D2/"
        -- 50mm
        rangeRulers.medium = "https://steamusercontent-a.akamaihd.net/ugc/1848161512056393102/9F0A824003577BA4AE2CE1AE03ADA4DD7796EBC9/"
        -- 70mm
        rangeRulers.large = "https://steamusercontent-a.akamaihd.net/ugc/1848161512056393137/2B21FA95AD74281B47EC248CB78D5648099E2735/"
        -- 100mm
        rangeRulers.huge = "https://steamusercontent-a.akamaihd.net/ugc/1848161512056393174/580A8DFC2CD970253A93C93197EDE29E2A0D98FA/"
        -- 120mm
        rangeRulers.laat = "https://steamusercontent-a.akamaihd.net/ugc/1848161512056393255/C32C9978B04C009EAD0EDE3DBCA8A508EF4B7EAE/"
        -- 150mm
        rangeRulers.epic = "https://steamusercontent-a.akamaihd.net/ugc/1848161512056393312/B4A26CDF7294AFCBB84D9836593037610519BE2B/"
        -- 100mm oblong
        rangeRulers.long = "https://steamusercontent-a.akamaihd.net/ugc/1848161512056393212/C1D52E052A6F31D212B4E91A3961A29FFCC47DBA/"
        -- 100mm x 200mm oblong
        rangeRulers.snail = "https://steamusercontent-a.akamaihd.net/ugc/2008089545867709463/C4B55BF3BC0F3682F9D024D5C2519BC0166CBADB/"
        -- bomb cart
        rangeRulers.bombCart = "https://steamusercontent-a.akamaihd.net/ugc/1838032857803650871/DB525612CDAF46A18A49B82C57A744E9A1F09D79/"
        -- smoke token
        rangeRulers.smokeToken = "https://steamusercontent-a.akamaihd.net/ugc/1848161512056387710/E5CB0DCCC147802B3E276B5922237171E0D53185/"
        -- charge, objective, condition
        rangeRulers.token = "https://steamusercontent-a.akamaihd.net/ugc/1841415725493967222/CCEB0E06A39A2CB77FF9BCFEF8992F17B6E81C09/"
        -- graffiti token, same as objective but range 2
        rangeRulers.tokenRangeTwo = "https://steamusercontent-a.akamaihd.net/ugc/1841415725493967724/6AB27B28FEAA00EDDBBA9FCCB6BDED249836596A/"
        -- poi token (2" token w/ 3" range)
        rangeRulers.poi = "https://steamusercontent-a.akamaihd.net/ugc/2482129948495938224/AE12E3C12026D934AFE5A96D511D39D385411CEA/"
    return rangeRulers
end
----#include !/data/RangeRulerLinks

function showRangeOnHoveredModel(hoverObject)
  clearRangeRulers()
  if hoverObject then
    if hoverObject.interactable then
      if selectedUnitObj == hoverObject then
        selectedUnitObj = nil
        return
      else
        spawnRangeRuler(hoverObject)
        selectedUnitObj = hoverObject
      end
    end
  else
    selectedUnitObj = nil
  end
end

-- Refactor this to work with the refactored spawnRangeRuler()
function clearRangeRulers()
  if rangeRuler ~= nil then
    destroyObject(rangeRuler)
    rangeRuler = nil
  end

  noRulers = true
end


function spawnRangeRuler(rangeSourceObject, projectorBundleOverride)
  if rangeSourceObject == nil then 
    return 
  end

  local rulerBundleToSpawn = ""

  if projectorBundleOverride ~= nil then
    rulerBundleToSpawn = projectorBundleOverride
  else
    -- Get unit data from leader if leader hovered
    local unitData = rangeSourceObject.getTable("unitData")

    -- If leader not hovered, get leader GUID from mini data to get unit data
    if not unitData then
      local unitLeader = getObjectFromGUID(rangeSourceObject.getVar("leaderGUID"))
      if not unitLeader then
        return 
      end
      unitData = unitLeader.getTable("unitData")
      if not unitData then
        return 
      end
    end

    local baseSize = unitData.baseSize
    local rulerBundleTable = getRangeRulerLinks()
    rulerBundleToSpawn = rulerBundleTable[baseSize] 
  end

  basePos = rangeSourceObject.getPosition()
  baseRot = rangeSourceObject.getRotation()

  rangeRuler = spawnObject({
    type = "Custom_AssetBundle",
    position = {basePos.x, basePos.y + 20, basePos.z},
    rotation = {90, baseRot.y, 0},
    scale = {0,0,0} -- 0 scale will hide TTS default box and won't impact projector
  })

  rangeRuler.setCustomObject({
    type = 0,
    assetbundle = rulerBundleToSpawn
  })

  rangeRuler.setLock(true)
  rangeRuler.setName("Range Ruler")
  luaScript = "targetGUID = '"..rangeSourceObject.getGUID().."'\n function onFixedUpdate()\nif targetGUID ~= nil then\n targetObj = getObjectFromGUID(targetGUID)\n local targetPosition = targetObj.getPosition()\n self.setPosition({targetPosition.x, targetPosition.y + 20, targetPosition.z})\n self.setRotation({0,targetObj.getRotation().y,0})\n end\n end"
  rangeRuler.setLuaScript(luaScript)

  noRulers = false
end

----#include !/RangeRulers
----#include !/Cohesion
----#include !/data/CohesionLinks
function getCohesionLinks()
    local cohesions = {}
        --27 mm
        cohesions.small = "https://steamusercontent-a.akamaihd.net/ugc/2482129948496305632/EBBE2560D4336E6C96317EDDA787E225CF0E5B48/"
        --50 mm
        cohesions.medium = "https://steamusercontent-a.akamaihd.net/ugc/2482129948496305877/719896A3F975D8C914D47DC22507816A512C4839/"
        --70 mm
        cohesions.large = "https://steamusercontent-a.akamaihd.net/ugc/2482129948496305957/A977453A781738EA5AF2935A4562670012881080/"
    return cohesions
end

----#include !/data/CohesionLinks

function showCohesionOnHoveredModel(hoverObject)
   if hoverObject then
      if hoverObject.interactable then
         if selectedUnitObj == hoverObject then
            clearCohesionRuler()
            selectedUnitObj = nil
            return
         end
      end
   end
   clearCohesionRuler()
   spawnCohesionRuler(hoverObject)
end

function spawnCohesionRuler(cohesionSourceObject)
    if not cohesionSourceObject then
        return
    end
    if cohesionRuler ~= nil then
        clearCohesionRuler()
    end

    local newUnitData = cohesionSourceObject.getTable("unitData")
    if not newUnitData then 
      return 
    end

    local cohesionBundlesTable = getCohesionLinks()
    local baseSize = newUnitData.baseSize
    local cohesionBundleToSpawn = cohesionBundlesTable[baseSize]

    if cohesionBundleToSpawn == nil then return end

    local basePos = cohesionSourceObject.getPosition()
    local baseRot = cohesionSourceObject.getRotation()

    cohesionRuler = spawnObject({
        type="Custom_AssetBundle",
        position = {basePos.x, basePos.y + 20, basePos.z},
        rotation = {0, baseRot.y, 0},
        scale = {0,0,0} -- 0 scale will hide TTS default box and won't impact projector
    })

    cohesionRuler.setCustomObject({
        type = 0,
        assetbundle = cohesionBundleToSpawn
    })

    cohesionRuler.setLock(true)
    cohesionRuler.use_gravity = false
    cohesionRuler.setName("Cohesion Ruler")
end

function clearCohesionRuler()
    if cohesionRuler ~= nil then
        cohesionRuler.destruct()
        cohesionRuler = nil
    end
end
----#include !/Cohesion

function onsave()
  local chessClocksActive = UI.getAttribute("floatingChessClockUI", "active") == "true"
  return JSON.encode({
    clocks = chessClocksActive,
  })
end

function onload(saveData)
    VERSION = "v0.1-alpha"
    CCID = sha256(tostring(Time.time))
    UUID = sha256(Player.getPlayers()[1].steam_id)
    initUI()

    local loadData = {
      clocks = false,
    }
    if saveData ~= "" then
      loadData = JSON.decode(saveData)
    end

    initCardsSchema()
    ga_event("Global", "onLoad")

    gameDataGUID = "6bb850"
    battlefieldZoneGUID = "cbc575" -- real
    conditionsZoneGUID = "c49089" -- conditions
    competitiveTerrainZoneGUID = "92b9be"

    zonesGUIDs = {}
    zonesGUIDs.battlefield = battlefieldZoneGUID
    zonesGUIDs.conditions = conditionsZoneGUID
    zonesGUIDs.competitive = competitiveTerrainZoneGUID
    zonesGUIDs.red = "2c09a9"
    zonesGUIDs.blue = "818608"

    clockGUIDs = {}
    clockGUIDs.blue = "4f823a"
    clockGUIDs.red = "6ce1bb"
    initChessClocks(clockGUIDs, loadData.clocks)

    battlefieldTable = "3a3ed9"

    templateInfo = {}

    templateInfo.templateAGUID = {
        small = {"15849b", "f8f24c", "7568b1"}, medium = {"e20bd9", "9ab5d8", "ea3b10"}, large = {"28e15d", "2b6fd5", "62e790"}, huge = {"d80f36", "819324", "28a694"}
    }
    templateInfo.templateBGUID = {
        small = {"b35f7f", "4536a9", "c6150a"}, medium = {"46d669", "7c0b7a", "a99aaa"}, large = {"53689b", "93219f", "62d768"}, huge = {"0975c7", "968781", "f80c9d"}
    }
    templateInfo.templateCollider = {
        "https://steamusercontent-a.akamaihd.net/ugc/874120727305531901/BA0C6DDDC393B87EEBC53774FD23812CC1F6740A/",
        "https://steamusercontent-a.akamaihd.net/ugc/874120727305503775/8D94FFCC0574D5F4F41D85E3D08DDE6214DA33C3/",
        "https://steamusercontent-a.akamaihd.net/ugc/874120727305374487/9F2189A39695F8B9D09A3A84EB718CA9486D6AB6/"
    }
    for _,objSet in pairs(templateInfo.templateAGUID) do
        for i, objGUID in ipairs(objSet) do
            local obj = getObjectFromGUID(objGUID)
        end
    end

    for _,objSet in pairs(templateInfo.templateBGUID) do
        for i, objGUID in ipairs(objSet) do
            local obj = getObjectFromGUID(objGUID)
        end
    end

    -- math available here: https://docs.google.com/spreadsheets/d/1LD6spROJFw29c5L-lN1RJwqk7XplQShOj1Z8QQkBGf4/edit?usp=sharing
    -- formula is: ((tool - notch + base) * 0.5) /25.4
    templateInfo.aStart = {}
    -- base size             =      {speed1,      speed2,      speed3}
    templateInfo.aStart.small = 	   {2.007874016, 2.992125984, 3.976377953}
    templateInfo.aStart.medium = 	{2.342519685, 3.326771654, 4.311023622}
    templateInfo.aStart.large =		{2.736220472, 3.720472441, 4.704724409}
    templateInfo.aStart.huge =		{3.326771654, 4.311023622, 5.295275591}
    templateInfo.aStart.laat =      {3.720472441, 4.704724409, 5.688976378}
    templateInfo.aStart.long =		{4.803149606, 5.787401575, 6.771653543}
    templateInfo.aStart.epic =		{4.311023622, 5.295275591, 6.279527559}
    templateInfo.aStart.snail = {5.295275591, 6.279527559, 7.263779528}

    --when you deploy we need to extend the position of the tool 1.2mm
    --to approximate the prongs sitting on the edge not the base
    templateInfo.deployMod = {}
    templateInfo.deployMod.small = 0.087
    -- for notched bases we have to also add the notch
    templateInfo.deployMod.medium = 0.21
    templateInfo.deployMod.large = 0.21
    templateInfo.deployMod.huge = 0.21
    templateInfo.deployMod.laat = 0.21
    templateInfo.deployMod.long = 0.21
    templateInfo.deployMod.epic = 0.21
    templateInfo.deployMod.snail = 0.21

    templateInfo.templateMesh = {"https://steamusercontent-a.akamaihd.net/ugc/874120727305531585/FD6D4B079FC24EE1CE4F034B1C1E0F6B665D45E6/", "https://steamusercontent-a.akamaihd.net/ugc/874120727305502854/B063611E236ACAD8060A08A63EDB0EE9D91919AA/","https://steamusercontent-a.akamaihd.net/ugc/874120727305373581/A5E705982C2AE4B89756EF5A5BAC10DEDA9881B4/"}
    templateInfo.templateBallCollider = "https://steamusercontent-a.akamaihd.net/ugc/785234780862865411/C2B5E8CA63651BE485909340212736C0A68C2754/"

    templateInfo.tint = {{0.9,0.9,0.9}, {0.1,0.1,0.1},{0.4,0.03,0.03}}
    templateInfo.buttonPosition = {{0,0.02,-1.2},{0,0.02,-1.9},{0,0.02,-2.7}}
    templateInfo.buttonColor = {{0.8,0.8,0.8},{0.15,0.15,0.15},{0.4,0.03,0.03}}
    templateInfo.fontColor = {{0,0,0},{1,1,1},{1,1,1}}
    templateInfo.buttonHeight = {750,1400,2000}

    templateInfo.modelTemplateAGUID = "1f03c9"
    templateInfo.modelTemplateBGUID = "a486ae"

    modelA = getObjectFromGUID(templateInfo.modelTemplateAGUID)
    modelB = getObjectFromGUID(templateInfo.modelTemplateBGUID)

    templateInfo.templateNameToData = {}
    templateInfo.templateNameToData.whiteTemplateASnap25mm = {baseSize = "small", selectedSpeed = 1}
    templateInfo.templateNameToData.whiteTemplateASnap40mm = {baseSize = "medium", selectedSpeed = 1}
    templateInfo.templateNameToData.whiteTemplateASnap60mm = {baseSize = "large", selectedSpeed = 1}
    templateInfo.templateNameToData.whiteTemplateASnap90mm = {baseSize = "huge", selectedSpeed = 1}

    templateInfo.templateNameToData.blackTemplateASnap25mm = {baseSize = "small", selectedSpeed = 2}
    templateInfo.templateNameToData.blackTemplateASnap40mm = {baseSize = "medium", selectedSpeed = 2}
    templateInfo.templateNameToData.blackTemplateASnap60mm = {baseSize = "large", selectedSpeed = 2}
    templateInfo.templateNameToData.blackTemplateASnap90mm = {baseSize = "huge", selectedSpeed = 2}

    templateInfo.templateNameToData.redTemplateASnap25mm = {baseSize = "small", selectedSpeed = 3}
    templateInfo.templateNameToData.redTemplateASnap40mm = {baseSize = "medium", selectedSpeed = 3}
    templateInfo.templateNameToData.redTemplateASnap60mm = {baseSize = "large", selectedSpeed = 3}
    templateInfo.templateNameToData.redTemplateASnap90mm = {baseSize = "huge", selectedSpeed = 3}

    templateInfo.templateNameToData.whiteTemplateBSnap25mm = {baseSize = "small", selectedSpeed = 1}
    templateInfo.templateNameToData.whiteTemplateBSnap40mm = {baseSize = "medium", selectedSpeed = 1}
    templateInfo.templateNameToData.whiteTemplateBSnap60mm = {baseSize = "large", selectedSpeed = 1}
    templateInfo.templateNameToData.whiteTemplateBSnap90mm = {baseSize = "huge", selectedSpeed = 1}

    templateInfo.templateNameToData.blackTemplateBSnap25mm = {baseSize = "small", selectedSpeed = 2}
    templateInfo.templateNameToData.blackTemplateBSnap40mm = {baseSize = "medium", selectedSpeed = 2}
    templateInfo.templateNameToData.blackTemplateBSnap60mm = {baseSize = "large", selectedSpeed = 2}
    templateInfo.templateNameToData.blackTemplateBSnap90mm = {baseSize = "huge", selectedSpeed = 2}

    templateInfo.templateNameToData.redTemplateBSnap25mm = {baseSize = "small", selectedSpeed = 3}
    templateInfo.templateNameToData.redTemplateBSnap40mm = {baseSize = "medium", selectedSpeed = 3}
    templateInfo.templateNameToData.redTemplateBSnap60mm = {baseSize = "large", selectedSpeed = 3}
    templateInfo.templateNameToData.redTemplateBSnap90mm = {baseSize = "huge", selectedSpeed = 3}
    templateInfo.diceTrayGUID = "3d3ac4"

    templateInfo.moveTemplate = {}
    templateInfo.moveTemplate[1] = {}
    templateInfo.moveTemplate[1].colorTint = {1,1,1}
    templateInfo.moveTemplate[1].shortBundle = "https://steamusercontent-a.akamaihd.net/ugc/1761462778007615968/4EE8D2332DCB6F4837551255CE5B1F240937BBE5/"
    templateInfo.moveTemplate[1].longBundle = "https://steamusercontent-a.akamaihd.net/ugc/1848161512056297932/A762E187E43177F01CD89D1348F51B1E3C1C744D/"
    templateInfo.moveTemplate[1].sharedBundle = "https://steamusercontent-a.akamaihd.net/ugc/1761462778009533333/AD7C02CEE53FB4B2EA823B3DFE570674F8998019/"


    templateInfo.moveTemplate[2] = {}
    templateInfo.moveTemplate[2].colorTint = {0.5,0.5,0.5}
    templateInfo.moveTemplate[2].shortBundle = "https://steamusercontent-a.akamaihd.net/ugc/1761462778009510155/77119B471FE3C51B06443F8ABE1C1B522431DF9B/"
    templateInfo.moveTemplate[2].longBundle = "https://steamusercontent-a.akamaihd.net/ugc/1761462778009510102/15B368A8D753AB35E1D60F7A377AE273EBEC0145/"
    templateInfo.moveTemplate[2].sharedBundle = "https://steamusercontent-a.akamaihd.net/ugc/1761462778009533401/0FBA682D7D5AA7DA1A7EFC18B33C71EB1C0898E4/"

    templateInfo.moveTemplate[3] = {}
    templateInfo.moveTemplate[3].colorTint = {1,0.2,0.2}
    templateInfo.moveTemplate[3].shortBundle = "https://steamusercontent-a.akamaihd.net/ugc/1761462778009510243/26BA9DD7881AF63E1A19EB6BF9802630D792F836/"
    templateInfo.moveTemplate[3].longBundle = "https://steamusercontent-a.akamaihd.net/ugc/1761462778009510200/6723334F35444B547AA1382AE80F12E3FE9B72B1/"
    templateInfo.moveTemplate[3].sharedBundle = "https://steamusercontent-a.akamaihd.net/ugc/1761462778009533447/E5D1D5169F0DB6025808BEE8C9647B3E7057BDB9/"

    --This is actually diameter... just saying
    templateInfo.baseRadius = {
      -- Troopers
      small = 1.06299,
      -- Tauntauns, Droidekas, Speeder Bikes, Mortars
      medium = 1.9685,
      -- AT-RTs, eWebs
      large = 2.75591,
      -- Landspeeder, AT-ST
      huge = 3.93701,
      -- LAAT
      laat = 4.72440,
      -- Occupier Tank
      long = 3.93701,
      -- AAT, Saber Tank
      epic = 5.867,
      -- Snail
      snail = 3.93701
    }

    templateInfo.silhouetteHeight = {
      small = 1.65,
      notched = 2.707,
      custom = 1.0,
      poi = 3.0
    }

    templateInfo.cohesionRadius = {
      -- Troopers
      small = 4.494485,
      -- Tauntauns, Droidekas, Speeder Bikes, Mortars
      medium = 5.45275,
      -- AT-RTs, eWebs
      large = 7.133865,
      -- These are obviously incorrect, but currently cohesion does not matter for any of these units.
      -- Landspeeder, AT-ST
      huge = 8.622047244,
      -- LAAT
      laat = 9.803149606,
      -- Occupier Tank
      long = 13.0511811,
       -- AAT, Saber Tank
      epic = 11.57480315,
      -- Snail
      snail = 14.52755906
    }

    templateInfo.attackLineMesh = "https://steamusercontent-a.akamaihd.net/ugc/785234780861452902/76204298AA245698319FD2EA590160AFFE1B488C/"

    highestPoint = 0

    -- token Bags
    aimBagGUID = "beca0f"
    dodgeBagGUID = "4a352e"
    standbyBagGUID = "f103c2"
    surgeBagGUID = "f539b0"
    suppressionBagGUID = "a25e12"
    smokeBagGUID = "d03507"
    ionBagGUID = "799a75"
    woundBagGUID = "276535"
    observationBagGUID = "aac68d"
    poiBagGUID = "094230"

    whiteD8BagGUID = "014405"
    blackD8BagGUID = "79ead4"
    redD8BagGUID = "a0a037"

    whiteD6BagGUID = "7a88d3"
    redD6BagGUID = "22127e"

    unitIDTokenBagGUID = "21550f"

    Wait.time(initHotkeys, 1)
  
    -- LIST BUILDER info
    redSelectedArmyFaction = ""
    blueSelectedArmyFaction = ""
    listBuilder = buildListBuilder()

    dieRollerInfo = {}
    dieRollerInfo.diePos = {}
    dieRollerInfo.diePos[1] = {q = 0, c = 0.5}
    dieRollerInfo.diePos[2] = {q = 63.434948822922	, c = 1.1180339887499}
    dieRollerInfo.diePos[3] = {q = 33.69006752598, c = 1.802775637732}
    dieRollerInfo.diePos[4] = {q = 0, c = 1.5}
    dieRollerInfo.diePos[5] = {q = -33.69006752598	, c = 1.802775637732}
    dieRollerInfo.diePos[6] = {q = -63.434948822922, c = 1.1180339887499}
    dieRollerInfo.diePos[7] = {q = 63.434948822922	, c = -1.1180339887499}
    dieRollerInfo.diePos[8] = {q = 0, c = -0.5}
    dieRollerInfo.diePos[9] = {q = -63.434948822922, c = -1.1180339887499}
    dieRollerInfo.diePos[10] = {q = 75.963756532074, c = 2.0615528128088}
    dieRollerInfo.diePos[11] = {q = 53.130102354156, c = 2.5}
    dieRollerInfo.diePos[12] = {q = 38.65980825409, c = 3.2015621187164}
    dieRollerInfo.diePos[13] = {q = 21.801409486352, c = 2.6925824035673}
    dieRollerInfo.diePos[14] = {q = 0, c = 2.5}
    dieRollerInfo.diePos[15] = {q = -21.801409486352, c = 2.6925824035673}
    dieRollerInfo.diePos[16] = {q = -38.65980825409, c = 3.2015621187164}
    dieRollerInfo.diePos[17] = {q = -53.130102354156, c = 2.5}
    dieRollerInfo.diePos[18] = {q = -75.963756532074, c = 2.0615528128088}
    dieRollerInfo.diePos[19] = {q = 75.963756532074, c = -2.0615528128088}
    dieRollerInfo.diePos[20] = {q = 53.130102354156, c = -2.5}
    dieRollerInfo.diePos[21] = {q = 33.69006752598, c = -1.802775637732}
    dieRollerInfo.diePos[22] = {q = 0, c = -1.5}
    dieRollerInfo.diePos[23] = {q = -33.69006752598, c = -1.802775637732}
    dieRollerInfo.diePos[24] = {q = -53.130102354156, c = -2.5}
    dieRollerInfo.diePos[25] = {q = -75.963756532074, c = -2.0615528128088}

    dieRollerInfo.buttonInfo = {}
    dieRollerInfo.buttonInfo.redPlayer = {}
    dieRollerInfo.buttonInfo.redPlayer.whiteAttackButtonGUID = "64453f"
    --dieRollerInfo.buttonInfo.redPlayer.blackAttackButtonGUID = "ada290"
    --dieRollerInfo.buttonInfo.redPlayer.redAttackButtonGUID = "8bbca8"
    dieRollerInfo.buttonInfo.redPlayer.whiteDefenseButtonGUID = "647256"
    --dieRollerInfo.buttonInfo.redPlayer.redDefenseButtonGUID = "2faf4c"

    dieRollerInfo.buttonInfo.bluePlayer = {}
    dieRollerInfo.buttonInfo.bluePlayer.whiteAttackButtonGUID = "da4a19"
    --dieRollerInfo.buttonInfo.bluePlayer.blackAttackButtonGUID = "758849"
    --dieRollerInfo.buttonInfo.bluePlayer.redAttackButtonGUID = "9c6dfc"
    dieRollerInfo.buttonInfo.bluePlayer.whiteDefenseButtonGUID = "2fc39a"
    --dieRollerInfo.buttonInfo.bluePlayer.redDefenseButtonGUID = "b37fcb"


    dieRollerInfo.redDieRollerGUID = "9e1533"
    dieRollerInfo.blueDieRollerGUID = "1daecb"

    dieRollerInfo.dieRollerZone = {}
    dieRollerInfo.dieRollerZone.red = "424d2d"
    dieRollerInfo.dieRollerZone.blue = "39b5f1"


    dieRollerInfo.dieValues = {}
    dieRollerInfo.dieValues.attack = {}
    dieRollerInfo.dieValues.attack.red = {"crit", "hit", "hit", "hit", "hit", "hit", "blank", "oSurge"}
    dieRollerInfo.dieValues.attack.black = {"crit", "hit", "hit", "hit", "blank", "blank", "blank", "oSurge"}
    dieRollerInfo.dieValues.attack.white = {"crit", "hit", "blank", "blank", "blank", "blank", "blank", "oSurge"}

    dieRollerInfo.dieValues.defend = {}
    dieRollerInfo.dieValues.defend.white = {"block", "blank", "blank", "blank", "blank", "dSurge"}
    dieRollerInfo.dieValues.defend.red = {"block", "block", "block", "blank", "blank", "dSurge"}


    -- GAME CONTROLLER

    gameController = {}
    gameController.objGUID = "623b03"

    gameController.learningGameCartridgeGUID = "272d58"
    gameController.dataCartridgeGUID = "38fcd0"
    gameController.mountZoneGUID = "45d15b"
    gameController.standardMapsGUID = "e451ae"
    gameController.battleLinesCompetitiveMapsGUID = "e7b6f3"
    gameController.battleLinesCreativeMapsGUID = "90e744"

    gameController.customMapsGUID = "5f844e"
    gameController.competitiveTerrainCartridgeGUID = "cbd273"
    gameController.tournamentMapsGUID = "b0e1fc"
    gameController.userMapsGUID = "918e4e"
    gameController.gatheringLegionsMapsGUID = "b87979"
    gameController.deploymentOverlaysGUID = "208a88"
    gameController.objectiveCardsGUID = "8eea59"
    gameController.deploymentCardsGUID = "924285"
    gameController.conditionsCardsGUID = "3494a8"
    gameController.battlefieldCardsGUID = "9ef154"

    local z1 = -3.24
    local z2 = -1.03
    local z3 = 1.26
    local z4 = 3.53
    gameController.setUpCardsPos = {
      objective = {
        {0.18, -3.42, z1},
        {0.18, -3.42, z2},
        {0.18, -3.42, z3},
        {0.18, -3.42, z4},
      },
      deployment = {
        {1.23, -1.88, z1},
        {1.23, -1.88, z2}, 
        {1.23, -1.88, z3},
        {1.23, -1.88, z4},
      },
      conditions = {
        {2.27, -0.32, z1},
        {2.27, -0.32, z2},
        {2.27, -0.32, z3},
        {2.27, -0.32, z4},
      }
    }


    -- TV
    screenGUID = "33d1ed"

    -- setup data
    setUpData = {}
    setUpData.deploymentMountGUID = "538f4d"
    setUpData.objectiveMountGUID = "9480a7"
    setUpData.conditionsMountGUID = "c6b3a9"

    setUpControllerGUID = "1cb552"

    -- HIGHLIGHT TINTS
    highlightTints = {}
    highlightTints[1] = {1,0,0}
    highlightTints[2] = {86/255, 1, 181/255}
    highlightTints[3] = {1,0,157/255}
    highlightTints[4] = {233/255,1,0}
    highlightTints[5] = {0,159/255,1}
    highlightTints[6] = {1,122/255,0}
    highlightTints[7] = {0,1,235/255}
    highlightTints[8] = {1,119/255,107/255}
    highlightTints[9] = {151/255,0,1}
    highlightTints[10] = {251/255,1,164/255}
    highlightTints[11] = {1,0,0}
    highlightTints[12] = {86/255, 1, 181/255}
    highlightTints[13] = {1,0,157/255}
    highlightTints[14] = {233/255,1,0}
    highlightTints[15] = {0,159/255,1}
    highlightTints[16] = {1,122/255,0}
    highlightTints[17] = {0,1,235/255}
    highlightTints[18] = {1,119/255,107/255}
    highlightTints[19] = {151/255,0,1}
    highlightTints[20] = {251/255,1,164/255}

    -- command tokens
    commandTokenData = {}

    commandTokenData.mesh = "https://steamusercontent-a.akamaihd.net/ugc/786359883314446513/4DBBAC00ABA5EABE88C2A86C3311C3FB6645FF25/"
    commandTokenData.collider = "https://steamusercontent-a.akamaihd.net/ugc/785234780866339915/85F7E717B9EFBE0396126CA673DF17EAFEC7D451/"

    commandTokenData.red = {}

    commandTokenData.red.com = "https://steamusercontent-a.akamaihd.net/ugc/2425823802350223302/3D52D57D51D5F04872B4BF989A0A8B5DE507636C/"
    commandTokenData.red.op = "https://steamusercontent-a.akamaihd.net/ugc/2425823802350223750/C3C09D828436CE827D7B788509A5264430CDCCBD/"
    commandTokenData.red.corps = "https://steamusercontent-a.akamaihd.net/ugc/2425823802350223459/C482A32B2B1DF9A6CB62F01DC0138023D122E813/"
    commandTokenData.red.sf = "https://steamusercontent-a.akamaihd.net/ugc/2425823802350223881/5F93AC468782FF6B253528788AD43883D873D534/"
    commandTokenData.red.sup = "https://steamusercontent-a.akamaihd.net/ugc/2425823802350224054/3AC5129B9CFE85C357635FAA5A19395CE93BC5D4/"
    commandTokenData.red.heavy = "https://steamusercontent-a.akamaihd.net/ugc/2425823802350223589/13B60C1680CB40EA02470BFCF77C30DDE55B08CE/"

    commandTokenData.red.imperialCommander = commandTokenData.red.com
    commandTokenData.red.imperialOperative = commandTokenData.red.op
    commandTokenData.red.imperialCorps = commandTokenData.red.corps
    commandTokenData.red.imperialSpecialforces = commandTokenData.red.sf
    commandTokenData.red.imperialSupport = commandTokenData.red.sup
    commandTokenData.red.imperialHeavy = commandTokenData.red.heavy

    commandTokenData.red.rebelCommander = commandTokenData.red.com
    commandTokenData.red.rebelOperative = commandTokenData.red.op
    commandTokenData.red.rebelCorps = commandTokenData.red.corps
    commandTokenData.red.rebelSpecialforces = commandTokenData.red.sf
    commandTokenData.red.rebelSupport = commandTokenData.red.sup
    commandTokenData.red.rebelHeavy = commandTokenData.red.heavy

    commandTokenData.red.separatistCommander = commandTokenData.red.com
    commandTokenData.red.separatistOperative = commandTokenData.red.op
    commandTokenData.red.separatistCorps = commandTokenData.red.corps
    commandTokenData.red.separatistSpecialforces = commandTokenData.red.sf
    commandTokenData.red.separatistSupport = commandTokenData.red.sup
    commandTokenData.red.separatistHeavy = commandTokenData.red.heavy

    commandTokenData.red.republicCommander = commandTokenData.red.com
    commandTokenData.red.republicOperative = commandTokenData.red.op
    commandTokenData.red.republicCorps = commandTokenData.red.corps
    commandTokenData.red.republicSpecialforces = commandTokenData.red.sf
    commandTokenData.red.republicSupport = commandTokenData.red.sup
    commandTokenData.red.republicHeavy = commandTokenData.red.heavy

    commandTokenData.red.shadowcollectiveCommander = commandTokenData.red.com
    commandTokenData.red.shadowcollectiveOperative = commandTokenData.red.op
    commandTokenData.red.shadowcollectiveCorps = commandTokenData.red.corps
    commandTokenData.red.shadowcollectiveSpecialforces = commandTokenData.red.sf
    commandTokenData.red.shadowcollectiveSupport = commandTokenData.red.sup
    commandTokenData.red.shadowcollectiveHeavy = commandTokenData.red.heavy

    commandTokenData.blue = {}

    commandTokenData.blue.com = "https://steamusercontent-a.akamaihd.net/ugc/2425823802350222557/F54CD13B525EB1CBFB2952383CAEE124119D7C9F/"
    commandTokenData.blue.op = "https://steamusercontent-a.akamaihd.net/ugc/2425823802350222987/04E37D5634E5E00C70765CDAA5FBFBA5A3EF06E5/"
    commandTokenData.blue.corps = "https://steamusercontent-a.akamaihd.net/ugc/2425823802350222752/3A3519FB659AE4BCF8D84D4F33100C8162FDF0E4/"
    commandTokenData.blue.sf = "https://steamusercontent-a.akamaihd.net/ugc/2425823802350223089/89F5AA847DA71F3148E4A97B41489FC2B2DBB945/"
    commandTokenData.blue.sup = "https://steamusercontent-a.akamaihd.net/ugc/2425823802350223170/D9DE41DE504F73766E11F5DAD3B4DF005ED59ACC/"
    commandTokenData.blue.heavy = "https://steamusercontent-a.akamaihd.net/ugc/2425823802350222879/D84AE73FA68A8B02A8FBFE13FC6C3683964B124E/"

    commandTokenData.blue.imperialCommander = commandTokenData.blue.com
    commandTokenData.blue.imperialOperative = commandTokenData.blue.op
    commandTokenData.blue.imperialCorps = commandTokenData.blue.corps
    commandTokenData.blue.imperialSpecialforces = commandTokenData.blue.sf
    commandTokenData.blue.imperialSupport = commandTokenData.blue.sup
    commandTokenData.blue.imperialHeavy = commandTokenData.blue.heavy

    commandTokenData.blue.rebelCommander = commandTokenData.blue.com
    commandTokenData.blue.rebelOperative = commandTokenData.blue.op
    commandTokenData.blue.rebelCorps = commandTokenData.blue.corps
    commandTokenData.blue.rebelSpecialforces = commandTokenData.blue.sf
    commandTokenData.blue.rebelSupport = commandTokenData.blue.sup
    commandTokenData.blue.rebelHeavy = commandTokenData.blue.heavy

    commandTokenData.blue.separatistCommander = commandTokenData.blue.com
    commandTokenData.blue.separatistOperative = commandTokenData.blue.op
    commandTokenData.blue.separatistCorps = commandTokenData.blue.corps
    commandTokenData.blue.separatistSpecialforces = commandTokenData.blue.sf
    commandTokenData.blue.separatistSupport = commandTokenData.blue.sup
    commandTokenData.blue.separatistHeavy = commandTokenData.blue.heavy

    commandTokenData.blue.republicCommander = commandTokenData.blue.com
    commandTokenData.blue.republicOperative = commandTokenData.blue.op
    commandTokenData.blue.republicCorps = commandTokenData.blue.corps
    commandTokenData.blue.republicSpecialforces = commandTokenData.blue.sf
    commandTokenData.blue.republicSupport = commandTokenData.blue.sup
    commandTokenData.blue.republicHeavy = commandTokenData.blue.heavy

    commandTokenData.blue.shadowcollectiveCommander = commandTokenData.blue.com
    commandTokenData.blue.shadowcollectiveOperative = commandTokenData.blue.op
    commandTokenData.blue.shadowcollectiveCorps = commandTokenData.blue.corps
    commandTokenData.blue.shadowcollectiveSpecialforces = commandTokenData.blue.sf
    commandTokenData.blue.shadowcollectiveSupport = commandTokenData.blue.sup
    commandTokenData.blue.shadowcollectiveHeavy = commandTokenData.blue.heavy

    commandTokenTrayData = {}
    commandTokenTrayData.red = {}
    commandTokenTrayData.red.trayZoneGUID = "a74687"
    commandTokenTrayData.red.rebelCommander = "071592"
    commandTokenTrayData.red.rebelOperative = "369fa9"
    commandTokenTrayData.red.rebelCorps = "af4c28"
    commandTokenTrayData.red.rebelSpecialforces = "abb909"
    commandTokenTrayData.red.rebelSupport = "ce9be9"
    commandTokenTrayData.red.rebelHeavy = "f68963"
    commandTokenTrayData.red.imperialCommander = "071592"
    commandTokenTrayData.red.imperialOperative = "369fa9"
    commandTokenTrayData.red.imperialCorps = "af4c28"
    commandTokenTrayData.red.imperialSpecialforces = "abb909"
    commandTokenTrayData.red.imperialSupport = "ce9be9"
    commandTokenTrayData.red.imperialHeavy = "f68963"
    commandTokenTrayData.red.republicCommander = "071592"
    commandTokenTrayData.red.republicOperative = "369fa9"
    commandTokenTrayData.red.republicCorps = "af4c28"
    commandTokenTrayData.red.republicSpecialforces = "abb909"
    commandTokenTrayData.red.republicSupport = "ce9be9"
    commandTokenTrayData.red.republicHeavy = "f68963"
    commandTokenTrayData.red.separatistCommander = "071592"
    commandTokenTrayData.red.separatistOperative = "369fa9"
    commandTokenTrayData.red.separatistCorps = "af4c28"
    commandTokenTrayData.red.separatistSpecialforces = "abb909"
    commandTokenTrayData.red.separatistSupport = "ce9be9"
    commandTokenTrayData.red.separatistHeavy = "f68963"
    commandTokenTrayData.red.shadowcollectiveCommander = "071592"
    commandTokenTrayData.red.shadowcollectiveOperative = "369fa9"
    commandTokenTrayData.red.shadowcollectiveCorps = "af4c28"
    commandTokenTrayData.red.shadowcollectiveSpecialforces = "abb909"
    commandTokenTrayData.red.shadowcollectiveSupport = "ce9be9"
    commandTokenTrayData.red.shadowcollectiveHeavy = "f68963"
    commandTokenTrayData.red.stack = "e2202d"

    commandTokenTrayData.blue = {}
    commandTokenTrayData.blue.trayZoneGUID = "97b998"
    commandTokenTrayData.blue.rebelCommander = "57ab78"
    commandTokenTrayData.blue.rebelOperative = "b30914"
    commandTokenTrayData.blue.rebelCorps = "e5e8df"
    commandTokenTrayData.blue.rebelSpecialforces = "3832c6"
    commandTokenTrayData.blue.rebelSupport = "d2c857"
    commandTokenTrayData.blue.rebelHeavy = "6d221d"
    commandTokenTrayData.blue.imperialCommander = "57ab78"
    commandTokenTrayData.blue.imperialOperative = "b30914"
    commandTokenTrayData.blue.imperialCorps = "e5e8df"
    commandTokenTrayData.blue.imperialSpecialforces = "3832c6"
    commandTokenTrayData.blue.imperialSupport = "d2c857"
    commandTokenTrayData.blue.imperialHeavy = "6d221d"
    commandTokenTrayData.blue.republicCommander = "57ab78"
    commandTokenTrayData.blue.republicOperative = "b30914"
    commandTokenTrayData.blue.republicCorps = "e5e8df"
    commandTokenTrayData.blue.republicSpecialforces = "3832c6"
    commandTokenTrayData.blue.republicSupport = "d2c857"
    commandTokenTrayData.blue.republicHeavy = "6d221d"
    commandTokenTrayData.blue.separatistCommander = "57ab78"
    commandTokenTrayData.blue.separatistOperative = "b30914"
    commandTokenTrayData.blue.separatistCorps = "e5e8df"
    commandTokenTrayData.blue.separatistSpecialforces = "3832c6"
    commandTokenTrayData.blue.separatistSupport = "d2c857"
    commandTokenTrayData.blue.separatistHeavy = "6d221d"
    commandTokenTrayData.blue.shadowcollectiveCommander = "57ab78"
    commandTokenTrayData.blue.shadowcollectiveOperative = "b30914"
    commandTokenTrayData.blue.shadowcollectiveCorps = "e5e8df"
    commandTokenTrayData.blue.shadowcollectiveSpecialforces = "3832c6"
    commandTokenTrayData.blue.shadowcollectiveSupport = "d2c857"
    commandTokenTrayData.blue.shadowcollectiveHeavy = "6d221d"
    commandTokenTrayData.blue.stack = "c9f9d0"

    -- standby tokens
    standbyTokens()
end

function standbyTokens()
    local allObjs = getAllObjects()
    for i, obj in pairs(allObjs) do
        if obj.getVar("isAToken") == true then
            obj.call("standby")
        elseif obj.getName() == "Cohesion Ruler" or obj.getName() == "Movement Template" or obj.getName() == "Range Ruler" or obj.getName() == "Deployment Boundary" then
            destroyObject(obj)
        end
    end
end


function dummy() end

-- Initialize red and blue clocks at 01:30:00
function initChessClocks(guids, show)
  Wait.frames(function()
    if show then
      toggleChessClockUI()
    else
      for _, v in pairs(guids) do
        local obj = getObjectFromGUID(v)
        obj.setScale({0, 0, 0})
        obj.Clock.setValue(5400)
      end
    end
  end)
end

-- Builds all mod-specific hotkeys. Players can customize key bindings via in-game menus
-- addHotkey is preferred over onScriptingButton[Up|Down] due to customizability by players
function initHotkeys()
  initRangebandHotkeys()
  initCohesionHotkeys()
  initTokenHotkeys()
  initChessClockHotkeys()
end

-- Rangeband Hotkeys --
function initRangebandHotkeys()
  addHotkey(
    "Show Range On Hovered Model",
    function (playerColor, hoverObject, cursorPosition)
      showRangeOnHoveredModel(hoverObject)
    end
  )
end
-- END Rangeband Hotkeys --

-- Cohesion Hotkeys --
function initCohesionHotkeys()
   addHotkey(
      "Show Cohesion On Hovered Model",
      function (playerColor, hoverObject, cursorPosition)
         showCohesionOnHoveredModel(hoverObject)
      end
   )
end
-- END Cohesion Hotkeys --

-- Token Hotkeys --
function initTokenHotkeys()
  globalBagGUIDs = {
    Aim = aimBagGUID,
    Dodge = dodgeBagGUID,
    Standby = standbyBagGUID,
    Surge = surgeBagGUID,
    Suppression = suppressionBagGUID,
    Smoke = smokeBagGUID,
    Ion = ionBagGUID,
    Wound = woundBagGUID,
    -- add more key,value pairs in here once Global has more bagGUID vars added
  }

  for hotkeyName,bagGUID in pairs (globalBagGUIDs) do
    addHotkey(
      "Deliver "..hotkeyName.." to Cursor",
      function(playerColor, hoverObject, cursorPosition)
        -- local bagGUID = Global.getVar(varName)
        if bagGUID then
          local bag = getObjectFromGUID(bagGUID)
          if bag ~= nil then
            bag.takeObject({
              position = cursorPosition + Vector({0,1,0}),
              smooth = false, -- remove this if you want to keep the animation
            })
          end
        end
      end
    )
  end
end
-- END Token Hotkeys --

-- Chessclock Hotkeys --
function initChessClockHotkeys()
  clocks = {
    Blue = getObjectFromGUID(clockGUIDs.blue).Clock,
    Red = getObjectFromGUID(clockGUIDs.red).Clock
  }
  addHotkey("Toggle Chess Clocks", toggleChessClocks)
  addHotkey("Pause All Chess Clocks", pauseAllChessClocks)
end

function updateClockButton()
  if clocks.Blue.paused and clocks.Red.paused then
    UI.setValue("toggleClockText", "Chess Clocks Paused")
    UI.setAttribute("toggleClockButton", "colors", "#FFFFFF|#DFDFDF")
  elseif clocks.Blue.paused then
    UI.setValue("toggleClockText", "Red Player on Clock")
    UI.setAttribute("toggleClockButton", "colors", "#DF0000|#DF0000")
  else
    UI.setValue("toggleClockText", "Blue Player on Clock")
    UI.setAttribute("toggleClockButton", "colors", "#0000DF|#0000DF")
  end
end

function toggleClockButton(player, button)
  local color = tostring(player.color)
  if button == "-1" then
    toggleChessClocks(color)
  else
    pauseAllChessClocks(color)
  end
end

-- Toggles the active clock between Red and Blue
-- If neither clock is currently active, activates Blue
function toggleChessClocks(playerColor)
  if not clocks[playerColor] then
    broadcastToAll('Only players can toggle chess clocks')
    return
  end
  -- Returns the name of the player currently on the clock
  -- if steam_name is not available, returns player color
  local function getClockPlayerName()
    if clocks.Blue.paused then
      return Player.Red.steam_name or "Red"
    else
      return Player.Blue.steam_name or "Blue"
    end
  end
  -- Returns the player color currently on the clock
  local function getClockPlayerColor()
    return clocks.Blue.paused and "Red" or "Blue"
  end

  if clocks.Blue.paused and clocks.Red.paused then
    clocks.Blue.pauseStart()
  else
    clocks.Blue.pauseStart()
    clocks.Red.pauseStart()
  end

  local fontColors = {
    diffuse = {1,0,0},
  }
  broadcastToAll ("*** " .. getClockPlayerName() .. " is now on the clock ***", fontColors[getClockPlayerColor()])
  updateClockButton()
end

-- Calls pauseStart() for each clock that is not already paused
function pauseAllChessClocks(playerColor)
  for k, v in pairs(clocks) do
    if not v.paused then v.pauseStart() end
  end
  broadcastToAll('All chess clocks paused')
  updateClockButton()
end
-- END Chessclock Hotkeys --
