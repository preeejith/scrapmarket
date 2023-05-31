import 'package:flutter/material.dart';

class OrderTrackerPage extends StatefulWidget {
  const OrderTrackerPage({super.key});

  @override
  _OrderTrackerPageState createState() => _OrderTrackerPageState();
}

class _OrderTrackerPageState extends State<OrderTrackerPage> {
  List<Order> orders = [
    Order('Order 1', OrderStatus.accepted),
    Order('Order 2', OrderStatus.pending),
    Order('Order 3', OrderStatus.rejected),
    Order('Order 4', OrderStatus.accepted),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Tracker'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(orders[index].name),
            leading: Icon(
              _getStatusIcon(orders[index].status),
              color: _getStatusColor(orders[index].status),
            ),
            subtitle: Text(_getStatusText(orders[index].status)),
          );
        },
      ),
    );
  }

  IconData _getStatusIcon(OrderStatus status) {
    switch (status) {
      case OrderStatus.accepted:
        return Icons.check_circle;
      case OrderStatus.pending:
        return Icons.query_builder;
      case OrderStatus.rejected:
        return Icons.cancel;
      default:
        return Icons.error;
    }
  }

  Color _getStatusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.accepted:
        return Colors.green;
      case OrderStatus.pending:
        return Colors.orange;
      case OrderStatus.rejected:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _getStatusText(OrderStatus status) {
    switch (status) {
      case OrderStatus.accepted:
        return 'Accepted';
      case OrderStatus.pending:
        return 'Pending';
      case OrderStatus.rejected:
        return 'Rejected';
      default:
        return 'Unknown';
    }
  }
}

enum OrderStatus {
  accepted,
  pending,
  rejected,
}

class Order {
  String name;
  OrderStatus status;

  Order(this.name, this.status);
}
