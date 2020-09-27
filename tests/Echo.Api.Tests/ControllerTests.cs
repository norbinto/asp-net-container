using System.Threading;
using System.Threading.Tasks;
using Echo.Api.Controllers;
using Microsoft.Extensions.Logging.Abstractions;
using Xunit;

namespace Echo.Api.Tests
{
    public class ControllerTests
    {
        [Fact]
        public async Task Test()
        {
            var controller = new EchoController(NullLogger<EchoController>.Instance);
            var message = "message";
            var response = await controller.Post(message, CancellationToken.None);
            Assert.Contains(message, response.Message);
        }
    }
}
