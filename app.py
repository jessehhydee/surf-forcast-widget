from surf_spots import spots
from selenium import webdriver
from selenium.webdriver.common.by import By
from bs4 import BeautifulSoup

class SurfSpot:
  def __init__(
    self,
    name,
    size_human_readable,
    size_ft,
    wind_dir,
    wind_speed,
    grade
  ):
    self.name=name
    self.size_human_readable=size_human_readable
    self.size_ft=size_ft
    self.wind_dir=wind_dir
    self.wind_speed=wind_speed
    self.grade=grade

def create_driver():
   chrome_options=webdriver.ChromeOptions()
   chrome_options.add_argument("--headless")
   return webdriver.Chrome(options=chrome_options)

def get_spot_info(spot_id):
    driver=create_driver()
    driver.get(f'https://www.surfline.com/surf-report/{spot_id}')
    soup=BeautifulSoup(driver.page_source)

    def find_element(selector):
        return soup.find_all(selector)

    spot_info=SurfSpot(
        find_element('div.ForecastHeader_headerDetails__GHe9U div.MuiStack-root div h1'),
        find_element('div.CurrentSurfConditionsCard_title__ssxa_ h2'),
        find_element('div.CurrentWaveHeightAndRating_waveHeight__Hj9bN p span'),
        find_element('p.CurrentWind_directionType__BYdBg'),
        find_element('span.CurrentWind_windSpeed__x6FoF'),
        find_element('p.conditionsText'),
    )

    driver.quit()
    return spot_info

spots_info=[]
for spot in spots:
    spots_info.append(get_spot_info(spot))

print(spots_info)
