const express = require('express');  
const mysql = require('mysql2');  
const multer = require ('multer');
const app = express();  

//Set up multer for file uploads
const storage = multer.diskStorage({
    destination: (req, file,cb) => {
        cb(null, 'public/images'); //Directory to save uploaded files
    },
    filename:(req, file, cb) => {
        cb(null, file.originalname);
    }
});

const upload = multer({ storage: storage });


// Create MySQL connection  
const connection = mysql.createConnection({  
 host: 'localhost',  
 user: 'root',  
 password: '',  
 database: 'miniproject_c237'  
}); 

connection.connect((err) => {  
 if (err) {  
 console.error('Error connecting to MySQL:', err);  
 return;  
 }  
 console.log('Connected to MySQL database');  
}); 

// Set up view engine  
app.set('view engine', 'ejs');   

// enable form processing
app.use(express.urlencoded({
    extended: false
}));

//enable static files
app.use(express.static('public'));

// Define routes  

app.get('/', (req, res) => {  
    connection.query('SELECT * FROM Products', (error, productResults) => {  
        if (error) throw error;
        connection.query('SELECT * FROM Summer', (error, summerResults) => {  
            if (error) throw error; 
            res.render('index', { 
                products: productResults,
                summer: summerResults
             });
        });
    });     
}); 


app.get('/product/:id', (req, res) => {
    const productId = req.params.id;
    const sql = 'SELECT * FROM products WHERE productId = ?';
    connection.query(sql, [productId], (error, results) => {
        if (error) {
            console.error('Database query error:', error.message);
            return res.status(500).send('Error Retrieving product by ID');
        }
        if (results.length > 0) {
            res.render('product', { product: results[0] });
        } else {
            res.status(404).send('Product not found');
        }
    });
});

app.get('/summer/:id', (req, res) => {
    const id = req.params.id;
    const sql = 'SELECT * FROM summer WHERE id = ?';
    connection.query(sql, [id], (error, results) => {
        if (error) {
            console.error('Database query error:', error.message);
            return res.status(500).send('Error Retrieving summer product by ID');
        }
        if (results.length > 0) {
            res.render('summer', { summer: results[0] });
        } else {
            res.status(404).send('Summer product not found');
        }
    });
});

app.get('/addProduct', (req, res) => {
    res.render('addProduct');
});

app.post('/addProduct', upload.single('image'), (req, res) => {
    // Extract product data from the request body
    const { name, quantity, price, info} = req.body;
    let image;
    if (req.file) {
        image = req.file.filename;  //save only the filename
    } else {
        image = null;
    }
    const sql = 'INSERT INTO products (productName, quantity, price, image, info) VALUES (?,?, ?, ?, ?)';
    // Insert the new product into the database
    connection.query( sql , [name, quantity, price, image, info], (error, results) => {
        if (error) {
            // Handle any error that occurs during the database operation
            console.error("Error adding product:", error);
            res.status(500).send('Error adding product');
        } else {
            // Send a success response
            res.redirect('/');
        }
    });
});


app.get('/editpage', (req, res) => {
    connection.query('SELECT * FROM Products', (error, productResults) => {  
        if (error) throw error;
        connection.query('SELECT * FROM Summer', (error, summerResults) => {  
            if (error) throw error; 
            res.render('editpage', { 
                products: productResults,
                summer: summerResults
             });
        });
    });     
}); 

app.get('/editProduct/:id',(req,res) => {
    const productId = req.params.id
    const sql = 'SELECT * FROM products WHERE productId = ?';
    //Fetch data from MySQL based on the product ID
    connection.query( sql , [productId], (error, results) => {
        if (error) {
            console.error('Databased query error:', error.message);
            return res.status(500).send('Error retrieving product by ID');
        }
        //Check if any product with the given ID was found
        if (results.length > 0) {
            //  Render HTML page with the product data 
            res.render('editProduct', { product:results[0] });
        } else {
            //if no product with the given ID was found, render a error 404 page or handle it accordingly
            res.status(404).send('Product not found');
        }
    });
});

app.post('/editProduct/:id', upload.single('image'), (req,res) => {
    const productId = req.params.id;
    //Extract product data from the request body
    const { name , quantity, price, info } = req.body;
    
    let image = req.body.currentImage; 
    if (req.file) {  //if new image is uploaded
        image = req.file.filename;  //set image to be new filename
    }

    const sql = 'UPDATE products SET productName = ? , quantity = ?, price = ?, image = ?, info = ? WHERE productId = ?';

    //Insert the new product into the database
    connection.query( sql , [name, quantity, price, image, info, productId], (error,results) => {
        if (error) {
            //Handle any error that poccurs during the database operation
            console.error("Error updating product:",error);
            res.status(500).send('Error updating product');
        } else {
            //Send a success reponse
            res.redirect('/editpage')
        }
    });
});

app.get('/editSummer/:id', (req, res) => {
    const summerId = req.params.id;
    const sql = 'SELECT * FROM summer WHERE id = ?';
    connection.query(sql, [summerId], (error, results) => {
        if (error) {
            console.error('Database query error:', error.message);
            return res.status(500).send('Error retrieving summer product by ID');
        }
        if (results.length > 0) {
            res.render('editSummer', { summer: results[0] });
        } else {
            res.status(404).send('Summer product not found');
        }
    });
});

app.post('/editSummer/:id', upload.single('image'), (req, res) => {
    const summerId = req.params.id;
    const { productname, quantity, price, info } = req.body;
    let image = req.body.currentImage;

    if (req.file) {
        image = req.file.filename;
    }

    const sql = 'UPDATE summer SET productname = ?, quantity = ?, price = ?, image = ?, info = ? WHERE id = ?';
    connection.query(sql, [productname, quantity, price, image, info, summerId], (error, results) => {
        if (error) {
            console.error("Error updating summer product:", error);
            res.status(500).send('Error updating summer product');
        } else {
            res.redirect('/editpage');
        } 
    });
});
app.get('/deleteProduct/:id', (req,res) => {
    const productId = req.params.id;
    const sql = 'DELETE FROM products WHERE productId = ?';
    connection.query( sql , [productId], (error, results) => {
        if (error) {
            //Handle any error that occurs during the datbase operation 
            console.error("Error deleting product:", error);
            res.status(500).send('Error deleting product');
        } else {
            //Send a success response 
            res.redirect('/editpage');
        }
    });
});

app.get('/aboutus', (req, res) => {
    res.render('aboutus');
});

const PORT = process.env.PORT || 3000;  
app.listen(PORT, () => console.log(`Server running http://localhost:${PORT}`));  
//23037201 NicolLee//