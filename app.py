from selenium import webdriver
from selenium.webdriver.common.by import By

driver=webdriver.Chrome()
driver.get('https://www.surfline.com/surf-report/new-brighton-pier/584204204e65fad6a770967d')

current_surf_cond=driver.find_element(By.CSS_SELECTOR, 'div.CurrentSurfConditionsCard_card__E7_SX')
current_wind_cond=driver.find_element(By.CSS_SELECTOR, 'div.CurrentWind_currentWind__eQ8T1')

driver.quit()  # closing the browser
