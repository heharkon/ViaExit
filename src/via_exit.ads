with Ada.Containers;
with Ada.Containers.Ordered_Maps;
with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

package Via_Exit is

   type HTTP_Method is (GET, POST);

   type HTTP_Request is record
      Method       : HTTP_Method;
      Path         : Unbounded_String;
      Query        : Unbounded_String;
      Request_Body : Unbounded_String;
   end record;

   type HTTP_Response is record
      Status        : Natural;
      Headers       : Unbounded_String;
      Response_Body : Unbounded_String;
   end record;

   type HTTP_Handler_Access
      is access procedure (Request : HTTP_Request;
                           Response : in out HTTP_Response);

   package Route_Map is new Ada.Containers.Ordered_Maps
      (Key_Type => Unbounded_String, Element_Type => HTTP_Handler_Access);

   Routes : Route_Map.Map;

   procedure Register_Route (Path : Unbounded_String;
                             Handler : HTTP_Handler_Access);

   procedure Run;

end Via_Exit;