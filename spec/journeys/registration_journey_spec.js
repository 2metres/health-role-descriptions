
module.exports = {
  'Step 1 - Email' : function (browser) {
    browser
      .url(browser.launchUrl)
      .waitForElementVisible('body')
      .assert.containsText('h1', 'Modernising Health and Aged Care Payments Services Program');
  }
};
