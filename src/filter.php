<?php

if(isset($_GET["checkIn"]) && isset($_GET["checkOut"]) && isset($_GET["pax"]))
{
    $connect = mysqli_connect("localhost", "root", "", "import");
    $output = '';

    $query = "  
           SELECT * FROM inventories 
           WHERE date BETWEEN '".$_GET["checkIn"]."' AND '".$_GET["checkOut"]."'  
      ";
    $result = mysqli_query($connect, $query);

    $output .= '  
           <table class="table table-bordered">  
                <tr>  
                    <th width="30%">ROOM CODE:</th>
                    </br>
                <th width="30%">PRICE</th>
                <th width="30%">DATE</th>
                
                </tr>  
      ';
    $total_price_STDDBL=0;
    $total_price_STDSNGL=0;
    if(mysqli_num_rows($result) > 0) {


        while ($row = mysqli_fetch_array($result)) {

            if ($_GET["pax"] <= $row["max_pax"]) {
               $price= $row["price"] * ((100 - $row["discount"]) / 100) * $_GET["pax"];
               if($row["room_code"]=="STDDBL"){
                   $total_price_STDDBL+=$price;

               }
                if($row["room_code"]=="STDSNGL"){
                    $total_price_STDSNGL+=$price;

                }

                $output .= '  
                     <tr>  
                     
                          <td>' . $row["room_code"] . '</td>  
                          <td>' . $row["price"] * ((100 - $row["discount"]) / 100) * $_GET["pax"] . '</td>  
                          <td>' . $row["date"] . '</td> 
                         
                     </tr>  
                ';
            }

        }

        echo " <br>";
        echo "[";
        echo " <br>";
        echo "\n\n {";
        echo " <br>";
        echo " roomCode: \"STDSNGL\", ";
        echo " <br>";
        echo " Price:", json_encode($total_price_STDSNGL), "\n\n";
        echo " <br>";
       echo " \n\n}";
       echo " <br>";
       echo " \n\n{";
        echo " <br>";
        echo " roomCode: \"STDDBL\", ";
        echo " <br>";
        echo " Price:", json_encode($total_price_STDDBL), "\n\n";
        echo " <br>";
        echo " \n\n }";
        echo " <br>";
        echo " ]";

        echo " <br>";
        echo " <br>";
    }

    else
    {
        $output .= '  
                <tr>  
                     <td colspan="5">No Order Found</td>  
                </tr>  
           ';
    }

    $output .= '</table>';
    echo $output;
}





?>
