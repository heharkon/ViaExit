package body Via_Exit is
   procedure Register_Route (Path : Unbounded_String;
                             Handler : HTTP_Handler_Access) is
   begin
      Routes.Insert (Path, Handler);
   end Register_Route;

   procedure Run is
      Request : HTTP_Request;
      Response : HTTP_Response;
   begin
      if Routes.Contains (Request.Path) then
         Routes.Element (Request.Path).all (Request, Response);
      else
         Response.Status := 404;
         Response.Headers := To_Unbounded_String ("Content-Type: text/plain");
         Response.Response_Body := To_Unbounded_String ("Not Found");
      end if;
   end Run;
begin
   null;
end Via_Exit;