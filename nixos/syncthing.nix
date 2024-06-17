{...}:{
  services = {
    syncthing = {
      enable = true;
      user = "megadrage";
      dataDir = "/home/megadrage/Documents";
      configDir = "/home/megadrage/Documents/.config/syncthing";
      overrideDevices = true;  
      overrideFolders = true;
      guiAddress = "0.0.0.0:8384";
      settings = {
        devices = {
          "device1" = { id = "KOX2HLQ-A5HCQGN-TT6M2JS-HRHLFHJ-DWO57II-YZ7HHAS-KBKFYGV-EPEQGQ4"; };
          "device2" = { id = "MB754WK-QZ6RXJF-Z555CM7-NK6LWF5-M6HPTVA-OBHZOBT-ZRNULPJ-D4AF6AY"; };
        };
        folders = {
          "GTD" = {
            path = "/home/megadrage/Documents/GTD/"; 
            devices = [ "device1" "device2" ];
            versioning = { 
              type = "simple"; 
              params = { 
                keep = "3";
              }; 
            };
          };
        };
        gui = {
        user = "megadrage";
        password = "1234";
        };
      };
    };
  };
}