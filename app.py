from surf_spots import spots
from selenium import webdriver
from selenium.webdriver.common.by import By

class Surf_Spot:
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

def get_spot_info(spot_id):
    driver = webdriver.Chrome()
    driver.get(f'https://www.surfline.com/surf-report/${spot_id}')

    current_surf_cond=driver.find_element(By.CSS_SELECTOR, 'div.CurrentSurfConditionsCard_card__E7_SX')
    current_wind_cond=driver.find_element(By.CSS_SELECTOR, 'div.CurrentWind_currentWind__eQ8T1')

    driver.quit()
