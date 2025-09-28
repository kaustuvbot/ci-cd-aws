// app.js
const express = require('express');
const path = require('path');
const app = express();
const port = process.env.PORT || 3000;
// var unusedVariable = "This will cause a lint error";  // LINT ERROR: unused variable

// Serve static files
app.use(express.static('public'));

// Routes
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

app.get('/health', (req, res) => {
    res.json({
        status: 'healthy',
        timestamp: new Date().toISOString(),
        version: process.env.APP_VERSION || '1.0.0'
    });
});

app.get('/api/info', (req, res) => {
    res.json({
        message: 'Hello from CI/CD Lab!',
        environment: process.env.NODE_ENV || 'development',
        version: process.env.APP_VERSION || '1.0.0'
    });
});

app.listen(port, () => {



    console.log(`Server running on port ${port}`);
});

module.exports = app;