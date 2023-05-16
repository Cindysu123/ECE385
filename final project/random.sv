///* Example 1.1 */
//program automatic test;
//    class pkt;
//        logic [15:0] pkt_size;
//
//        function new();
//            pkt_size = 100;
//        endfunction: new
//
//        function logic [7:0] get_num();
//            logic [7:0] scope_var;
//
//            // When this function is called, randomize class
//            // member var 'pkt_size' using the class's
//            // in-built randomize method
//            randomize(pkt_size);
//            // Using SV std lib's scope randomize this  
//            // function's local'scope_var'
//            std::randomize(scope_var);
//
//            $display("pkt.get_num: pkt_size %0d scope_var %0d",
//                pkt_size, scope_var);
//        endfunction: get_num
//    endclass: pkt
//
//    initial begin
//        pkt p;
//
//        p = new();
//        p.get_num();
//    end
//endprogram
