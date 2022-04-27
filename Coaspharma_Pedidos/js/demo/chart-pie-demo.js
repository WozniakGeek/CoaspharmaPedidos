// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example
function pintarPie(sedeId, available, OutService, Occupied, Assignment, Delivery, WaitDeleted, NumAvailable, NumOutService, NumOccupied, NumAssignment, NumDelivery, NumWaitDeleted) {

    let elemId = "myPieChart" + sedeId;
    var ctx = document.getElementById(elemId);
    var myPieChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: ["Disponible", "Ocupado", "Fuera de Servicio", "Solicitud de asignacion", "Solicitud de entrega", "Espera Borrado"],
            datasets: [{
                //data: [available, Occupied, OutService, Assignment, Delivery, WaitDeleted],
                data: [NumAvailable, NumOccupied, NumOutService, NumAssignment, NumDelivery, NumWaitDeleted],
                backgroundColor: ['#1cc88a', '#4e73df', '#e74a3b', '#f6c23e', '#36b9cc', '#858796'],
                hoverBackgroundColor: ['#79ecc2', '#7e98e7', '#ee8177', '#f8d16d', '#85d4e0', '#adaeb8'],
                hoverBorderColor: "rgba(234, 236, 244, 1)",
            }],
        },
        options: {
            maintainAspectRatio: false,
            tooltips: {
                backgroundColor: "rgb(255,255,255)",
                bodyFontColor: "#858796",
                borderColor: '#dddfeb',
                borderWidth: 1,
                xPadding: 15,
                yPadding: 15,
                displayColors: true,
                caretPadding: 10,
                
            },
            legend: {
                display: false
            },
            cutoutPercentage: 80,
        },
    });
}

