//Author: © Luis Ramirez 2008
//Web site: http://www.sqlnetframework.com
//Creation date: April 7, 2008

using System;
using System.Globalization;
using System.Web.UI;

namespace SqlNetFrameworkWebControls
{
    public class GoogleAnalyticsAspNetGridCounter : Control
    {
        public GoogleAnalyticsAspNetGridCounter()
        {
        }

        protected override void Render(HtmlTextWriter writer)
        {
            if (this.NamingContainer == null)
                throw new ApplicationException("The parent naming container cannot be null.");

            if (!(this.NamingContainer is IDataItemContainer))
                throw new ApplicationException("The parent container must implement the IDataItemContainer interface.");

            IDataItemContainer dataItemContainer = (IDataItemContainer)this.NamingContainer;

            writer.Write(string.Format(this.IndexFormat, dataItemContainer.DataItemIndex + this.IndexOffset));
        }

        public string IndexFormat
        {
            get
            {
                object o = this.ViewState["IndexFormat"];
                return (o == null) ? "{0}" : (string)o;
            }
            set
            {
                if (string.Compare(value, this.IndexFormat, true, CultureInfo.InvariantCulture) == 0)
                    return;

                this.ViewState["IndexFormat"] = value;
            }
        }

        public int IndexOffset
        {
            get
            {
                object o = this.ViewState["IndexOffset"];
                return (o == null) ? 0 : (int)o;
            }
            set
            {
                if (value == this.IndexOffset)
                    return;

                this.ViewState["IndexOffset"] = value;
            }
        }

    }
}
