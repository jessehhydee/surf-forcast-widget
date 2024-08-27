from surf_spots import spots
from selenium import webdriver
from bs4 import BeautifulSoup
import json

def create_driver():
   chrome_options=webdriver.ChromeOptions()
   # chrome_options.add_argument("--headless")
   return webdriver.Chrome(options=chrome_options)

def get_spot_info(spot_url):
    driver=create_driver()
    driver.get(spot_url)
    soup=BeautifulSoup(driver.page_source, 'html.parser')

    def find_element(selector):
        return soup.select(selector)[0].text

    spot_info={
        'name': find_element('div.ForecastHeader_headerDetails__GHe9U div.MuiStack-root div h1').replace(' Surf Report',''),
        'sizeHumanReadable': find_element('div.CurrentSurfConditionsCard_title__ssxa_ h2'),
        'sizeFt': find_element('div.CurrentWaveHeightAndRating_waveHeight__Hj9bN p span'),
        'windDir': find_element('p.CurrentWind_directionType__BYdBg'),
        'windSpeed': find_element('span.CurrentWind_windSpeed__x6FoF'),
        'grade': find_element('p.conditionsText')
    }

    driver.quit()
    return spot_info

spots_info=[]
for spot in spots:
    spots_info.append(get_spot_info(spot))

with open('../forcast-data/data.json', 'w') as outfile:
    json.dump({'surfSpots': spots_info}, outfile)