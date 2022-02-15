// updated fjenett 20081129

import de.bezier.data.sql.*;    


PostgreSQL pgsql;


void setup()
{
    size( 100, 100 );
	
    // this example assumes that you are running the 
    // postgresql server locally (on "localhost").
    //
	
    // replace with your own postgresql-account.
    //
    String user     = "demodb";
    String pass     = "demodb";
	
    // name of the database to use
    //
    String database = "demodb";
    
    // connect to database on "localhost"
    //
    pgsql = new PostgreSQL( this, "avo-swamp.cro.cz", database, user, pass );
    
    // connected?
    if ( pgsql.connect() )
    {
        // query the number of entries in table "weather"
        pgsql.query( "SELECT COUNT(*) FROM test" );
        
        // results found?
        if ( pgsql.next() )
        {
            // nice, then let's report them back
            println( "number of rows in table weather: " + pgsql.getInt(1) );
        }
        
        pgsql.query( "SELECT * FROM test LIMIT 10" );
        
        // anything found?
        while( pgsql.next() )
        {
            // splendid, here's what we've found ..
            println( pgsql.getString("city") );
        }
    }
    else
    {
        // yay, connection failed !
    }
}
