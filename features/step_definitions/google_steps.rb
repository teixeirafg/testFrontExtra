Given ("acessar extra") do
  visit('/')
end

When (/^eu digitar no campo de busca "([^"]*)"$/) do |term|
  page.find(:css,"div > .fitext").set(term)
  page.find(:css,'.search-bar button').click
end

When("eu seleciono o primeiro resultado") do
  tv_elemento = '#nm-product-8082544 > div > div.nm-product-info > div.nm-product-name > a'
  @tv = page.find(:css, tv_elemento).text
  page.execute_script "window.scrollTo(300,250)"
  page.find(:css, tv_elemento).click
end

When("insiro o produto no carrinho") do
  page.execute_script "window.scrollTo(300,250)"
  page.find(:css, '#btnAdicionarCarrinho').click
  page.find_all(:css, '.decline-button').first.click
  page.execute_script "window.scrollTo(300,250)"
end

Then("eu comparo o resultado da busca com o item do carrinho") do
  tv_carrinho = page.find_all(:css, 'tbody a strong').first.text
  expect(@tv).to eql(tv_carrinho)
end
