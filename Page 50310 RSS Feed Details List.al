page 50310 RSSFeedDetails
{
    PageType = List;
    //PageType = API;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "RSS Feed Details";
    AccessByPermission = page RSSFeedDetails = x;

    layout
    {
        area(Content)
        {
            repeater(MsRepeater)
            {
                field("Entry No."; "Entry No.")
                {
                    ApplicationArea = All;
                }
                field(FeedCategoryItem; FeedCategoryItem)
                {
                    ApplicationArea = All;
                }
                field(FeedCopyRightInfo; FeedCopyRightInfo)
                {
                    ApplicationArea = All;
                }
                field(FeedId; FeedId)
                {
                    ApplicationArea = All;
                }
                field(FeedLinkItem; FeedLinkItem)
                {
                    ApplicationArea = All;
                }
                field(FeedPublishedOn; FeedPublishedOn)
                {
                    ApplicationArea = All;
                }
                field(FeedSummary; FeedSummary2)
                {
                    ApplicationArea = All;
                    DrillDown = true;
                    trigger OnValidate()
                    var
                        Rec_TempBlob: Record TempBlob;
                        Outstream1: OutStream;
                        Text1: Text;
                    begin
                        Clear(Rec_TempBlob);
                        Rec_TempBlob.Blob.CreateOutStream(Outstream1);
                        Outstream1.WriteText(Text1);
                        FeedSummary2 := Text1;
                        Rec.SummaryBlob := Rec_TempBlob.Blob;
                    end;

                    trigger OnDrillDown()
                    var
                        Rec_TempBlob: Record TempBlob;
                        Instream1: InStream;
                        Text1: Text;
                    begin
                        Clear(Rec_TempBlob);
                        Rec_TempBlob.Blob.CreateInStream(Instream1);
                        Rec_TempBlob.Blob := Rec.SummaryBlob;
                        Instream1.ReadText(Text1);
                        Message(Format(Text1));
                    end;
                }
                field(FeedTitle; FeedTitle)
                {
                    ApplicationArea = All;
                }
                field(FeedUpdatedOn; FeedUpdatedOn)
                {
                    ApplicationArea = All;
                }
                field(PrimaryFeedLink; PrimaryFeedLink)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {

        area(Processing)
        {
            action("Visit WebPage")
            {
                Image = Web;
                ApplicationArea = All;
                trigger OnAction()
                /*var
                    HttpClient1: HttpClient;
                    HttpResponse1: HttpResponseMessage;*/
                begin
                    //HttpClient1.Get(FeedLinkItem, HttpResponse1);
                    Hyperlink(FeedLinkItem);
                end;
            }
        }

    }


    var
        FeedSummary2: Text;

    trigger OnAfterGetCurrRecord()
    var
        Rec_TempBlob: Record TempBlob;
        Instream1: InStream;
        Text1: Text;
    begin
        Clear(Rec_TempBlob);
        Rec_TempBlob.Blob.CreateInStream(Instream1);
        Rec_TempBlob.Blob := Rec.SummaryBlob;
        Instream1.ReadText(Text1);
        FeedSummary2 := Text1;
    end;
}