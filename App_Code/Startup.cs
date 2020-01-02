using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AdPortal.Startup))]
namespace AdPortal
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
