using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CswLibrarySite.Startup))]
namespace CswLibrarySite
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
