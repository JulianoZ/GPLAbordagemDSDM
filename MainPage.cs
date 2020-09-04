
public class MainPage {

public void SocketListenerAsync(){

	        Socket listenSock = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            listenSock.Bind(new IPEndPoint(IPAddress.Any, 1209));
            listenSock.Listen(1);// quantidade de conexoes
            while (true)
            {
                if (s_socket)
                {
                    byte[] recebida = new byte[1024];

                    using (Socket newConnection = listenSock.Accept())
                    {
                        newConnection.Receive(recebida);
                        string string_msg = Encoding.UTF8.GetString(recebida).Substring(0, Encoding.UTF8.GetString(recebida).IndexOf("\0"));
                        if (string_msg.Equals("handshake"))
                        {
                            byte[] msg_send = Encoding.UTF8.GetBytes("hi");
                            newConnection.Send(msg_send);
                        }
                        else
                        {
                            // verificar se possui a imagem
                            await Dispatcher.RunAsync(Windows.UI.Core.CoreDispatcherPriority.Normal, async () =>
                            {
                                if (imvideo.Text.Equals("Imagens"))
                                {
                                    if (imlocal.Text.Equals("ONLINE"))
                                    {
                                        for (int i = 0; i < produtos.Count; i++)
                                        {
                                            if ("selectbyname_" + produtos[i].Name == string_msg)
                                            {
                                                canvas.Children.Clear();
                                                canvas.Children.Add(imagens[i]);
                                            }
                                        }
                                    }
                                    else
                                    {
                                        for(int i = 0; i < imagens.Count; i++)
                                        {
                                            Debug.WriteLine(string_msg);
                                            Debug.WriteLine(imagens[i].Name.Substring(0, imagens[i].Name.Length - 4));
                                            if ("selectbyname_" + imagens[i].Name.Substring(0, imagens[i].Name.Length-4) == string_msg)
                                            {
                                                canvas.Children.Clear();
                                                canvas.Children.Add(imagens[i]);
                                            }
                                        }
                                    }
                                }
                            });
                        }
                    }
                }
        }
}

 private list<Image> list_imgs;

 private Image teste;

 public Image getTeste() {
  return teste;
 }

 public void setTeste(Image teste) {
  this.teste = teste;
 }
 private ImageControl imageControl;

 public ImageControl getImageControl() {
  return imageControl;
 }

 public void setImageControl(ImageControl imageControl) {
  this.imageControl = imageControl;
 }
 private int time;

 public int getTime() {
  return time;
 }

 public void setTime(int time) {
  this.time = time;
 }
   time = 2000;
public MainPage() {
   this.InitializeComponent();
}

public void AsyncTaksAsync() {
   String c;
   StorageFolder storageFolder = new StorageFolder();
   storageFolder = KnownFolders.PicturesLibrary;
   String folderName;
   folderName = "RALIBRARY";
   storageFolder = storageFolder.GetFolderAsync(folderName);
   list_imgs = imageControl.GetDiskImagesAsync(storageFolder);
   int contador;
   contador = 0;
   Image getImg;

   while (true){
      
   if (contador<list_imgs.Count){
         getImg = list_imgs[contador];
         imageControl.AddImgtoCanvasAsync(canvas, getImg);
   }   else{
         contador = 0;
      
   if (contador>0){
         getImg = list_imgs[contador];
         imageControl.AddImgtoCanvasAsync(canvas, getImg);
   }
   }

      contador++
         Task.Delay(time);
   }

}


}
