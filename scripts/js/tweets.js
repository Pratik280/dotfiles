// for deleting all retweets
setInterval(() => {
  for (const d of document.querySelectorAll('div[data-testid="unretweet"]')) {
    d.click();
    setInterval(() => {
      document
        .querySelectorAll('div[data-testid="unretweetConfirm"]')[0]
        .click();
    }, 1000);
  }
  window.scrollTo(0, 0.25 * document.body.scrollHeight);
}, 3000);

// for deleting all likes
setInterval(() => {
  for (const d of document.querySelectorAll('div[data-testid="unlike"]')) {
    d.click();
  }
  window.scrollTo(0, document.body.scrollHeight);
}, 3000);

setInterval(() => {
  for (const d of document.querySelectorAll('div[data-testid="caret"]')) {
    d.click();
  }
  window.scrollTo(0, document.body.scrollHeight);
}, 3000);