const express = require('express');

const app = express();

app.use(express.static('./dist/assignment-app'));

app.get('/*', function (req, res) {
  res.sendFile('index.html', { root: 'dist/assignment-app' }
  );
});

app.listen(process.env.PORT || 3000);

console.log(`Running on port ${process.env.PORT || 3000}`)