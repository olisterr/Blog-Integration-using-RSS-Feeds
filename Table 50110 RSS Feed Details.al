
table 50210 "RSS Feed Details"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No';
            DataClassification = ToBeClassified;
            //AutoIncrement = true;
        }
        field(2; FeedCategoryItem; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3; FeedCopyRightInfo; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; FeedId; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; FeedLinkItem; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; FeedPublishedOn; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; FeedSummary; Text[250])
        {
            DataClassification = ToBeClassified;
            ObsoleteState = Removed;
        }
        field(8; FeedTitle; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9; FeedUpdatedOn; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(10; PrimaryFeedLink; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(11; UniqueGuid; Guid)
        {
            DataClassification = ToBeClassified;
        }
        field(12; SummaryBlob; Blob)
        {
            DataClassification = ToBeClassified;
        }


    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }



    trigger OnInsert()
    var
        No: Integer;
        Rec_RSSFeed: Record "RSS Feed Details";
    begin
        Clear(Rec_RSSFeed);
        IF Rec_RSSFeed.FindLast() then begin
            No := Rec_RSSFeed."Entry No.";
            Rec."Entry No." := No + 1;
        end
        else begin
            Rec."Entry No." := 1;
        end;
    end;

}