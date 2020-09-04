
public class ImageControl {

public list<Image> GetDiskImagesAsync(StorageFolder picturesFolder){

		List<Image> images = new List<Image>();
            await CoreApplication.MainView.CoreWindow.Dispatcher.RunAsync(
            CoreDispatcherPriority.Normal,async () => {
                IReadOnlyList<IStorageItem> itemsList = await picturesFolder.GetFilesAsync();
                foreach (var item in itemsList)
                {
                    await picturesFolder.TryGetItemAsync(item.Name);
                    if (item.Path.Contains(".jpg") || item.Path.Contains(".png"))
                    {
                        var uri = new System.Uri(item.Path);
                        var converted = uri.AbsoluteUri;
                        StorageFile file = await picturesFolder.GetFileAsync(item.Name);
                        BitmapImage bitmapImage = new BitmapImage();
                        FileRandomAccessStream stream = (FileRandomAccessStream)await file.OpenAsync(FileAccessMode.Read);
                        bitmapImage.SetSource(stream);
                        Image image = new Image();
                        image.Name = item.Name;
                        image.Source = bitmapImage;
                        images.Add(image);
                    }
                }
            });
            return images;        
}

public Task AddImgtoCanvasAsync(Canvas canvas, Image image_){

	await CoreApplication.MainView.CoreWindow.Dispatcher.RunAsync(
            CoreDispatcherPriority.Normal, () =>
            {
                canvas.Children.Clear();
                var bounds = Window.Current.Bounds;
                double height = bounds.Height;
                double width = bounds.Width;

                Image image = new Image()
                {
                    Height = height,
                    Width = width,
                    Source = image_.Source
                };
                Canvas.SetLeft(image, 0);
                Canvas.SetTop(image, 0);
                canvas.Children.Add(image);
    });
}


}
